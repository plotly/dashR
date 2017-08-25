context("layout")

test_that("layout IDs must exist and be unique", {

  app <- Dash$new()

  expect_warning(
    app$layout_set(html_div())
  )

  expect_error(
    app$layout_set(html_a(id = "a"), html_a(id = "a")),
    "the following id was duplicated: 'a'"
  )

})
