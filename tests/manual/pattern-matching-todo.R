library(dash)

app <- dash_app()

app %>% set_layout(
  div('Dash To-Do List'),
  dccInput(id = 'new-item'),
  button("Add", id = "add"),
  button("Clear Done", id = "clear-done"),
  div(id = "list-container"),
  div(id = "totals")
)


style_todo <- list("display" = "inline", "margin" = "10px")
style_done <- list("display" = "inline", "margin" = "10px", "textDecoration" = "line-through", "color" = "#888")


app %>% add_callback(
  list(
    output("list-container", "children"),
    output("new-item", "value")
  ),
  list(
    add = input("add", "n_clicks"),
    submit = input("new-item", "n_submit"),
    clean = input("clear-done", "n_clicks"),
    new_item = state("new-item", "value"),
    items = state(list("index" = ALL, "type" = "check"), "children"),
    items_done = state(list("index" = ALL, "type" = "done"), "value")
  ),
  function(add, submit, clean, new_item, items, items_done) {
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
        add_list <- list(div(
          dccChecklist(
            id = list("index" = i, "type" = "done"),
            options = list(
              list("label" = "", "value" = "done")
            ),
            value = new_spec[[i]][[2]],
            style = list("display" = "inline"),
            labelStyle = list("display" = "inline")
          ),
          div(new_spec[[i]][[1]], id = list("index" = i, "type" = "check"), style = if (length(new_spec[[i]][[2]]) == 0) style_todo else style_done),
          style = list("clear" = "both")))
        new_list <- c(new_list, add_list)
      }
      list(new_list, "")
    } else {
      list(list(), "")
    }
  }
)

app %>% add_callback(
  output(id = list("index" = MATCH, "type" = "check"), property = "style"),
  input(id = list("index" = MATCH, "type" = "done"), "value"),
  function(dones) {
    if (length(dones[[1]] > 0)) return(style_done) else return(style_todo)
  }
)


app %>% add_callback(
  output("totals", "children"),
  list(
    input(list("index" = ALL, "type" = "done"), "value"),
    state(list("index" = ALL, "type" = "check"), property = "children")
  ),
  function(done, total) {
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


app %>% run_app()
