# R version of https://plot.ly/dash/state
library(dasher)

app <- Dash$new()

app$layout_set(
  coreInput(id = 'input-1', type = "text", value = 'Montréal'),
  coreInput(id = 'input-2', type = "text", value = 'Canada'),
  htmlButton("Submit", id = "submit-button"),
  htmlDiv(id = "output")
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

app
