library(dasher)

app <- Dash$new()

app$layout_set(
  coreRangeSlider(
    id = 'my-range-slider',
    marks = setNames(10 ^ (1:4), 1:4),
    max = 3,
    value = c(0.1, 2),
    dots = FALSE,
    step = 0.01
  ),
  htmlDiv(id = 'output-container', style = list(`margin-top` = 20))
)

app$callback(
  function(value = input("my-range-slider")) {
    log_val <- round(10 ^ value, 1)
    list(
      sprintf("Linear range: (%s, %s)", min(value), max(value)),
      htmlBr(),
      sprintf("Log range: (%s, %s)", min(log_val), max(log_val))
    )
  },
  output("output-container")
)

app
