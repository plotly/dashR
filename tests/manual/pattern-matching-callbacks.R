library(dash)

dash_app() %>%
  set_layout(
    button("Add Filter", id = "add-filter", n_clicks = 0),
    div(id="dropdown-container"),
    div(id="dropdown-container-output")
  ) %>%
  add_callback(
    output("dropdown-container", "children"),
    list(
      input(id = "add-filter", property = "n_clicks"),
      state(id = "dropdown-container", property = "children")
    ),
    function(filter_click, dropdown_content) {
      new_dropdown = dccDropdown(
        id=list(
          "index" = filter_click,
          "type" = "filter-dropdown"
        ),
        options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
          list("label" = x, "value" = x)
        })
      )
      children <- dropdown_content
      children[[filter_click + 1]] <- new_dropdown
      children
    }
  ) %>%
  add_callback(
    output("dropdown-container-output", "children"),
    input(id=list("index" = ALL, "type" = "filter-dropdown"), property = "value"),
    function(mydropdown) {
      test <- mydropdown
      div(
        lapply(seq_along(test), function(x){
          div(sprintf("Dropdown %s = %s", x, test[[x]]))
        })
      )
    }
  ) %>%
  run_app()
