#' Output a dash component object as JSON 
#'
#' Objects of the `dash_component` class support a `print` method,
#' which first processes the nested list object, and then returns
#' its JSON representation.
#'
#' @param x an object of class dash_component
#' @param ... not currently used
#' @export

print.dash_component <- function(x, ...) {
  print(to_JSON(x, pretty = TRUE))
  x
}
