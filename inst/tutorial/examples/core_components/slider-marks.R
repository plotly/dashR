library(dashR)

app <- Dash$new()

marks <- setNames(seq_along(letters), letters)

app$layout_set(
  htmlDiv(
    id = 'container',
    style = list(width = "50%"),
    coreSlider(
      id = 'slider',
      min = 1,
      max = 26,
      value = 3,
      marks = marks
    )
  ),
  htmlDiv(id = 'outputID', style = list(`margin-top` = 25))
)

app$callback(
  function(x = input("slider")) {
    sprintf("The input value '%s' maps to '%s'", x, names(marks)[[x]])
  },
  output("outputID")
)

app
