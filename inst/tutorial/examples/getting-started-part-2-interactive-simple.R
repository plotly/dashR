library(dashR)

app <- Dash$new()

app$layout_set(
  coreInput(id = 'my-id', value = 'initial value', type = 'text'),
  htmlDiv(id = 'my-div')
)

app$callback(
  function(input_value = input("my-id")) {
    sprintf("You've entered '%s'", input_value)
  }, output("my-div")
)

app
