library(dashR)

app <- Dash$new()

app$layout_set(
  htmlH2('Hello World'),
  coreDropdown(
    id = 'dropdown',
    options = c('LA', 'NYC', 'MTL'),
    value = 'LA'
  ),
  htmlDiv(id = 'display-value')
)

app$callback(
  function(value = input('dropdown')) paste("You have selected", value),
  output('display-value')
)

# like run_server(), but sets sensible host/port defaults for running on heroku
app$run_heroku()
