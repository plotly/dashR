context("callback")

test_that("Can suppress warnings", {

  app <- Dash$new(suppress_callback_exceptions = TRUE)

  app$layout(
    dccSlider(id = "x"),
    htmlDiv(id = "y")
  )

  expect_silent(
    app$callback(
      output=list(id = "y", property = "nonsense"),
      params=list(
        input(id = "x", property = "value")
      ),
      function(x) {
        x   
      }
    )
  )


  expect_silent(
    app$callback(
      output=list(id = "y", property = "value"),
      params=list(
        input(id = "x", property = "gobble-gobble")
      ),
      function(x) {
        x 
      }
    )
  )

})
