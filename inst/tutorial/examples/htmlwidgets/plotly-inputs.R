library(dashR)
library(dashRwidgets)
library(plotly)

app <- Dash$new()

p <- plot_ly(mtcars, x = ~wt, y = ~mpg, key = row.names(mtcars))

app$layout_set(
  htmlwidget(id = 'plotID', widget = p),
  htmlDiv(id = 'hover'),
  htmlDiv(id = 'click'),
  htmlDiv(id = 'select'),
  htmlDiv(id = 'bounds')
)

app$callback_print(
  function(hover = input("plotID", "input_plotly_hover")) {
    if (!length(hover)) "Hover on a point" else jsonlite::fromJSON(hover)
  },
  output(id = 'hover')
)

app$callback_print(
  function(click = input("plotID", "input_plotly_click")) {
    if (!length(click)) "Click on a point" else jsonlite::fromJSON(click)
  },
  output(id = 'click')
)

app$callback_print(
  function(select = input("plotID", "input_plotly_selected")) {
    if (!length(select)) "Brush points" else jsonlite::fromJSON(select)
  },
  output(id = 'select')
)

app$callback_print(
  function(bounds = input("plotID", "input_plotly_relayout")) {
    if (!length(bounds)) "Zoom and pan" else jsonlite::fromJSON(bounds)
  },
  output(id = 'bounds')
)

app$run_server()
