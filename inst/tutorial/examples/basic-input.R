library(dasher)

app <- Dash$new()

app$layout_set(
  coreInput(id = 'input-1', value = 'Montréal', type = "text"),
  coreInput(id = 'input-2', value = 'Canada', type = "text"),
  htmlDiv(id = 'output')
)

app$callback(
  function(x = input("input-1"), y = input("input-2")) {
    sprintf("Input 1 is '%s' and input 2 is '%s'", x, y)
  },
  output("output")
)

app
