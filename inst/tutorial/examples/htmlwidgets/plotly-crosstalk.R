library(dashR)
library(plotly)
library(crosstalk)

# This example shows how to respond to crosstalk events in dashR.
# Note that the SharedData group id must match the Crosstalk() component id
sd <- SharedData$new(txhousing, ~city)

p <- plot_ly(sd, x = ~date, y = ~median) %>%
  group_by(city) %>%
  add_lines() %>%
  layout(title = "Accessing crosstalk events in dashR")

app <- Dash$new()
app$layout_set(
  Htmlwidget(id = 'plotID', widget = p),
  dashCrosstalkComponent::Crosstalk(sd$groupName()),
  htmlDiv(id = 'event')
)

app$callback(
  function(inputs = input(sd$groupName(), "selection")) {
    if (!length(inputs)) "Click on line chart above." else inputs
  },
  output(id = 'event')
)


app$run_server()
