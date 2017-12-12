library(dasher)

app <- Dash$new()

app$layout_set(
  core_input(id = 'input-1', value = 'Montréal', type = "text"),
  core_input(id = 'input-2', value = 'Canada', type = "text"),
  html_div(id = 'output')
)

app$callback(
  function(x = input("input-1"), y = input("input-2")) {
    sprintf("Input 1 is '%s' and input 2 is '%s'", x, y)
  },
  output("output")
)

app$run_server(showcase = TRUE)
