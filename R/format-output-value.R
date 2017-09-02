# internal environment for storing/rendering additional HTML dependencies
.html_dependencies <- new.env()
# append htmlwidget dependencies in this element
.html_dependencies$htmlwidgets <- list()



#' Format callback output
#'
#' This function is not intended for direct use by users, but has been exported
#' for development purposes.
#'
#' This (generic) function is called on the output value of callback
#' function(s) -- effectively providing a way for developers to provide
#' a bridge between an R object and (an existing) suitable dash component.
#'
#' @param x the output value from a callback function
#' @param ... additional arugments. Currently unused.
#' @export
format_output_value <- function(x, ...) {
  UseMethod("format_output_value")
}

#' @export
format_output_value.htmlwidget <- function(x, ...) {

  name <- class(x)[1]

  if (!is.null(x[["dependencies"]])) {
    stop(
      "Your ", name, " htmlwidget has additional HTML dependencies that you must ",
      "register with your dash via the dependencies_add() method",
      call. = FALSE
    )
  }

  if (!is.null(x[["elementId"]])) {
    warning(
      "elementId is ignored by dash. It uses the id specified in `htmlwidget()`",
      call. = FALSE
    )
  }

  # mimic some of the functionality in htmlwidgets:::toHTML()
  # https://github.com/ramnathv/htmlwidgets/blob/346f87c3/R/htmlwidgets.R#L158
  h <- htmltools::validateCssUnit(x[["height"]])
  w <- htmltools::validateCssUnit(x[["width"]])

  more_info <- list(
    style = sprintf("width:%s; height:%s;", w, h),
    class = paste(name, "html-widget")
  )

  c(more_info, x)
}

#' @export
format_output_value.plotly <- function(x, ...) {
  format_output_value.htmlwidget(plotly::plotly_build(x))
}

#' @export
format_output_value.default <- function(x, ...) x

