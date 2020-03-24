context("layout")

test_that("Layout ID's must be unique", {
  app <- Dash$new()
  
  expect_error(
    app$layout(htmlA(id = "a"), htmlA(id = "a")),
    "layout ids must be unique -- the following id was duplicated: 'a'"
  )
})


test_that("Layout must only contain components or a list of components", {
  app <- Dash$new()
  
  expect_error(
    app$layout(htmlA(), list(dccSlider(), dccChecklist()), c("This is not a component!")),
    "The layout must be a component or a collection of components"
  )
})
