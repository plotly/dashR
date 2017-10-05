# ----------------------------------------------------------------------------
# Class assertion
# ----------------------------------------------------------------------------

# fiery server
is.fire <- function(x) inherits(x, "Fire")

# dependencies
is.dependency <- function(x) inherits(x, "dash_dependency")
is.output <- function(x) is.dependency(x) && inherits(x, "output")
is.input <- function(x) is.dependency(x) && inherits(x, "input")
is.state <- function(x) is.dependency(x) && inherits(x, "state")

# layout is really a special type of component
is.layout <- function(x) inherits(x, "dash_layout")

# components (TODO: this should be exported by dashTranspileR!)
is.component <- function(x) inherits(x, "dash_component")

# search through a component (a recursive data structure) for a component with
# a given id and return the component's type
component_props_given_id <- function(component, id) {

  if (!is.component(component))  {
    stop(
      "Either no id of value '", id,
      "' exists or the `component` argument is not a component",
      call. = FALSE
    )
  }
  if (identical(id, component$props$id))  {
    return(component$propNames)
  }

  unlist(lapply(component$props$children, component_props_given_id, id))
}


assert_fun_is_callback <- function(fun = NULL) {

  assertthat::assert_that(is.function(fun))

  # TODO: do we ever have to worry about the eval envir here?
  inputz <- lapply(formals(fun), eval)
  is_inputy <- vapply(inputz, function(x) is.input(x) || is.state(x), logical(1))

  # TODO: relax this assumption!!
  if (!all(is_inputy)) {
    stop(
      "Argument values of callback function (`fun`) must be input/state",
      "objects created via `input()`/`state()`. \n\n",
      sprint(
        "I found a problem with these arguments: '%s'",
        paste(names(inputz)[!is_inputy], collapse = "', '")
      ),
      call. = FALSE
    )
  }

  invisible(TRUE)
}


# ----------------------------------------------------------------------------
# Security stuff
# ----------------------------------------------------------------------------

# https://github.com/plotly/dash/blob/064c811d/dash/dash.py#L165-L176
#create_access_codes <- function() {
#  now <- Sys.time()
#  list(
#    access_granted = new_token(),
#    expiration = list()
#  )
#}


new_token <- function() {
  digest::sha1(new_id())
}

new_id <- function() {
  basename(tempfile(""))
}

# ----------------------------------------------------------------------------
# HTML dependency helpers
# ----------------------------------------------------------------------------


# A shim for  htmltools::renderDependencies
# @param dependencies a list of HTML dependencies
# @param external point to an external CDN rather local files?
render_dependencies <- function(x, local = TRUE) {
  # TODO: the default `encodeFunc` doesn't seem to work?
  htmltools::renderDependencies(
    x, if (local) "file" else "href", encodeFunc = identity
  )
}

# Similar to htmltools::resolveDependencies(), but allows
# pkgload:::shim_system.file() to work it's magic in dev mode
# (i.e., pkgload::load_all())
resolve_dependencies <- function(x, resolvePackageDir = TRUE) {

  x <- htmltools::resolveDependencies(x, FALSE)

  if (resolvePackageDir) {
    x <- lapply(x, function(dep) {
      if (is.null(dep$package)) return(dep)
      dir <- dep$src$file
      if (!is.null(dir)) dep$src$file <- system.file(dir, package = dep$package)
      dep$package <- NULL
      dep
    })
  }

  x
}

resourcify <- function(dependencies, libdir = tempdir()) {

  lapply(dependencies, function(dep) {
    dep <- htmltools::copyDependencyToDir(dep, libdir)
    htmltools::makeDependencyRelative(dep, libdir)
  })
}

widget_dependency <- function(name = NULL, package = name) {
  htmlwidgets::getDependency(name, package)
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

compact <- function(x) {
  Filter(Negate(is.null), x)
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
