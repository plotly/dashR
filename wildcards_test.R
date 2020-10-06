# Simple Example with ALL

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

app <- Dash$new()

app$layout(htmlDiv(list(
  htmlButton("Add Filter", id="add-filter", n_clicks=0),
  htmlDiv(id="dropdown-container", children=list()),
  htmlDiv(id="dropdown-container-output")
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
    ctx <- app$callback_context()
    print(ctx)
    return(htmlDiv(
      lapply(1:length(test), function(x){
        return(htmlDiv(sprintf("Dropdown %s = %s", x, test[[x]])))
      })
    ))
  }
)


app$run_server(debug=T, showcase = TRUE)

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
  htmlDiv(id="dynamic-dropdown-container", children = list())
)))


app$callback(
  output(id="dynamic-dropdown-container", "children"),
  params = list(
    input("dynamic-add-filter", "n_clicks"),
    state("dynamic-dropdown-container", "children")
  ),
  display_dropdown <- function(n_clicks, children){
    new_element = htmlDiv(list(
      dccDropdown(
        id = list("index" = n_clicks, "type" = "dynamic-dropdown"),
        options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
          list("label" = x, "value" = x)
        })
      ),
      htmlDiv(
        id = list("index" = n_clicks, "type" = "dynamic-output"),
        children = list()
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
    # ctx <- app$callback_context()
    # print(jsonlite::toJSON(ctx, pretty = TRUE))
    print(id)
    print(value)
    return(htmlDiv(sprintf("Dropdown %s = %s", id$index, value)))
  }
)

app$run_server(showcase = T, debug = T, port = 8070)
  


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
        id = list("index" = n_clicks, "type" = "filter-dropdown-ex3"),
        options = lapply(unique(df$country), function(x){
          list("label" = x, "value" = x)
        }),
        value = unique(df$country)[n_clicks + 1]
      ),
      htmlDiv(id = list("index" = n_clicks, "type" = "output-ex3"), children = list(unique(df$country)[n_clicks + 1]))
    ))
    
    existing_children <- c(existing_children, list(new_children))
  }
)


app$callback(
  output(id = list("type" = "output-ex3", "index" = dash:::MATCH), property = "children"),
  params = list(
    input(id = list("type" = "filter-dropdown-ex3", "index" = dash:::MATCH), property = "value"),
    input(id = list("type" = "filter-dropdown-ex3", "index" = dash:::ALLSMALLER), property = "value")
  ),
  display_output <- function(matching_value, previous_values){
    previous_values_in_reversed_order = rev(previous_values)
    all_values = c(matching_value, previous_values_in_reversed_order)
    all_values = unlist(all_values)
    
    dff = df[df$country %in% all_values,]
    avgLifeExp = round(mean(dff$lifeExp), digits = 2)
    
    if (length(all_values) == 1) {
      return(
        htmlDiv(sprintf("%s is the life expectancy of %s.", avgLifeExp, matching_value))
      )
    } else if (length(all_values) == 2) {
      return(
        htmlDiv(sprintf("%s is the life expectancy of %s.", avgLifeExp, paste(all_values, collapse = " and ")))
      )
    } else {
      return(
        htmlDiv(sprintf("%s is the life expectancy of %s, and %s.", avgLifeExp, paste(all_values[-length(all_values)], collapse = " , "), paste(all_values[length(all_values)])))
      )
    }
  }
)

app$run_server(showcase = T, debug = T, port = 8070)



# TO DO Sample App

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)


app <- Dash$new()


app$layout(htmlDiv(list(
  htmlDiv('Dash To-Do List'),
  dccInput(id = 'new-item'),
  htmlButton("Add", id = "add"),
  htmlButton("Clear Done", id = "clear-done"),
  htmlDiv(id = "list-container"),
  htmlDiv(id = "totals")
)))


style_todo <- list("display" = "inline", "margin" = "10px")
style_done <- list("display" = "inline", "margin" = "10px", "textDecoration" = "line-through", "color" = "#888")


app$callback(
  output = list(
    output("list-container", "children"),
    output("new-item", "value")
  ),
  params = list(
    input("add", "n_clicks"),
    input("new-item", "n_submit"),
    input("clear-done", "n_clicks"),
    state("new-item", "value"),
    state(list("index" = dash:::ALL, "type" = "all"), "children"),
    state(list("index" = dash:::ALL, "type" = "done"), "value")
  ),
  edit_list <- function(add, add2, clear, new_item, items, items_done) {
    ctx <- app$callback_context()
    triggered <- ctx$triggered$prop_id
    adding <- triggered %in% c("add.n_clicks", "new-item.n_submit")
    clearing = triggered %in% c("clear-done.n_clicks")
    
    print(items)
    
    new_list <- list(htmlDiv(list(
      dccChecklist(
        id = list("index" = add, "type" = "done"),
        options = list(
          list("label" = "", "value" = "done")
        ),
        style = list("display" = "inline"),
        labelStyle = list("display" = "inline")
      ),
      htmlDiv(new_item, id = list("index" = "add", "type" = "all"), style = style_todo)
    ), style = list("clear" = "both")))
    return(list(new_list, ""))
  }
)


app$run_server(showcase = T, debug = F, port = 8040)















