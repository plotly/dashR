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
format_output_value <- function(x, dependencies, ...) {
  UseMethod("format_output_value")
}

#' @export
format_output_value.htmlwidget <- function(x, dependencies, ...) {

  # same 'payload' that htmlwidgets attaches to the widget div
  # https://github.com/ramnathv/htmlwidgets/blob/346f87c3/R/htmlwidgets.R#L241-L259
  # https://github.com/ramnathv/htmlwidgets/blob/160872d/inst/www/htmlwidgets.js#L617-L626
  payload <- dashHtmlwidgetComponent::widget_payload(x)

  # return the payload if we aren't missing any dependencies...
  # (htmlwidget dependencies can't be completely determined until run/print time)
  missingDependencies <- setdiff(payload[["dependencies"]], dependencies)
  if (!length(missingDependencies)) return(payload)

  # someday we might be able to register dependencies in a callback,
  # but for now, we throw an error
  # https://github.com/plotly/dashHtmlwidgetComponent/issues/5
  name <- class(x)[1]
  package <- attr(x, "package")
  stop(
    sprintf("The htmlwidget '%s' from the '%s' package ", name, package),
    "has HTML dependencies must be added via the dependencies_set() method. ",
    "Here are those dependencies:\n\n",
    paste(utils::capture.output(print(missingDependencies)), collapse = "\n"),
    call. = FALSE
  )
}

#' @export
format_output_value.default <- function(x, user_deps, ...) x

