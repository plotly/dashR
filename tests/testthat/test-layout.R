context("layout")

test_that("layout IDs must be unique", {

  app <- Dash$new()

  app$layout_set(html_a(id = "a"), html_a(id = "a"))

  expect_error(
    app$layout_get(),
    "the following id was duplicated: 'a'"
  )

})
