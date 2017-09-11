library(dasher)

app <- Dash$new()

# use a named list to control marks
marks <- setNames(
  as.list(letters),
  rev(seq_along(letters))
)

app$layout_set(
  html_div(
    core_slider(id = 'slider', min = 1, max = 26, value = 3, marks = marks),
    id = 'container', style = list(width = "50%")
  ),
  html_div(id = 'outputID', style = list(`margin-top` = 25))
)

app$callback(
  function(x = input("slider")) {
    # be careful about type coercion in `[[`!!!
    sprintf("Current value of '%s' maps to '%s'", x, marks[[as.character(x)]])
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
