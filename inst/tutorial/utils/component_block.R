library(dasher)

#' A code block
#'
#' Insert a code chunk in a dasher application with it's result embedded afterwards.
#'
#' @param f a formula
#' @param customStyle see [coreSyntaxHighlighter].
#' @param ... other arguments passed onto [coreSyntaxHighlighter].
#' @examples
#'
#' block <- ComponentBlock(
#'   ~coreDropdown(
#'     options = c(
#'       'New York City' = 'NYC',
#'       'Montréal' = 'MTL',
#'       'San Francisco' = 'SF'
#'     ),
#'     value = "MTL"
#'   )
#' )
#' app <- Dash$new()
#' app$layout_set(block)
#' app$run_server(showcase = TRUE)
#'
ComponentBlock <- function(f, customStyle = list(borderLeft = 'thin lightgrey solid'), ...) {
  # TODO: use plain expressions instead? That would make it more user friendly
  if (!inherits(f, "formula")) stop("f must be a formula", call. = FALSE)
  txt <- styler::style_text(deparse(f))
  # coreSyntaxHighlighter() doesn't like character strings with length > 1...
  string <- paste(txt, collapse = "\n")
  htmlDiv(
    coreSyntaxHighlighter(
      # removes the starting ~ (isn't always correct, but good enough for the tutorial)
      substr(string, 2, nchar(string)),
      language = 'r',
      customStyle = customStyle,
      ...
    ),
    htmlDiv(
      className = 'example-container',
      lazyeval::f_eval(f)
    )
  )
}
