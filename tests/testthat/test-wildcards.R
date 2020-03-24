context("wildcards")

test_that("HTML `data-*` & `aria-* ` wildcards work", {
  div <- htmlDiv(`data-foo` = 1)
  expect_equal(div$props$`data-foo`, 1)
  expect_true("data-foo" %in% div$propNames)
  
  div <- htmlDiv(`aria-bar` = "b")
  expect_equal(div$props$`aria-bar`, "b")
  expect_true("aria-bar" %in% div$propNames)
  
  div <- htmlDiv(`data-foo` = NA, `aria-bar` = 1:10)
  expect_equal(div$props$`data-foo`, NA)
  expect_equal(div$props$`aria-bar`, 1:10)
  expect_true("data-foo" %in% div$propNames)
  expect_true("aria-bar" %in% div$propNames)
})


test_that("HTML `data-*` & `aria-* ` wildcards are passed along to layout appropriately ", {
  app <- Dash$new()
  app$layout(htmlDiv(id = "foo", `data-foo` = 1))
  x <- app$layout_get()
  expect_equal(x$props$children[[1]]$props$`data-foo`, 1)
})