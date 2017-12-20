library(dasher)

app <- Dash$new()

app$layout_set(
  coreSlider(
    id = 'my-slider',
    min = 0,
    max = 20,
    step = 0.5,
    value = 10
  ),
  htmlDiv(id = 'slider-output-container')
)

app$callback(
  function(x = input("my-slider")) {
    # careful, in this case, [[3]] is different from [["3"]]!
    paste("You have selected ", x)
  },
  output("slider-output-container")
)

app
