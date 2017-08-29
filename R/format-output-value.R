#' Format callback output
#'
#' This (generic) function is called on the output value of callback
#' function(s) -- effectively providing a way for developers to provide
#' a more official way to leverage custom objects in a dash application.
#'
#' @param x the output value from a callback function
#' @param ... additional arugments. Currently unused.
#' @export
#'
format_output_value <- function(x, ...) {
  UseMethod("format_output_value")
}

format_output_value.plotly <- function(x, ...) {
  plotly::plotly_build(x)[["x"]][c("data", "layout")]
}

format_output_value.htmlwidget <- function(x, ...) x[["x"]]

format_output_value.default <- function(x, ...) x





