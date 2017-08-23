# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

#' Input/Output/State definitions
#'
#' Use in conjunction with the `callback()` method from the [dasher::Dash] class.
#'
#' @name dependencies
#' @author Carson Sievert
#' @param component_id
#' @param component_property


#' @rdname dependencies
#' @export
deps_output <- function(component_id = NULL, component_property = NULL) {
  structure(
    dependency(component_id, component_property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
deps_input <- function(component_id = NULL, component_property = "value") {
  structure(
    dependency(component_id, component_property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
deps_state <- function(component_id = NULL, component_property = "value") {
  structure(
    dependency(component_id, component_property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(component_id = NULL, component_property = NULL) {
  list(
    component_id = component_id,
    component_property = component_property
  )
}
