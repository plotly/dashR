library(dasher)

app <- Dash$new()

app$layout_set(

  coreRadioItems(
    id = 'dropdown-a',
    options = lapply(c('Canada', 'USA', 'Mexico'), function(x) list(label = x, value = x)),
    value = 'Canada'
  ),
  htmlDiv(id = 'output-a'),

  coreRadioItems(
    id = 'dropdown-b',
    options = lapply(c('MTL', 'NYC', 'SF'), function(x) list(label = x, value = x)),
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
