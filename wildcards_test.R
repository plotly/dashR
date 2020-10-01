# Simple Example with ALL

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

app <- Dash$new()

app$layout(htmlDiv(list(
  htmlButton("Add Filter", id="add-filter", n_clicks=0),
  htmlDiv(id="dropdown-container", children=list()),
  htmlDiv(id="dropdown-container-output"),
  dccInput(id='my-id', value='initial value', type='text'),
  htmlDiv(id='my-div'),
  htmlA("Test", href = "/test")
)))


app$callback(
  output(id="dropdown-container", property = "children"),
  params = list(
    input(id = "add-filter", property = "n_clicks"),
    state(id = "dropdown-container", property = "children")
  ),
  display_dropdowns <- function(n_clicks, children){
    new_dropdown = dccDropdown(
      id=list(
        "index" = n_clicks,
        "type" = "filter-dropdown"
      ),
      options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
        list("label" = x, "value" = x)
      })
    )
    children[[n_clicks + 1]] <- new_dropdown
    return(children)
  }
)


app$callback(
  output(id="dropdown-container-output", property="children"),
  params = list(
    input(id=list("index" = dash:::ALL, "type" = "filter-dropdown"), property= "value")
  ),
  display_output <- function(test){
    print(test)
    return(htmlDiv(
      lapply(1:length(test), function(x){
        return(htmlDiv(sprintf("Dropdown %s = %s", x, test[[x]])))
      })
    ))
  }
)


app$callback(
  output=list(id='my-div', property='children'),
  params=list(input(id='my-id', property='value')),
  function(input_value) {
    sprintf("You've entered \"%s\"", input_value)
  })


app$run_server(debug=F, showcase = TRUE)

# Standard Callback Example

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccInput(id='my-id', value='initial value', type='text'),
      htmlDiv(id='my-div')
    )
  )
)

app$callback(
  output=list(id='my-div', property='children'),
  params=list(input(id='my-id', property='value')),
  function(input_value) {
    sprintf("You've entered \"%s\"", input_value)
  })

app$run_server()


# Simple Example with MATCH

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
  
  
app <- Dash$new()

app$layout(htmlDiv(list(
  htmlButton("Add Filter", id="dynamic-add-filter", n_clicks=0),
  htmlDiv(id="dynamic-dropdown-container")
)))


app$callback(
  output(id="dynamic-dropdown-container", "children"),
  params = list(
    input("dynamic-add-filter", "n_clicks"),
    state("dynamic-dropdown-container", "children")
  ),
  display_dropdown <- function(n_clicks, children){
    new_element = htmlDiv(list(
      htmlDiv(
        id = list("index" = n_clicks, "type" = "dynamic-output"),
        children = list(n_clicks)
      ),
      dccDropdown(
        id = list("index" = n_clicks, "type" = "dynamic-dropdown"),
        options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
          list("label" = x, "value" = x)
        })
      )
    ))
    children <- c(children, list(new_element))
    return(children)
  }
)


app$callback(
  output(id = list("index" = dash:::MATCH, "type" = "dynamic-output"), property= "children"),
  params = list(
    input(id=list("index" = dash:::MATCH, "type" = "dynamic-dropdown"), property= "value"),
    state(id=list("index" = dash:::MATCH, "type" = "dynamic-dropdown"), property= "id")
  ),
  display_output <- function(value, id){
    ctx <- app$callback_context()
    print(jsonlite::toJSON(ctx, pretty = TRUE))
    print(id)
    print(value)
    return(htmlDiv(list(id, value)))
  }
)

app$run_server(showcase = T, debug = T)
  


# Example with ALLSMALLER 


library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)


df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv', stringsAsFactors = F)


app <- Dash$new()

app$layout(htmlDiv(list(
  htmlButton("Add Filter", id = "add-filter-ex3", n_clicks = 0),
  htmlDiv(id = "container-ex3", children = list())
)))


app$callback(
  output('container-ex3', 'children'),
  params = list(
    input('add-filter-ex3', 'n_clicks'),
    state('container-ex3', 'children')
  ),
  display_dropdowns <- function(n_clicks, existing_children){
    new_children <- htmlDiv(list(
      dccDropdown(
        id = list("type" = "filter-dropdowns-ex3", "index" = n_clicks),
        options = lapply(unique(df$country), function(x){
          list("label" = x, "value" = x)
        }),
        value = unique(df$country)[n_clicks + 1]
      ),
      htmlDiv(id = list("type" = "output-ex3", "index" = n_clicks))
    ))
    
    existing_children <- c(existing_children, list(new_children))
  }
)


app$callback(
  output(id = list("type" = "output-ex3", "index" = dash:::MATCH), property = "children"),
  params = list(
    input(id = list("type" = "filter-dropdown-ex3", "index" = dash:::MATCH), property = "value"),
    state(id = list("type" = "filter-dropdown-ex3", "index" = dash:::ALLSMALLER), property = "value")
  ),
  display_output <- function(matching_value, previous_values){
    previous_values_in_reversed_order = rev(previous_values)
    all_values = c(list(matching_value), previous_values_in_reversed_order)

    print(matching_value)
    print(previous_values)

    return("Thanks for testing")
  }
)

app$run_server(showcase = T, debug = T)










