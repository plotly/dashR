library(dasher)

all_options <- list(
  NYC = list(
    Places = c('Statue of Liberty', 'Wall Street'),
    Boroughs = c('Brooklyn', 'The Bronx', 'Manhattan', 'Queens', 'Staten Island')
  ),
  Montréal = list(
    `Monuments Célèbres` = c('Olympic Stadium', 'Parc la Fontaine'),
    `Les Voisinages` = c('Le Plateau', 'Hochelaga', 'Outremont')
  )
)

app <- Dash$new()

app$layout_set(
  # Initial dropdown with initial state
  coreDropdown(
    id = 'cities-dropdown',
    options = lapply(names(all_options), function(x) list(label = x, value = x)),
    value = 'NYC'
  ),

  # Note how options and values aren't supplied for the remaining two dropdowns.
  # When the dash app starts, it will traverse the callback dependency tree
  # and call all of the appropriate callbacks to fill out the app's state
  coreDropdown(id = 'category-dropdown'),
  coreDropdown(id = 'sub-category-dropdown'),

  # We'll display the values of the dropdowns in this component
  htmlDiv(
    id = 'display',
    "Notice how dropdown options are filled 2 seconds after choosing a value"
  )
)

# Use the cities/category dropdown (input) value in multiple places
cities <- input("cities-dropdown")
categories <- input('category-dropdown')

# Update the category dropdown's 'options' when the city changes
app$callback(
  function(city = cities) {
    Sys.sleep(2)
    opts <- names(all_options[[city]])
    lapply(opts, function(x) list(label = x, value = x))
  }, output("category-dropdown", "options")
)

# Update the category dropdown's 'value' when its 'options' get changed
app$callback(
  function(new_options = input('category-dropdown', 'options')) {
    new_options[[1]]$value
  }, output('category-dropdown', 'value')
)

# Update the sub-category dropdown's 'options' when city changes or
# when the category changes
app$callback(
  function(city = cities, category = categories) {
    Sys.sleep(2)
    opts <- all_options[[city]][[category]]
    lapply(opts, function(x) list(label = x, value = x))
  }, output('sub-category-dropdown', 'options')
)

# Update the sub-category dropdown's 'value' when its options change
app$callback(
  function(new_options = input('sub-category-dropdown', 'options')) {
    new_options[[1]]$value
  }, output('sub-category-dropdown', 'value')
)


# Display the selected value when all of the dropdown's values have finished updating.
app$callback(
  function(city = cities, category = categories, subcategory = input('sub-category-dropdown')) {
    Sys.sleep(2)
    sprintf("You've selected '%s', '%s', and '%s'", city, category, subcategory)
  }, output('display')
)

app$run_server(showcase = TRUE)
