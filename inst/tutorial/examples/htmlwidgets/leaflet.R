library(dashR)
library(leaflet)
library(dashRwidgets)

app <- Dash$new()

app$layout_set(
  Leaflet(id = 'plotID', widget = leaflet() %>% addTiles()),
  htmlDiv(id = "bounds")
)

app$callback_print(
  function(click = input("plotID", "click")) {
    click
  },
  output(id = 'bounds')
)

app$run_server()
