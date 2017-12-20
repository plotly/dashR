library(dasher)

# i.e., import styles
source("styles.R")

Syntax <- function(x, summary = '', language = 'r', style = styles$code_container) {
  htmlDetails(
    open = TRUE,
    htmlSummary(summary),
    coreSyntaxHighlighter(
      paste(x, collapse = "\n"),
      language = language,
      customStyle = style
    )
  )
}


Example <- function(...) {
  htmlDiv(..., className = 'example-container')
}
