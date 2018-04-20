library(dashR)
library(leaflet)

app <- Dash$new()

app$layout_set(
  # name of the htmlwidget is required!
  # package name is only required if the widget name differs from the package name
  htmlDiv(
    className = "row",
    htmlDiv(
      className = "ten columns",
      Htmlwidget(id = 'plotID', name = "leaflet")
    ),
    htmlDiv(
      className = "two columns",
      coreRangeSlider("lat", value = c(40, 43), min = -90, max = 90, marks = seq(-90, 90, by = 10), vertical = TRUE)
    )
  ),
  htmlDiv(
    className = "row",
    coreRangeSlider("long", value = c(-72, -70), min = -180, max = 180, marks = seq(-180, 180, by = 20))
  )
)

app$callback(
  function(long = input("long"), lat = input("lat")) {
    m <- leaflet() %>% addTiles()
    if (!length(long) || !length(lat)) return(m)
    fitBounds(m, min(long), min(lat), max(long), max(lat))
  },
  output(id = 'plotID', property = "payload")
)

app$run_server()
