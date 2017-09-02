library(dasher)
library(plotly)

app <- Dash$new()

app$layout_set(
  htmlwidget(id = 'plot', "plotly")
)

app$callback(
  function() plot_ly(),
  output('plot')
)

app$run_server(showcase = TRUE)
