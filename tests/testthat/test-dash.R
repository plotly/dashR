context("dash-api")


test_that("Can access fiery server within a dash app", {

  d <- Dash$new()
  expect_is(d, c("Dash", "R6"))
  expect_is(d$server, c("Fiery", "R6"))

})


test_that("Can set/get layout", {

  d <- Dash$new()
  div <- htmlDiv("A div", id = "An id")

  # rendered layout is a single component
  d$layout_set(div)
  l <- d$layout_get()
  expect_true(is.component(l))
  expect_identical(l$props$children[[1]], div)

  # non-rendered layout is a list of components
  l2 <- d$layout_get(render = FALSE)
  expect_identical(l2[[1]], div)

  # dynamic layouts
  d$layout_set(function() { div })
  l3 <- d$layout_get()

  # TODO: this fails due to a random id being assigned to the app containter...
  # this likely isn't the right behavior...
  expect_identical(l, l3)

  l4 <- d$layout_get(render = FALSE)
  expect_is(l4, "function")

})
