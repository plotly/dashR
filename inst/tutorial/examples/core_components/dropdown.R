library(dasher)

app <- Dash$new()
app$layout_set(
  coreDropdown(
    id = 'my-dropdown',
    options = c(
      'New York City' = 'NYC',
      'Montreal' = 'MTL',
      'San Francisco' = 'SF'
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

app
