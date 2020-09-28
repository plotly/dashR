# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

# Helper functions
setWildcardId <- function(id) {
  return(sprintf('{"index":["%s"],"type":"%s"}', id[['index']], id[['type']]))
}

#' Input/Output/State definitions
#'
#' Use in conjunction with the `callback()` method from the [dash::Dash] class
#' to define the update logic in your application.
#'
#' The `dashNoUpdate()` function permits application developers to prevent a
#' single output from updating the layout. It has no formal arguments.
#' 
#' @name dependencies
#' @param id a component id
#' @param property the component property to use

#' @rdname dependencies
#' @export
output <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
input <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
state <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(id = NULL, property = NULL) {
  if (is.null(id)) stop("Must specify an id", call. = FALSE)
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  list(
    id = id,
    property = property
  )
}

#' @rdname dependencies
#' @export
dashNoUpdate <- function() {
  x <- list(NULL)
  class(x) <- "no_update"
  return(x)
}
