library(dashR)

app <- Dash$new()

app$layout_set(
  htmlH1('Hello Dasher'),

  htmlDiv("Dasher: A web application framework for R."),

  coreGraph(
    id = 'example-graph',
    figure = list(
      data = list(
        list(x = c(1, 2, 3), y = c(4, 1, 2), type = 'bar', name = 'SF'),
        list(x = c(1, 2, 3), y = c(2, 4, 5), type = 'bar', name = 'Montréal')
      ),
      layout = list(title = "Dash Data Visualization")
    )
  )
)

app
