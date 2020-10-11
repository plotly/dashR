from selenium.webdriver.support.select import Select

all_app = """
library(dash)
library(dashHtmlComponents)
library(dashCoreComponents)

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
    return(htmlDiv(
      lapply(1:length(test), function(x){
        return(htmlDiv(sprintf("Dropdown %s = %s", x, test[[x]])))
      })
    ))
  }
)


app$run_server(debug=TRUE)
"""

allsmaller_app = """

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
        htmlDiv(sprintf("%s is the life expectancy of %s.", avgLifeExp, paste(all_values, collapse = " and ")),
         id="test")
      )
    } else {
      return(
        htmlDiv(sprintf("%s is the life expectancy of %s, and %s.", avgLifeExp, paste(all_values[-length(all_values)], 
        collapse = " , "), paste(all_values[length(all_values)])))
      )
    }
  }
)

app$run_server(debug=T)
"""


def test_rpmc001_pattern_matching_all(dashr):
    dashr.start_server(all_app)
    dashr.find_element("#add-filter").click()
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"filter-dropdown\\"\\}', "NYC")
    dashr.wait_for_text_to_equal(
        "#dropdown-container-output",
        "Dropdown 1 = NYC"
    )
    dashr.find_element("#add-filter").click()
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:2\\,\\"type\\"\\:\\"filter-dropdown\\"\\}', "MTL")
    dashr.wait_for_text_to_equal(
        "#dropdown-container-output",
        "Dropdown 1 = NYC"
        "\n"
        "Dropdown 2 = MTL"
    )


def test_rpmc002_pattern_matching_allsmaller(dashr):
    dashr.start_server(allsmaller_app)
    dashr.find_element("#add-filter-ex3").click()
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"filter-dropdown-ex3\\"\\}', "Argentina")
    dashr.find_element("#add-filter-ex3").click()
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:2\\,\\"type\\"\\:\\"filter-dropdown-ex3\\"\\}', "Angola")
    dashr.wait_for_text_to_equal(
        "#test",
        "59.03 is the life expectancy of Angola and Argentina."
    )
