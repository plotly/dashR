library(dasher)
library(plotly)

app <- Dash$new()

nms <- names(mtcars)

app$layout_set(
  coreDropdown(
    id = "x", options = nms, value = nms[1],
    clearable = FALSE, placeholder = "Pick an x"
  ),
  coreDropdown(
    id = "y", options = nms, value = nms[2],
    clearable = FALSE, placeholder = "Pick a y"
  ),
  # name of the htmlwidget is required!
  # package name is only required if the widget name differs from the package name
  Htmlwidget(id = 'plotID', name = "plotly")
)

app$callback(
  function(x = input("x"), y = input("y")) {
    plot_ly(x = mtcars[[x]], y = mtcars[[y]])
  },
  output(id = 'plotID', property = "widget")
)

# plotly has 'run-time' dependencies that must be registered before
# the application is launched. For other htmlwidgets, this may not
# be necessary.
app$dependencies_set(plot_ly()$dependencies)
app$run_server()
