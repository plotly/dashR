library(htmltools)

# download the dash styleguide https://codepen.io/chriddyp/pen/bWLwgP
styleGuide <- "https://codepen.io/chriddyp/pen/bWLwgP.css"
tmpDir <- tempdir()
download.file(
  styleGuide, file.path(tmpDir, basename(styleGuide))
)

# create a htmlDependency() object representing the CSS dependency
styleDep <- htmlDependency(
  name = "dash-style-guide",
  version = "0.0.1",
  # defining both file & href enables both local & remote rendering
  src = c(
    file = tmpDir,
    href = dirname(styleGuide)
  ),
  stylesheet = basename(styleGuide),
  all_files = FALSE
)

library(dashR)
app <- Dash$new()
app$dependencies_set(styleDep)
app$layout_set(
  htmlDiv(
    className = 'row',
    htmlDiv(
      className = 'one column',
      style = list('background-color' = 'lightgrey'),
      'One'
    ),
    htmlDiv(
      className = 'eleven columns',
      style = list('background-color' = 'lightgrey'),
      'Eleven'
    )
  )
)

app
