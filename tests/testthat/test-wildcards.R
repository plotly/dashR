context("wildcards")

test_that("HTML `data-*` & `aria-* ` wildcards work", {
  x <- htmlDiv(`data-foo` = 1)
  expect_equal(x$props$`data-foo`, 1)
  expect_true("data-foo" %in% x$propNames)

  x <- htmlDiv(`aria-bar` = "b")
  expect_equal(x$props$`aria-bar`, "b")
  expect_true("aria-bar" %in% x$propNames)

  x <- htmlDiv(`data-foo` = NA, `aria-bar` = 1:10)
  expect_equal(x$props$`data-foo`, NA)
  expect_equal(x$props$`aria-bar`, 1:10)
  expect_true("data-foo" %in% x$propNames)
  expect_true("aria-bar" %in% x$propNames)
})


test_that("HTML `data-*` & `aria-* ` wildcards are passed along to layout appropriately ", {
  app <- Dash$new()
  app$layout(htmlDiv(id = "foo", `data-foo` = 1))
  x <- app$layout_get()
  expect_equal(x$props$`data-foo`, 1)
})


test_that("restricted pattern matching callback selectors must be formatted as a list", {
  app <- Dash$new()
  app$layout(htmlDiv(list(
    htmlButton("Add Filter", id="add-filter", n_clicks=0),
    htmlDiv(id="dropdown-container", children=list()),
    htmlDiv(id="dropdown-container-output")
  )))
  
  expect_error(
    app$callback(
      output(id="dropdown-container-output", property="children"),
      params = list(
        input(id=list("index" = dash:::ALL, "type" = "filter-dropdown"), property= "value")
      ),
      display_output <- function(test){
        return(htmlDiv(
          lapply(1:length(test), function(x){
            return(htmlDiv(test))
          })
        ))
      }
    ),
    "Error: A callback input ID contains restricted pattern matching callback selectors ALL, 
    MATCH or ALLSMALLER. Please verify that it is formatted as a pattern matching callback 
    list ID, or choose a different component ID.",
    fixed = TRUE
  )
})

# TODO: test NULL values aren't rendered on the HTML div
# https://github.com/plotly/dash/pull/237/files#r179251041
