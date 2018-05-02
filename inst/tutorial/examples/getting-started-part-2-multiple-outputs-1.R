library(dashR)

app <- Dash$new()

app$layout_set(

  coreRadioItems(
    id = 'dropdown-a',
    options = c('Canada', 'USA', 'Mexico'),
    value = 'Canada'
  ),
  htmlDiv(id = 'output-a'),

  coreRadioItems(
    id = 'dropdown-b',
    options = c('MTL', 'NYC', 'SF'),
    value = 'MTL'
  ),
  htmlDiv(id = 'output-b')
)

app$callback(
  function(dropdown_value = input("dropdown-a")) {

    sprintf("You've selected '%s'", dropdown_value)

  }, output("output-a")
)

app$callback(
  function(dropdown_value = input("dropdown-b")) {

    sprintf("You've selected '%s'", dropdown_value)

  }, output("output-b")
)

app
