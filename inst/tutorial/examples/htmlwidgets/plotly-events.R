library(dashR)
library(plotly)
library(dashRwidgets)

p <- plot_ly(mtcars, x = ~wt, y = ~mpg) %>%
  add_markers() %>%
  layout(title = "Working with plotly htmlwidget events in dashR")

app <- Dash$new()
app$layout_set(
  Plotly(id = 'plotID', widget = p, clear_on_unhover = TRUE, clear_on_doubleclick = TRUE),
  htmlDiv(id = 'hover-data'),
  htmlDiv(id = 'click-data'),
  htmlDiv(id = 'selected-data'),
  htmlDiv(id = 'relayout-data')
)

app$callback_print(
  function(hoverData = input('plotID', 'hoverData')) {
    if (!length(hoverData)) "Hover data will appear here" else hoverData
  }, output('hover-data')
)

app$callback_print(
  function(clickData = input('plotID', 'clickData')) {
    if (!length(clickData)) "Click data will appear here" else clickData
  }, output('click-data')
)

app$callback_print(
  function(selectedData = input('plotID', 'selectedData')) {
    if (!length(selectedData)) "Select data will appear here" else selectedData
  }, output('selected-data')
)

app$callback_print(
  function(relayoutData = input('plotID', 'relayoutData')) {
    if (!length(relayoutData)) "Re-layout data will appear here" else relayoutData
  }, output('relayout-data')
)

app$run_server()
