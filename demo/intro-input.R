library(dasher)

app <- Dash$new()

app$layout_set(
  core_input(id = 'inputID', value = 'initial value', type = "text"),
  html_div(id = 'outputID')
)

app$callback(
  function(x = input("inputID"), y = input("inputID", "type")) {
    sprintf("You've entered: '%s' into the '%s' input control", x, y)
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
