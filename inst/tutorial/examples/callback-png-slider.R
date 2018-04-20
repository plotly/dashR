library(dashR)
library(ggplot2)
data(tips, package = "reshape2")

app <- Dash$new()

app$layout_set(
  htmlDiv(id = 'plotID'),
  htmlDiv(
    id = "sliderContainer",
    "Adjust slider to adjust loess span:",
    coreSlider(
      id = 'sliderID', min = 0.1, max = 1.5, step = 0.1,
      value = 0.8, marks = seq(0.1, 1.5, by = 0.1)
    ),
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
