library(dasher)

app <- Dash$new()

# One way to include CSS to improve the sytle/look of your app is
# to use html_link() to link to a stylesheet. Here we use the dash
# styleguide https://codepen.io/chriddyp/pen/bWLwgP
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

app$run_server(showcase = TRUE)


# However, for better performance, you should place CSS in the HEAD of the
# document by using app$dependencies_set()
dash_css <- htmltools::htmlDependency(
  name = "dash-css",
  version = "1.0.0",
  src = c(href = "https://codepen.io/chriddyp/pen"),
  stylesheet = "bWLwgP.css"
)

app$layout_set(
  core_input(id = 'inputID', value = 'initial value', type = "text"),
  html_div(id = 'outputID')
)

app$dependencies_set(dash_css)
app$serve_locally <- FALSE
app$run_server(showcase = TRUE)
