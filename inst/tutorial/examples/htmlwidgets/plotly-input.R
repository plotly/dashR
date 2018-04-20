library(dashR)
library(plotly)

app <- Dash$new()

app$layout_set(
  Htmlwidget(
    id = 'plotID',
    widget = plot_ly(mtcars, x = ~wt, y = ~mpg, key = row.names(mtcars), set = "plotID")
  ),
  htmlDiv(id = 'event')
)

app$callback(
  function(inputs = input("plotID", property = "ctSelection")) {
    if (!length(inputs)) "Click on a point" else inputs
  },
  output(id = 'event')
)

# plotly has 'run-time' dependencies that must be registered before
# the application is launched. For other htmlwidgets, this may not
# be necessary.
app$dependencies_set(plot_ly()$dependencies)
app$run_server()
