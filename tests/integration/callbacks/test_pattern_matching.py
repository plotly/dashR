all_app = """
library(dash)

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
        "bar" = n_clicks,
        "foo" = "filter-dropdown"
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
    input(id=list("bar" = ALL, "foo" = "filter-dropdown"), property= "value")
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


app$run_server()
"""

allsmaller_app = """
library(dash)

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv', stringsAsFactors = FALSE)


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
  output(id = list("type" = "output-ex3", "index" = MATCH), property = "children"),
  params = list(
    input(id = list("type" = "filter-dropdown-ex3", "index" = MATCH), property = "value"),
    input(id = list("type" = "filter-dropdown-ex3", "index" = ALLSMALLER), property = "value")
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

app$run_server()
"""

match_app = """
library(dash)

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
  output(id = list("index" = MATCH, "type" = "dynamic-output"), property= "children"),
  params = list(
    input(id=list("index" = MATCH, "type" = "dynamic-dropdown"), property= "value"),
    state(id=list("index" = MATCH, "type" = "dynamic-dropdown"), property= "id")
  ),
  display_output <- function(value, id){
    return(htmlDiv(sprintf("Dropdown %s = %s", id$index, value)))
  }
)

app$run_server()
"""

todo_app = """
library(dash)

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
    state(list("index" = ALL, "type" = "check"), "children"),
    state(list("index" = ALL, "type" = "done"), "value")
  ),
  edit_list <- function(add, add2, clear, new_item, items, items_done) {
    ctx <- app$callback_context()
    triggered <- ifelse(is.null(ctx$triggered$prop_id), " ", ctx$triggered$prop_id)
    adding <- grepl(triggered, "add.n_clicks|new-item.n_submit")
    clearing = grepl(triggered, "clear-done.n_clicks")

    # Create a list which we will hydrate with "items" and "items_done"
    new_spec <- list()
    for (i in seq_along(items)) {
      if (!is.null(items[[i]])) {
        new_spec[[length(new_spec) + 1]] <- list(items[[i]], list())
      }
    }

    for (i in seq_along(items_done)) {
      if (!is.null(items_done[[i]])) {
        new_spec[[i]][[2]] <- items_done[[i]]
      }
    }

    # If clearing, we remove elements from the list which have been marked "done"
    if (clearing) {
      remove_vector <- c()
      for (i in seq_along(new_spec)) {
        if (length(new_spec[[i]][[2]]) > 0) {
          remove_vector <- c(remove_vector, i)
        }
      }
      new_spec <- new_spec[-remove_vector]
    }

    # Add a new item to the list
    if (adding) {
      new_spec[[length(new_spec) + 1]] <- list(new_item, list())
    }

    # Generate dynamic components with pattern matching IDs
    new_list <- list()
    if (!is.null(unlist(new_spec))) {
      for (i in seq_along(new_spec)) {
        add_list <- list(htmlDiv(list(
          dccChecklist(
            id = list("index" = i, "type" = "done"),
            options = list(
              list("label" = "", "value" = "done")
            ),
            value = new_spec[[i]][[2]],
            style = list("display" = "inline"),
            labelStyle = list("display" = "inline")
          ),
          htmlDiv(new_spec[[i]][[1]], id = list("index" = i, "type" = "check"), style = if (length(new_spec[[i]][[2]]) == 0) style_todo else style_done)
        ), style = list("clear" = "both")))
        new_list <- c(new_list, add_list)
      }
      return(list(new_list, ""))
    } else {
      return(list(list(), ""))
    }
  }
)

app$callback(
  output(id = list("index" = MATCH, "type" = "check"), property = "style"),
  params = list(
    input(id = list("index" = MATCH, "type" = "done"), property = "value")
  ),
  mark_done <- function(done){
    if (length(done[[1]] > 0)) return(style_done) else return(style_todo)
  }
)


app$callback(
  output(id = "totals", property = "children"),
  params = list(
    input(list("index" = ALL, "type" = "done"), property = "value"),
    state(list("index" = ALL, "type" = "check"), property = "children")
  ),
  show_totals <- function(done, total) {
    count_all = length(total)
    count_done = length(done)

    result = sprintf("%s of %s items completed", count_done, count_all)

    if (count_all > 0) {
      result = paste(result, sprintf(" - %s%%", as.integer(100 * count_done/count_all)))
    }

    if (is.null(total[[1]])) {
      return("Add an item to the list to get started.")
    } else {
      return(result)
    }
  }
)


app$run_server()
"""


graphs_app = """
library(dash)
library(plotly)

df <- read.csv(
  file = "https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv",
  stringsAsFactor=FALSE,
  check.names=FALSE
)

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      htmlDiv(
        list(
          dccDropdown(options = lapply(unique(df[,"country"]), function(x) {
            list(label = x, value = x)
          }),
          value = "Canada",
          id = "country",
          style = list(display = "inline-block",
                       width = 200)
          ),
          htmlButton(
            "add Chart",
            id = "add-chart",
            n_clicks = 0,
            style = list(display = "inline-block")
          )
        )
      ),
      htmlDiv(id = "container", children=list()),
      htmlDiv(id = "output-delay")
    )
  )
)

create_figure <- function(df, column_x, column_y, country) {
  df <- df[which(df[, "country"] == country),]
  if (column_x == "year") {
    fig <- plot_ly(df, x = df[,column_x], y = df[,column_y], name = column_x, type = "scatter", mode = "lines")
  } else {
    fig <- plot_ly(df, x = df[,column_x], y = df[,column_y], name = column_x, type = "scatter", mode = "markers")
  }
  fig <- plotly::layout(fig, plot_bgcolor="lightblue", xaxis = list(title=""),
                        yaxis = list(title=""), title=list(text=paste(country, column_y, "vs", column_x),
                                                           xanchor="right", margin_l=10, margin_r=0, margin_b=30))
  return(fig)
}

app$callback(
  output = list(
    output(id = "container", property = "children"),
    output(id = "output-delay", property = "children")
  ),
  params = list(
    input(id = "add-chart", property = "n_clicks"),
    state(id = "country", property = "value"),
    state(id = "container", property = "children")
  ),
  function(n_clicks, country, children) {
    default_column_x <- "year"
    default_column_y <- "gdpPercap"

    new_element <- htmlDiv(
      style = list(width = "23%", display = "inline-block", outline = "thin lightgrey solid", padding = 10),
      children = list(
        dccGraph(
          id = list(type = "dynamic-output", index = n_clicks),
          style = list(height = 300),
          figure = create_figure(df, default_column_x, default_column_y, country)
        ),
        dccDropdown(
          id = list(type = "dynamic-dropdown-x", index = n_clicks),
          options = lapply(colnames(df), function(x) {
            list(label = x, value = x)
          }),
          value = default_column_x
        ),
        dccDropdown(
          id = list(type = "dynamic-dropdown-y", index = n_clicks),
          options = lapply(colnames(df), function(x) {
            list(label = x, value = x)
          }),
          value = default_column_y
        )
      )
    )

    children <- c(children, list(new_element))
    return(list(children, n_clicks))
  }
)

app$callback(
  output(id = list("index" = MATCH, "type" = "dynamic-output"), property = "figure"),
  params = list(
    input(id = list("index" = MATCH, "type" = "dynamic-dropdown-x"), property = "value"),
    input(id = list("index" = MATCH, "type" = "dynamic-dropdown-y"), property = "value"),
    input(id = "country", property = "value")
  ),
  function(column_x, column_y, country) {
    return(create_figure(df, column_x, column_y, country))
  }
)

app$run_server()
"""


def test_rpmc001_pattern_matching_all(dashr):
    dashr.start_server(all_app)
    dashr.find_element("#add-filter").click()
    dashr.select_dcc_dropdown('#\\{\\"bar\\"\\:1\\,\\"foo\\"\\:\\"filter-dropdown\\"\\}', "NYC")
    dashr.wait_for_text_to_equal(
        "#dropdown-container-output",
        "Dropdown 1 = NYC"
    )
    dashr.find_element("#add-filter").click()
    dashr.select_dcc_dropdown('#\\{\\"bar\\"\\:2\\,\\"foo\\"\\:\\"filter-dropdown\\"\\}', "MTL")
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


def test_rpmc003_pattern_matching_match(dashr):
    dashr.start_server(match_app)
    dashr.find_element("#dynamic-add-filter").click()
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"dynamic-dropdown\\"\\}', "NYC")
    dashr.wait_for_text_to_equal(
        '#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"dynamic-output\\"\\}',
        "Dropdown 1 = NYC"
    )
    dashr.find_element("#dynamic-add-filter").click()
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:2\\,\\"type\\"\\:\\"dynamic-dropdown\\"\\}', "MTL")
    dashr.wait_for_text_to_equal(
        '#\\{\\"index\\"\\:2\\,\\"type\\"\\:\\"dynamic-output\\"\\}',
        "Dropdown 2 = MTL"
    )


def test_rpmc004_pattern_matching_todo(dashr):
    dashr.start_server(todo_app)
    dashr.find_element("#new-item").send_keys("Item 1")
    dashr.find_element("#add").click()
    dashr.find_element('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"done\\"\\}').click()
    assert dashr.wait_for_text_to_equal("#totals", "1 of 1 items completed - 100%")


def test_rpmc005_pattern_matching_graphs(dashr):
    dashr.start_server(graphs_app)
    dashr.select_dcc_dropdown("#country", "Cameroon")
    dashr.wait_for_text_to_equal("#output-delay", "0")
    dashr.find_element("#add-chart").click()
    dashr.wait_for_text_to_equal("#output-delay", "1")
    dashr.find_element('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"dynamic-output\\"\\}')
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"dynamic-dropdown-x\\"\\}', "year")
    dashr.select_dcc_dropdown('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"dynamic-dropdown-y\\"\\}', "pop")
    dashr.percy_snapshot("r-pmc-graphs")
    dashr.wait_for_element('#\\{\\"index\\"\\:1\\,\\"type\\"\\:\\"dynamic-output\\"\\}')
