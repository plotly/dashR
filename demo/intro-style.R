library(dasher)

app <- Dash$new()

# Can
app$layout_set(
  html_link(href = "https://codepen.io/chriddyp/pen/bWLwgP.css", rel = "stylesheet"),
  core_input(id = 'inputID', value = 'initial value', type = "text"),
  html_div(id = 'outputID')
)

app$callback(
  function(x = input("inputID"), y = input("inputID", "type")) {
    sprintf("You've entered: '%s' into the '%s' input control", x, y)
  },
  output("outputID")
)

# app$run_server(showcase = TRUE)

# Want to make it look better? Use the dash styleguide!
# https://codepen.io/chriddyp/pen/bWLwgP


app$layout_set(css, app$layout_get())

app$run_server(showcase = TRUE)
