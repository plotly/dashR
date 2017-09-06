library(dasher)
library(plotly)

app <- Dash$new()

app$layout_set(
  htmlwidget(id = 'plot', 'plotly')
)

app$callback(
  function() plot_ly(),
  output(id = 'plot')
)

# TODO: better way to incorporate print time dependencies?
app$dependencies_get()
app$dependencies_set(plotly::plot_ly()$dependencies, "header", 4:7)
app$dependencies_get()

app$run_server(showcase = TRUE)
