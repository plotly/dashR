library(dashR)

all_options <- list(
  America = c('New York City', 'San Francisco', 'Cincinnati'),
  Canada = c('Montréal', 'Toronto', 'Ottawa')
)

app <- Dash$new()

app$layout_set(
  coreRadioItems(
    id = 'countries',
    options = names(all_options),
    value = 'America'
  ),
  htmlHr(),
  coreRadioItems(id = 'cities'),
  htmlHr(),
  htmlDiv(id = 'display-selected-values')
)

# update the (city) options based on the current country
app$callback(
  function(country = input("countries")) {
    # TODO: dash wants options as [{label: "foo", value: "bar"}]
    # atomic vectors are mapped to this data structure in layout_set(),
    # but we don't (yet) provide this mapping in a callback
    lapply(all_options[[country]], function(x) list(label = x, value = x))
  }, output("cities", "options")
)

# when the country switches, set the cities to the first one
app$callback(
  function(city_options = input("cities", "options")) {
    city_options$value[[1]]
  }, output("cities", "value")
)

app$callback(
  function(country = input("countries"), city = input("cities")) {
    paste(city, "is a city in", country)
  }, output("display-selected-values")
)

app
