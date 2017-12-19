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
  htmlwidget(id = 'plot', name = "plotly")
)

app$callback(
  function(x = input("x"), y = input("y")) {
    plot_ly(x = mtcars[[x]], y = mtcars[[y]])
  },
  # TODO: change x to value!?
  output(id = 'plot', property = "x")
)

# TODO: better way to incorporate print time dependencies?
app$dependencies_get()
app$dependencies_set(plotly::plot_ly()$dependencies)
app$dependencies_get()

app
