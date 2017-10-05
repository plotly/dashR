# R version of https://plot.ly/dash/state
library(dasher)

app <- Dash$new()

app$layout_set(
  core_input(id = 'input-1', type = "text", value = 'Montréal'),
  core_input(id = 'input-2', type = "text", value = 'Canada'),
  html_button("Submit", id = "submit-button"),
  html_div(id = "output")
)

n <- input("submit-button", "n_clicks")
one <- state("input-1")
two <- state("input-2")

app$callback(
  function(n = n, one = one, two = two) {
    sprintf(
      "The button has been pressed %s times. Input 1 is '%s', and Input 2 is '%s'",
      n, one, two
    )
  },
  output("output")
)

app$run_server(showcase = TRUE)
