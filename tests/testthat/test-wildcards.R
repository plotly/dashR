test_that("HTML `data-*` & `aria-* ` wildcards work", {
  x <- html$div(`data-foo` = 1)
  expect_equal(x$props$`data-foo`, 1)
  expect_true("data-foo" %in% x$propNames)

  x <- html$div(`aria-bar` = "b")
  expect_equal(x$props$`aria-bar`, "b")
  expect_true("aria-bar" %in% x$propNames)

  x <- dash:::htmlDiv(`data-foo` = NA, `aria-bar` = 1:10)
  expect_equal(x$props$`data-foo`, NA)
  expect_equal(x$props$`aria-bar`, 1:10)
  expect_true("data-foo" %in% x$propNames)
  expect_true("aria-bar" %in% x$propNames)
})


test_that("HTML `data-*` & `aria-* ` wildcards are passed along to layout appropriately ", {
  app <- Dash$new()
  app$layout(html$div(id = "foo", `data-foo` = 1))
  x <- app$layout_get()
  expect_equal(x$props$`data-foo`, 1)
})

# TODO: test NULL values aren't rendered on the HTML div
# https://github.com/plotly/dash/pull/237/files#r179251041
