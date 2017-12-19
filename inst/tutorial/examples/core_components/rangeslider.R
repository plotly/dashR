library(dasher)

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
      marks = setNames(as.list(marks), marks),
      value = c(2.5, 15),
      pushable = TRUE
    )
  )
)

app$callback(
  function(value = input("my-range-slider")) {
    # TODO: should this be an integer vector?
    val <- value[[1]]
    sprintf("The min is %s and max is %s", min(val), max(val))
  },
  output("output-container")
)

app
