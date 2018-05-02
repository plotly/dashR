library(dashR)

app <- Dash$new()

colors <- list(
  background = '#111111',
  text = '#7FDBFF'
)

pageTitle <- htmlH1(
  'Hello Dash',
  style = list(
    textAlign = 'center',
    color = colors$text
  )
)

pageSubTitle <- htmlDiv(
  'DashR: A web application framework for R.',
  style = list(
    textAlign = 'center',
    color = colors$text
  )
)

graph <- coreGraph(
  id = 'example-graph-2',
  figure = list(
    data = list(
      list(x = c(1, 2, 3), y = c(4, 1, 2), type = 'bar', name = 'SF'),
      list(x = c(1, 2, 3), y = c(2, 4, 5), type = 'bar', name = 'Montréal')
    ),
    layout = list(
      plot_bgcolor = colors$background,
      paper_bgcolor = colors$background,
      font = list(color = colors$text)
    )
  )
)

app$layout_set(
  htmlDiv(
    pageTitle,
    pageSubTitle,
    graph,
    style = list(backgroundColor = colors$background)
  )
)


app
