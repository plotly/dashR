library(dasher)

app <- Dash$new()

app$layout_set(
  core_input(id = 'textID', value = 'initial value', type = "text"),
  html_button(id = "buttonID"),
  html_div(id = 'outputID')
)

# why are we getting 500s here?
app$callback(
  function(x = state("textID"), y = input("buttonID", "n_clicks")) {
    sprintf("You've entered: '%s' '%s'", x, y)
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
