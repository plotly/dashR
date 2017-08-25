context("dash-api")


test_that("Can access fiery server within a dash app", {

  d <- Dash$new()
  expect_is(d, c("Dash", "R6"))
  expect_is(d$server, c("Fiery", "R6"))

})


test_that("Can set/get layout", {

  d <- Dash$new()
  l1 <- d$layout_get()
  expect_is(l1, c("dash_component", "html"))
  expect_identical(l1, welcome_page())


  d$layout_set(html_div("A div", id = "An id"))
  l2 <- d$layout_get()
  expect_is(l2, c("dash_component", "html", "Div"))
  expect_true(!identical(l1, l2))

})
