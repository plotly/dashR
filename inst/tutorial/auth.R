library(dashR)

source("styles.R")

ui <- htmlDiv(

  coreMarkdown(readLines("auth.md")),

  htmlImg(
    src = 'https://github.com/plotly/dash-docs/raw/master/images/basic-auth.gif',
    alt = 'Dash Basic Auth Example',
    style = list(
      width = '100%',
      border = 'thin lightgrey solid',
      `border-radius` = '4px'
    )
  ),

  coreMarkdown("Example Code:"),
  coreSyntaxHighlighter(
    readLines("examples/auth-basic.R"),
    language = 'r',
    customStyle = styles$code_container
  ),

  htmlH2("Plotly OAuth Example"),
  coreMarkdown("Logging in through Plotly OAuth looks like this:"),

  htmlImg(
    src = 'https://github.com/plotly/dash-docs/raw/master/images/plotly-auth.gif',
    alt = 'Dash Plotly OAuth Example',
    style = list(
      width = '100%',
      border = 'thin lightgrey solid',
      `border-radius` = '4px'
    )
  ),

  coreMarkdown("Example Code:"),

  coreSyntaxHighlighter(
    readLines("examples/auth-plotly.R"),
    language = 'r',
    customStyle = styles$code_container
  )

)
