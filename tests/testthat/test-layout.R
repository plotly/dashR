context("layout")

test_that("layout IDs must be unique", {

  app <- Dash$new()

  app$layout(htmlA(id = "a"), htmlA(id = "a"))

  expect_error(
    app$layout_get(),
    "the following id was duplicated: 'a'"
  )

})
