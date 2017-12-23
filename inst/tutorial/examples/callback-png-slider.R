library(dasher)
library(ggplot2)
data(tips, package = "reshape2")

app <- Dash$new()

span_slider <- function(min = 0.1, max = 1.5, span = 0.1) {
  coreSlider(
    id = 'sliderID', min = min, max = max, step = span,
    value = 0.8, marks = seq(min, max, by = span)
  )
}

app$layout_set(
  htmlDiv(id = 'plotID'),
  htmlDiv(
    id = "sliderContainer",
    "Adjust slider to adjust loess span:",
    span_slider(),
    style = list(width = "50%")
  )
)

# TODO: support CSS width/height (e.g., width="50%")
# this will require accessing width/height on the client
app$callback_png(
  function(span = input("sliderID")) {
    gg <- ggplot(tips, aes(total_bill, tip)) +
      geom_point() +
      geom_smooth(color = "black", span = span)
    print(gg)
  }, output(id = 'plotID')
)

app
