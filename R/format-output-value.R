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

  if (!is.null(x[["elementId"]])) {
    warning(
      "elementId is ignored by dash. It uses the id specified in `htmlwidget()`",
      call. = FALSE
    )
  }

  # mimics some of the functionality in htmlwidgets:::toHTML()
  # https://github.com/ramnathv/htmlwidgets/blob/346f87c3/R/htmlwidgets.R#L158
  create_payload <- getFromNamespace("createPayload", asNamespace("htmlwidgets"))
  resolve_sizing <- getFromNamespace("resolveSizing", asNamespace("htmlwidgets"))
  list(
    x = create_payload(x),
    # TODO: auto-magically handle this so user doesn't have to specify?
    name = class(x)[1],
    sizingPolicy = resolve_sizing(x, x$sizingPolicy, TRUE),
    width = x$width,
    height = x$height,
    dependencies = resourcify(x$dependencies)
  )
}

#' @export
format_output_value.plotly <- function(x, ...) {
  format_output_value.htmlwidget(plotly::plotly_build(x))
}

#' @export
format_output_value.default <- function(x, ...) x

