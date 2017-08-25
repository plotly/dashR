context("callback")

test_that("Referencing component properties that don't exist throws errror", {

  app <- Dash$new()


  app$layout_set(
    core_slider(id = "x"),
    html_div(id = "y")
  )

  expect_error(
    app$callback(identity, output("y", "nonsense"), input("x")),
    "'nonsense' is not a valid property for 'html_div' components"
  )

  expect_error(
    app$callback(identity, output("y"), input("x", "gobble-gobble")),
    "'gobble-gobble' is not a valid property for 'core_slider' components"
  )

})
