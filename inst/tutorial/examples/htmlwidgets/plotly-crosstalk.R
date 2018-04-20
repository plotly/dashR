library(dashR)
library(plotly)
library(crosstalk)

# This example shows how to respond to crosstalk events in dashR.
# Note that the SharedData group id must match the callback input id
p <- txhousing %>%
  SharedData$new(~city, "plotID") %>%
  plot_ly(x = ~date, y = ~median) %>%
  group_by(city) %>%
  add_lines() %>%
  layout(title = "Accessing crosstalk events in dashR")

app <- Dash$new()
app$layout_set(
  Htmlwidget(id = 'plotID', widget = p),
  htmlDiv(id = 'event')
)
#app$callback(
#  function(inputs = input("plotID", property = "ctSelection")) {
#    if (!length(inputs)) "Click on line chart above." else inputs
#  },
#  output(id = 'event')
#)

app$callback(
  function(inputs = ctSelection("plotID")) {
    if (!length(inputs)) "Click on line chart above." else inputs
  },
  output(id = 'event')
)


app$run_server()
