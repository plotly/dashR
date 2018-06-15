library(dashR)
library(dashRwidgets)
# currently requires a fork of leaflet
# devtools::install_github('cpsievert/leaflet@setProps')
library(leaflet)

p <- leaflet(quakes) %>% addTiles() %>% addMarkers()

app <- Dash$new()

app$layout_set(
  htmlwidget(id = 'plotID', widget = p),
  htmlDiv(id = 'click'),
  htmlDiv(id = 'bounds'),
  htmlDiv(id = 'zoom'),
  htmlDiv(id = 'center'),
  htmlDiv(id = "marker-click"),
  htmlDiv(id = "marker-mouseover"),
  htmlDiv(id = "marker-mouseout")
)

########################################################################
# notice how the 'input_*' patterns follow a similar pattern to the
# event names discussed here: https://rstudio.github.io/leaflet/shiny.html
########################################################################

app$callback_print(
  function(click = input("plotID", "input_click")) {
    if (!length(click)) "Click on the map" else click
  },
  output(id = 'click')
)

app$callback_print(
  function(bounds = input("plotID", "input_bounds")) {
    bounds
  },
  output(id = 'bounds')
)

app$callback_print(
  function(zoom = input("plotID", "input_zoom")) {
    print("Zoom level:", zoom)
  },
  output(id = 'zoom')
)

app$callback_print(
  function(center = input("plotID", "input_center")) {
    center
  },
  output(id = 'center')
)

app$callback_print(
  function(click = input("plotID", "input_marker_click")) {
    if (!length(click)) "Click on a marker" else click
  },
  output(id = 'marker-click')
)

app$callback_print(
  function(mouseover = input("plotID", "input_marker_mouseover")) {
    mouseover
  },
  output(id = 'marker-mouseover')
)

app$callback_print(
  function(mouseout = input("plotID", "input_marker_mouseout")) {
    mouseout
  },
  output(id = 'marker-mouseout')
)

app$run_server()
