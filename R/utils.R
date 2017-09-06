# ----------------------------------------------------------------------------
# Class assertion
# ----------------------------------------------------------------------------

# fiery server
is.fire <- function(x) inherits(x, "Fire")

# components
is.component <- function(x) inherits(x, "dash_component")
is.html_component <- function(x) inherits(x, "dash_html")
is.core_component <- function(x) inherits(x, "dash_core")

# dependencies
is.dependency <- function(x) inherits(x, "dash_dependency")
is.output <- function(x) is.dependency(x) && inherits(x, "output")
is.input <- function(x) is.dependency(x) && inherits(x, "input")
is.state <- function(x) is.dependency(x) && inherits(x, "state")

# layout
is.layout <- function(x) inherits(x, "dash_layout")

# for flagging dependencies to be place in the header
is.header <- function(x) inherits(x, "header")

# search through a component (a recursive data structure) for a component with
# a given id and return the component's type
component_type_given_id <- function(component, id) {

  if (!is.component(component))  {
    stop(
      "Either no id of value '", id,
      "' exists or the `component` argument is not a component",
      call. = FALSE
    )
  }
  if (identical(id, component$props$id))  {
    prefix <- if (is.html_component(component)) "html_" else if (is.core_component(component)) "core_" else ""
    return(paste0(prefix, tolower(component$type)))
  }

  unlist(lapply(component$props$children, component_type_given_id, id))
}

# once we know the component type, return the valid properties
# TODO: throw an informative error if type is not referring a component function
component_props_given_type <- function(type) {
  c("children", names(formals(match.fun(type)))[-1])
}


# ----------------------------------------------------------------------------
# Component children assertion
# ----------------------------------------------------------------------------

assert_valid_children <- function(...) {

  kids <- list(...)
  if (length(kids) == 0) return(NULL)

  assert_no_names(kids)
  #kids[vapply(kids, assert_is_valid_type, logical(1))]
}


assert_no_names <- function(x) {
  nms <- names(x)
  if (!is.null(nms)) {
    stop(
      sprintf(
        "Didn't recognize the following named arguments: '%s'",
        paste(nms, collapse = "', '")
      ),
      call. = FALSE
    )
  }
  setNames(x, NULL)
}

assert_is_valid_type <- function(x) {

  # TODO: should we allow shiny/htmltools tags?
  #if (is.component(x) || inherits(x, "shiny.tag")) {
  if (is.component(x)) {
    return(TRUE)
  }

  stop("Didn't recognize object of class: ", class(x), call. = FALSE)
}

# ----------------------------------------------------------------------------
# Security stuff
# ----------------------------------------------------------------------------

# https://github.com/plotly/dash/blob/064c811d/dash/dash.py#L165-L176
create_access_codes <- function() {
  now <- Sys.time()
  list(
    access_granted = new_token(),
    expiration = list()
  )
}


new_token <- function() {
  digest::sha1(new_id())
}

new_id <- function() {
  basename(tempfile(""))
}

# ----------------------------------------------------------------------------
# HTML dependency helpers
# ----------------------------------------------------------------------------

# Create a tidy html dependency data structure
#
# A building block for adding/getting/computing/rendering dependencies
#
# @param dependencies a list-column of [htmltools::htmlDependencies]
# @param section place dependency in <head> or <footer>?
# @param priority used to rank dependencies within a section
# @return a tibble with a special 'dash_html_dependencies' class

dependency_tbl <- function(dependencies = NULL, section = NULL, priority = NULL) {

  if (!length(dependencies)) return(dependency_tbl_empty())

  # do a sensible thing if just a single dependency is provided
  if (inherits(dependencies, "html_dependency")) {
    dependencies <- list(dependencies)
  }

  # ensure we have a list of htmltools::htmlDependency
  is_dep <- vapply(dependencies, inherits, logical(1), "html_dependency")
  if (any(!is_dep)) {
    stop("`dependencies` must be a *list* of htmlDependency(s)", call. = FALSE)
  }

  # if section is specified, make sure it is done properly
  if (any(!section %in% c("header", "footer"))) {
    stop("`section` must have a value of 'header' or 'footer'", call. = FALSE)
  }

  tbl <- tibble::tibble(
    dependencies = dependencies,
    section = section %||% factor("footer", levels = c("header", "footer")),
    priority = priority %||% seq_along(dependencies)
  )
  oldClass(tbl) <- c(oldClass(tbl), "dash_html_dependencies")

  # name might be missing
  tbl$name <- vapply(tbl$dependencies, function(x) x$name %||% NA_character_, character(1))

  tbl
}


dependency_tbl_empty <- function() {
  tbl <- tibble::tibble(
    dependencies = list(),
    section = factor(character(0), levels = c("header", "footer")),
    priority = integer(0)
  )
  oldClass(tbl) <- c(oldClass(tbl), "dash_html_dependencies")
  tbl
}


# A shim for  htmltools::renderDependencies
# @param dependencies a list of HTML dependencies
# @param external point to an external CDN rather local files?
render_dependencies <- function(tbl, local = TRUE) {

  if (!local) {
    tbl$dependencies <- lapply(tbl$dependencies, function(dep) {
      dep$src$file <- NULL
      dep
    })
  }

  # TODO: why does the default for `encodeFunc` not work?
  htmltools::renderDependencies(tbl$dependencies, encodeFunc = identity)
}

# Similar to htmltools::resolveDependencies(), but works on dependency tibbles,
# and allows pkgload:::shim_system.file() to work
# it's magic and find files in dev mode (i.e., pkgload::load_all())
resolve_dependencies <- function(tbl, resolvePackageDir = TRUE) {

  versions <- numeric_version(sapply(tbl$dependencies, `[[`, "version"))
  tbl <- tbl[order(tbl$name, versions, decreasing = TRUE), ]
  tbl <- tbl[!duplicated(tbl$name), ]

  tbl$dependencies <- lapply(tbl$dependencies, function(dep) {
    if (resolvePackageDir && !is.null(dep$package) && !is.null(dep$src$file)) {
      dep$src$file <- system.file(dep$src$file, package = dep$package)
    }
    dep
  })

  tbl
}


widget_dependency <- function(name = NULL, package = name) {
  htmlwidgets::getDependency(name, package)
}

htmlwidgets_react <- function() {
  htmltools::htmlDependency(
    name = "htmlwidgets-react",
    version = packageVersion("dasher"),
    package = "dasher",
    src = c(file = "/lib"),
    script = "htmlwidgets-react.js"
  )
}

# # get dependencies from an htmlwidget object
# # https://github.com/ramnathv/htmlwidgets/pull/255
# widget_dependencies <- function(w) {
#   if (!inherits(w, "htmlwidget")) {
#     warning("Expected an htmlwidget object", call. = FALSE)
#     return(NULL)
#   }
#
#   c(
#     htmlwidgets::getDependency(class(w)[1], package = attr(w, "package")),
#     w$dependencies
#   )
# }


# ----------------------------------------------------------------------------
# Other (generic) helpers
# ----------------------------------------------------------------------------

"%||%" <- function(x, y) {
  if (length(x)) x else y
}

# same as plotly:::to_JSON
to_JSON <- function(x, ...) {
  jsonlite::toJSON(x, digits = 50, auto_unbox = TRUE, force = TRUE,
                   null = "null", na = "null", ...)
}

filter_null <- function(x) {
  if (length(x) == 0 || !is.list(x)) return(x)
  x[!vapply(x, is.null, logical(1))]
}

tryNULL <- function(expr) {
  tryCatch(expr, error = function(e) NULL)
}

setdiffsym <- function(x, y) {
  setdiff(union(x, y), intersect(x, y))
}

welcome_page <- function() {
  html_div(
    html_h2("Welcome to dash!"),
    "If you see this message, you may not have yet specified a layout in your application."
  )
}

stop_report <- function(msg = "") {
  stop(
    msg, "\n\n",
    "Please let us know about this error via ",
    "https://github.com/plotly/dasher/issues/new",
    call. = FALSE
  )
}
