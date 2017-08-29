context("callback")

test_that("Referencing component properties that don't exist throws errror", {

  app <- Dash$new()


  app$layout_set(
    core_slider(id = "x"),
    html_div(id = "y")
  )

  expect_error(
    app$callback(
      function(x = input("x")) {
        x
      },
      output("y", "nonsense")
    ),
    "'nonsense' is not a valid property for 'html_div' components"
  )

  expect_error(
    app$callback(
      function(x = input("x", "gobble-gobble")) {
        x
      },
      output("y")
    ),
    "'gobble-gobble' is not a valid property for 'core_slider' components"
  )

})
