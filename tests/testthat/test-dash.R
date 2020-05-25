context("dash-api")

test_that("Can access fiery server within a dash app", {

  d <- Dash$new()
  expect_is(d, c("Dash", "R6"))
  expect_is(d$server, c("Fiery", "R6"))

})

test_that("Can set/get layout", {

  d <- Dash$new()
  div <- htmlDiv("A div", id = "An id")
  d$layout(div)
 
  l <- d$layout_get()
 
  # dynamic layouts
  d$layout(function() { htmlDiv("A div", id = "An id") })
  l2 <- d$layout_get()
  expect_identical(l, l2)
  expect_is(d$layout_get(render = FALSE), "function")

})
