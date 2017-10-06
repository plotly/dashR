library(dasher)
library(plotly)

app <- Dash$new()

app$layout_set(
  htmlwidget(id = 'plot', 'plotly')
)

app$callback(
  function() plot_ly(),
  # TODO: change x to value!?
  output(id = 'plot', property = "x")
)

# TODO: better way to incorporate print time dependencies?
app$dependencies_get()
app$dependencies_set(plotly::plot_ly()$dependencies)
app$dependencies_get()

app$run_server(showcase = TRUE)
