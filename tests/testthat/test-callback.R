context("callback")

test_that("Callback inputs must be well-defined", {

  app <- Dash$new()

  app$layout(
    dccSlider(id = "x"),
    htmlDiv(id = "y")
  )

  expect_warning(
    app$callback(
      output=list(id = "y", children = "nonsense"),
      params=list(
        input(id = "x", property = "value")
      ),
      function(x) {
        output("y", "nonsense")
      }
    ),
    "'nonsense' is not a valid property for the component with id 'y'"
  )

  app$callback(
    output=list(id = "y", property = "nonsense"),
    params=list(
      input(id = "x", property = "value")
    ),
    function(x) {
      output("y", "nonsense")
    }
  )
  
  expect_warning(
    app$callback(
      output=list(id = "y", property = "value"),
      params=list(
        input(id = "x", property = "gobble-gobble")
      ),
      function(x) {
        output("y", "value")
      }
    ),
    "'gobble-gobble' is not a valid property for the component with id 'x'"
  )

})


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
        output("y", "nonsense")
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
        output("y", "value")
      }
    )
  )

})
