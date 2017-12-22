# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

#' Input/Output/State definitions
#'
#' Use in conjunction with the `callback()` method from the [dasher::Dash] class
#' to define the update logic in your application.
#'
#' @name dependencies
#' @author Carson Sievert
#' @param id a component id
#' @param property the component property to use


#' @rdname dependencies
#' @export
output <- function(id = NULL, property = "children") {
  structure(
    dependency(id, property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
input <- function(id = NULL, property = "value") {
  structure(
    dependency(id, property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
state <- function(id = NULL, property = "value") {
  structure(
    dependency(id, property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(id = NULL, property = NULL) {
  if (is.null(id)) stop("Must specify an id", call. = FALSE)
  list(
    id = id,
    property = property,
    key = paste0(id, ".", property)
  )
}
