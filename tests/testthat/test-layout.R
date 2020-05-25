context("layout")

test_that("layout IDs must be unique", {

 app <- Dash$new()

 expect_error(
   app$layout(htmlDiv(list(htmlA(id = "a"), htmlA(id = "a"), htmlP(id="b"), htmlP(id="c"), htmlA(id="c")))),
   "layout ids must be unique -- please check the following list of duplicated ids: 'a, c'"
  )

})

test_that("app$layout() only accepts components, or functions that return components", {
 app <- Dash$new()

 expect_error(
   app$layout(htmlA(id = "a"), htmlA(id = "a")),
   'unused argument (htmlA(id = "a"))', 
  fixed = TRUE)

})
