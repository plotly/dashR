library(dashR)
library(plotly)

# This example shows how to respond to crosstalk events in dashR.
# Note that the SharedData group id must match the crosstalk() component id
sd <- crosstalk::SharedData$new(txhousing, ~city)

p <- plot_ly(sd, x = ~date, y = ~median) %>%
  group_by(city) %>%
  add_lines() %>%
  layout(title = "Working with crosstalk in dashR") %>%
  # TODO: do jQuery and selectize/colourpicker need to go in the head?
  highlight(color = "red", persistent = TRUE, dynamic = TRUE)

app <- Dash$new()
app$layout_set(
  dashRwidgets::htmlwidget(id = 'plotID', widget = p),
  dashRcrosstalk::crosstalk(id = "ct", group = sd$groupName()),
  htmlDiv(id = 'selectedCities'),
  htmlDiv(id = 'brushColor'),
  htmlDiv(id = 'opts')
)

app$callback(
  function(city = input("ct", "selection")) {
    if (!length(city)) "Click on line chart above." else city
  },
  output(id = 'selectedCities')
)

app$callback(
  function(colour = input("ct", "plotlySelectionColour")) {
    print(colour)
    paste("The current brush colour is:", colour)
  },
  output(id = 'brushColor')
)

app
