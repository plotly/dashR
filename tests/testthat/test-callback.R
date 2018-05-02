context("callback")

test_that("Callback inputs must be well-defined", {

  app <- Dash$new()

  app$layout_set(
    coreSlider(id = "x"),
    htmlDiv(id = "y")
  )

  expect_warning(
    app$callback(
      function(x = input("x")) x,
      output("y", "nonsense")
    ),
    "'nonsense' is not a valid property for the component with id 'y'"
  )

  expect_warning(
    app$callback(
      function(x = input("x", "gobble-gobble")) x,
      output("y")
    ),
    "'gobble-gobble' is not a valid property for the component with id 'x'"
  )

})


test_that("Can suppress warnings", {

  app <- Dash$new(suppress_callback_exceptions = TRUE)

  app$layout_set(
    coreSlider(id = "x"),
    htmlDiv(id = "y")
  )

  expect_silent(
    app$callback(
      function(x = input("x")) x,
      output("y", "nonsense")
    )
  )


  expect_silent(
    app$callback(
      function(x = input("x", "gobble-gobble")) x,
      output("y")
    )
  )

})
