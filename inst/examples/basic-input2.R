library(dasher)

app <- Dash$new()

app$layout_set(
  coreInput(id = 'inputID', value = 'initial value', type = "text"),
  htmlDiv(id = 'outputID')
)

# by default, input() accesses the value of a property named 'value',
# but you can access the value of any other valid property (this case 'type')
app$callback(
  function(x = input("inputID"), y = input("inputID", "type")) {
    sprintf("You've entered: '%s' into the '%s' input control", x, y)
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
