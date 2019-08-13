# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

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
  structure(
    dependency(id, property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
input <- function(id, property) {
  structure(
    dependency(id, property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
state <- function(id, property) {
  structure(
    dependency(id, property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(id = NULL, property = NULL) {
  if (is.null(id)) stop("Must specify an id", call. = FALSE)
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
