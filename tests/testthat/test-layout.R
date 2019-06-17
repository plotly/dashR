context("layout")

test_that("layout ids must be unique", {

  app <- Dash$new()

  expect_error(
    app$layout(htmlA(id = "a"), htmlA(id = "a")),
    "the following id was duplicated: 'a'"
  )

})
