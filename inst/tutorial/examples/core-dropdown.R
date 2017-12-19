library(dasher)

app <- Dash$new()
app$layout_set(
  coreDropdown(
    id = 'my-dropdown',
    options = list(
      list(label = 'New York City', 'value' = 'NYC'),
      list(label = 'Montreal', 'value' = 'MTL'),
      list(label = 'San Francisco', 'value' = 'SF')
    ),
    value = 'NYC'
  ),
  htmlDiv(id = 'output-container')
)

app$callback(
  function(value = input("my-dropdown")) {
    paste("You have selected", value)
  },
  output("output-container")
)

app$run_server(showcase = TRUE)
