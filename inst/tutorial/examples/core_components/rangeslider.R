library(dashR)

app <- Dash$new()

marks <- seq(0, 20, by = 5)

app$layout_set(
  htmlDiv(id = 'output-container'),
  htmlDiv(
    style = list(width = "50%"),
    coreRangeSlider(
      id = 'my-range-slider',
      min = min(marks),
      max = max(marks),
      step = 0.1,
      marks = marks,
      value = c(2.5, 15),
      pushable = TRUE
    )
  )
)

app$callback(
  function(value = input("my-range-slider")) {
    sprintf("The min is %s and max is %s", min(value), max(value))
  },
  output("output-container")
)

app
