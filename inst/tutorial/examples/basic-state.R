# R version of https://plot.ly/dash/state
library(dasher)

app <- Dash$new()

app$layout_set(
  coreInput(id = 'state-1', type = "text", value = 'Montréal'),
  coreInput(id = 'state-2', type = "text", value = 'Canada'),
  htmlButton("Submit", id = "submit-button"),
  htmlDiv(id = "output-b")
)

n <- input("submit-button", "n_clicks")
one <- state("state-1")
two <- state("state-2")

app$callback(
  function(n = n, one = one, two = two) {
    sprintf(
      "The button has been pressed %s times. Input 1 is '%s', and Input 2 is '%s'",
      n, one, two
    )
  },
  output("output-b")
)

app
