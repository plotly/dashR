library(dashR)

ui <- htmlDiv(
  htmlH2("DashR Installation"),
  coreMarkdown(
    "**dashR** isn't yet available on CRAN,",
    "but you may install the development version with:"
  ),
  coreSyntaxHighlighter(
    language = "r",
    "devtools::install_github('plotly/dashR')"
  ),
  htmlDiv(
    'Ready? Now, get started with the ',
    coreLink('DashR Tutorial - Part 1', href = '/dashR/getting-started'),
    '.'
  )
)

app <- Dash$new()
app$layout_set(ui)
app
