library(dasher)

all_options <- list(
  America = c('New York City', 'San Francisco', 'Cincinnati'),
  Canada = c('Montréal', 'Toronto', 'Ottawa')
)

app <- Dash$new()

app$layout_set(
  coreRadioItems(
    id = 'countries',
    options = lapply(names(all_options), function(x) list(label = x, value = x)),
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
    lapply(all_options[[country]], function(x) list(label = x, value = x))
  }, output("cities", "options")
)

# when the country switches, set the cities to the first one
app$callback(
  function(city_options = input("cities", "options")) {
    city_options[[1]][["value"]][[1]]
  }, output("cities", "value")
)

app$callback(
  function(country = input("countries"), city = input("cities")) {
    paste(city, "is a city in", country)
  }, output("display-selected-values")
)

app$run_server(showcase = TRUE)
