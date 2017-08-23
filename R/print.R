#' Print a dash component object
#'
#' @param x an object of class dash_component
#' @param ... not currently used
#' @author Carson Sievert
#' @export

print.dash_component <- function(x, ...) {
  print(to_JSON(x, pretty = TRUE))
  x
}
