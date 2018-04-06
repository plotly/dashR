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

  # elementId is ignored for reasons similar to shiny
  if (!is.null(x[["elementId"]])) {
    warning(
      "elementId is ignored by dash. It uses the id specified in `htmlwidget()`",
      call. = FALSE
    )
  }

  # until we can dynamically load component suites, run-time dependencies need to be provided
  # before the application is launched
  runTimeDeps <- setdiff(x[["dependencies"]], user_deps)
  if (length(runTimeDeps)) {
    stop(
      sprintf("The htmlwidget '%s' from the '%s' package", name, package),
      "has HTML dependencies that must be added to the dasher user_deps via the dependencies_set() method. Here are those dependencies:\n\n",
      paste(utils::capture.output(print(runTimeDeps)), collapse = "\n"),
      call. = FALSE
    )
  }

  # same 'payload' that htmlwidgets attaches to the widget div
  # https://github.com/ramnathv/htmlwidgets/blob/346f87c3/R/htmlwidgets.R#L241-L259
  # https://github.com/ramnathv/htmlwidgets/blob/160872d/inst/www/htmlwidgets.js#L617-L626
  getFromNamespace("createPayload", asNamespace("htmlwidgets"))(x)
}

#' @export
format_output_value.plotly <- function(x, user_deps, ...) {
  format_output_value.htmlwidget(plotly::plotly_build(x), user_deps, ...)
}

#' @export
format_output_value.default <- function(x, user_deps, ...) x

