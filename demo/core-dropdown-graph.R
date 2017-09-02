library(dasher)
library(plotly)

app <- Dash$new()

nms <- names(mtcars)

app$layout_set(
  core_dropdown(id = "x", options = nms, value = nms[1]),
  core_dropdown(id = "y", options = nms, value = nms[2]),
  core_graph(id = 'plot')
)

app$callback(
  function(x = input("x"), y = input("y")) {
    plot_ly(x = mtcars[[x]], y = mtcars[[y]])
  },
  output("plot")
)

app$run_server(showcase = TRUE)
