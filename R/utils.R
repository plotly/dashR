# ----------------------------------------------------------------------------
# Class assertion
# ----------------------------------------------------------------------------

is.fire <- function(x) {
  inherits(x, "Fire")
}

is.component <- function(x) {
  inherits(x, "component")
}

is.html_component <- function(x) {
  inherits(x, c("component", "html"))
}

is.core_component <- function(x) {
  inherits(x, c("component", "core"))
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

  render_fun <- getFromNamespace("renderDependencies", asNamespace("htmltools"))

  # deps is an internal list of HTML dependency objects generated in inst/update_assets.R
  all_names <- sapply(deps, `[[`, "name")
  names <- names %||% all_names

  depz <- list()
  for (i in seq_along(names)) {
    depz[[i]] <- which(all_names %in% names[[i]])
  }

  if (external) {
    stop("not yet implemented")
  }

  render_fun(depz)
}
