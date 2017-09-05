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

# Render HTML dependencies ()

# @param dependencies a list of HTML dependencies
# @param external point to an external CDN rather local files?
render_dependencies <- function(dependencies = list(), external = FALSE) {

  dependencies <- filter_null(dependencies)

  if (external) {
    stop("not yet implemented")
  }

  # TODO: why does the default for `encodeFunc` not work?
  htmltools::renderDependencies(dependencies, encodeFunc = identity)
}

# TODO: This is the exact same as htmltools::resolveDependencies,
# but by manually copying, it allows pkgload:::shim_system.file() to work
# it's magic and find files in dev mode (i.e., pkgload::load_all())
resolve_dependencies <- function (dependencies, resolvePackageDir = TRUE) {
  deps <- dependencies[!sapply(dependencies, is.null)]
  depnames <- sapply(deps, `[[`, "name")
  depvers <- numeric_version(sapply(deps, `[[`, "version"))
  return(lapply(unique(depnames), function(depname) {
    sorted <- order(ifelse(depnames == depname, TRUE, NA),
                    depvers, na.last = NA, decreasing = TRUE)
    dep <- deps[[sorted[[1]]]]
    if (resolvePackageDir && !is.null(dep$package)) {
      dir <- dep$src$file
      if (!is.null(dir)) dep$src$file <- system.file(dir, package = dep$package)
      dep$package <- NULL
    }
    dep
  }))
}


# get dependencies from an htmlwidget object
# https://github.com/ramnathv/htmlwidgets/pull/255
widget_dependencies <- function(w) {
  if (!inherits(w, "htmlwidget")) {
    warning("Expected an htmlwidget object", call. = FALSE)
    return(NULL)
  }

  c(
    htmlwidgets::getDependency(class(w)[1], package = attr(w, "package")),
    w$dependencies
  )
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
