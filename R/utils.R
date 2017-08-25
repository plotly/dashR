# ----------------------------------------------------------------------------
# Class assertion
# ----------------------------------------------------------------------------

is.fire <- function(x) {
  inherits(x, "Fire")
}

# components
is.component <- function(x) inherits(x, "dash_component")
is.html_component <- function(x) inherits(x, "dash_html")
is.core_component <- function(x) inherits(x, "dash_core")

# dependencies
is.dependency <- function(x) inherits(x, "dash_dependency")
is.output <- function(x) is.dependency(x) && inherits(x, "output")
is.input <- function(x) is.dependency(x) && inherits(x, "input")
is.state <- function(x) is.dependency(x) && inherits(x, "state")


# search through a component (a recursive data structure) for a component with
# a given id and return the component's type
component_infer_type <- function(component, id) {

  if (!is.component(component))  {
    stop(
      "Either no id of value '", id,
      "' exists or the `component` argument is not a component",
      call. = FALSE
    )
  }
  if (identical(id, component$props$id))  {
    prefix <- if (is.html_component(component)) "html_" else "core_"
    return(paste0(prefix, tolower(component$type)))
  }

  unlist(lapply(component$props$children, component_infer_type, id))
}

# once we know the component type, return the valid properties
# TODO: throw an informative error if type is not referring a component function
infer_props <- function(type) {
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
# Other helpers
# ----------------------------------------------------------------------------

"%||%" <- function(x, y) {
  if (is.null(x)) y else x
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

setdiffsym <- function(x, y) {
  setdiff(union(x, y), intersect(x, y))
}

welcome_page <- function() {
  html_div(
    html_h2("Welcome to dash!"),
    "If you see this message, you may not have yet specified a layout in your application."
  )
}

# @param names a character string matching the names
# @param whether to point to an external CDN rather local files
render_dependencies <- function(names = NULL, external = FALSE) {

  # deps is an internal list of HTML dependency objects generated in inst/update_assets.R
  all_names <- sapply(deps, `[[`, "name")
  names <- names %||% all_names

  depz <- list()
  for (i in seq_along(names)) {
    depz[[i]] <- deps[[which(all_names %in% names[[i]])]]
  }

  if (external) {
    stop("not yet implemented")
  }

  # TODO: why does the default for `encodeFunc` not work?
  htmltools::renderDependencies(depz, encodeFunc = identity)
}
