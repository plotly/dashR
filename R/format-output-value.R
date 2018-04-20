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
#' @param user_deps user specified HTML dependencies
#' @param ... additional arugments. Currently unused.
#' @export
format_output_value <- function(x, user_deps, ...) {
  UseMethod("format_output_value")
}

#' @export
format_output_value.htmlwidget <- function(x, user_deps, ...) {

  # same 'payload' that htmlwidgets attaches to the widget div
  # https://github.com/ramnathv/htmlwidgets/blob/346f87c3/R/htmlwidgets.R#L241-L259
  # https://github.com/ramnathv/htmlwidgets/blob/160872d/inst/www/htmlwidgets.js#L617-L626
  payload <- dashHtmlwidgetComponent::widget_payload(x)

  # check and see if we're missing any of the widget's run-time dependencies...
  # someday we not have to worry about this -- https://github.com/plotly/dashHtmlwidgetComponent/issues/5
  runTimeDeps <- setdiff(payload[["dependencies"]], user_deps)
  if (length(runTimeDeps)) {
    # get the widget's name/package
    # https://github.com/ramnathv/htmlwidgets/blob/160872d/R/htmlwidgets.R#L191-L192
    name <- class(x)[1]
    package <- attr(x, "package")
    stop(
      sprintf("The htmlwidget '%s' from the '%s' package", name, package),
      "has HTML dependencies that must be added to the dashR user_deps via the dependencies_set() method. Here are those dependencies:\n\n",
      paste(utils::capture.output(print(runTimeDeps)), collapse = "\n"),
      call. = FALSE
    )
  }

  payload
}

#' @export
format_output_value.default <- function(x, user_deps, ...) x

