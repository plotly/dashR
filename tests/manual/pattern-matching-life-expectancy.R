library(dash)

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv', stringsAsFactors = FALSE)


app <- dash_app()

app %>% set_layout(
  button("Add Filter", id = "add-filter-ex3", n_clicks = 0),
  div(id = "container-ex3")
)


app %>% add_callback(
  output('container-ex3', 'children'),
  list(
    input('add-filter-ex3', 'n_clicks'),
    state('container-ex3', 'children')
  ),
  function(n_clicks, existing_children){
    new_children <- div(
      dccDropdown(
        id = list("index" = n_clicks, "type" = "filter-dropdown-ex3"),
        options = lapply(unique(df$country), function(x){
          list("label" = x, "value" = x)
        }),
        value = unique(df$country)[n_clicks + 1]
      ),
      div(id = list("index" = n_clicks, "type" = "output-ex3"), children = list(unique(df$country)[n_clicks + 1]))
    )

    existing_children <- c(existing_children, list(new_children))
    existing_children
  }
)


app %>% add_callback(
  output(id = list("type" = "output-ex3", "index" = MATCH), property = "children"),
  list(
    input(id = list("type" = "filter-dropdown-ex3", "index" = MATCH), property = "value"),
    input(id = list("type" = "filter-dropdown-ex3", "index" = ALLSMALLER), property = "value")
  ),
  function(matching_value, previous_values){
    previous_values_in_reversed_order = rev(previous_values)
    all_values = c(matching_value, previous_values_in_reversed_order)
    all_values = unlist(all_values)

    dff = df[df$country %in% all_values,]
    avgLifeExp = round(mean(dff$lifeExp), digits = 2)

    if (length(all_values) == 1) {
      div(sprintf("%s is the life expectancy of %s.", avgLifeExp, matching_value))
    } else if (length(all_values) == 2) {
      div(sprintf("%s is the life expectancy of %s.", avgLifeExp, paste(all_values, collapse = " and ")))
    } else {
      div(sprintf("%s is the life expectancy of %s, and %s.", avgLifeExp, paste(all_values[-length(all_values)], collapse = " , "), paste(all_values[length(all_values)])))
    }
  }
)

app %>% run_app()

