context("dash-api")

test_that("Can we access the fiery server within a dash app", {
  app <- Dash$new()
  expect_is(app, c("Dash", "R6"))
  expect_is(app$server, c("Fire", "R6"))
})


test_that("Set or get the layout", {
  app <- Dash$new()
  div <- htmlDiv("A div", id = "id")
  
  # rendered layout has a container div
  app$layout(
    div
  )
  
  get_div <- app$layout_get()
  
  expect_true(is.layout(get_div))
  
  expect_identical(get_div$props$children[[1]], div)
  
  app$layout(function() { div })
  
  get_div_2 <- app$layout_get()
  
  expect_identical(get_div, get_div_2)
  
  expect_is(app$layout_get(render = FALSE), "function")
})

test_that("Callback can be set, callback context exists", {
  app <- Dash$new()
  
  app$layout(
    htmlButton(children = "Click", id = "button", n_clicks = 0),
    htmlDiv(id = "output")
  )
  
  expect_silent(
    app$callback(
      output(id = "output", property = "children"),
      params = list(
        input(id = "button", property = "n_clicks")
      ),
      function(n_clicks) {
        return(n_clicks)
      }
    )
  )
  expect_warning(
    app$callback_context(),
    "callback_context is undefined; callback_context may only be accessed within a callback.",
    fixed = TRUE
  )
})

# TODO Add test for `index_string` and `interpolate_index` 