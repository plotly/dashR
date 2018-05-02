library(runpkg)
bs <- runpkg::download_files('bootstrap', 'dist/css/bootstrap.css')

library(dashR)
app <- Dash$new()
app$dependencies_set(bs)

app$layout_set(
  htmlDiv(
    className = 'row',
    htmlDiv(
      className = 'col-md-4',
      style = list('background-color' = 'red'),
      'A div with class col-md-4'
    ),
    htmlDiv(
      className = 'col-md-8',
      style = list('background-color' = 'green'),
      'A div with class col-md-8'
    )
  )
)

app
