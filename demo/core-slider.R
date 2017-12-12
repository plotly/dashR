library(dasher)

app <- Dash$new()

# marks currently requires a named list
# TODO: make a PR to dash-core-components to do this automatically
marks <- setNames(
  as.list(letters),
  rev(seq_along(letters))
)

app$layout_set(
  htmlDiv(
    coreSlider(id = 'slider', min = 1, max = 26, value = 3, marks = marks),
    id = 'container', style = list(width = "50%")
  ),
  htmlDiv(id = 'outputID', style = list(`margin-top` = 25))
)

app$callback(
  function(x = input("slider")) {
    # careful, in this case, [[3]] is different from [["3"]]!
    sprintf("Current value of '%s' maps to '%s'", x, marks[[as.character(x)]])
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
