library(dasher)

ui <- htmlDiv(
  coreMarkdown(
    "
## Dasher Installation

**dasher** isn't yet available on CRAN, but you may install the development version with:
"
  ),
  coreSyntaxHighlighter(
    language = "r",
    "devtools::install_github('plotly/dasher')"
  ),
  htmlDiv(
    'Ready? Now, get started with the ',
    coreLink('Dasher Tutorial - Part 1', href = '/dasher/getting-started'),
    '.'
  )
)

app <- Dash$new()
app$layout_set(ui)
app
