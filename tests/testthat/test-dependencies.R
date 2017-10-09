context("html-dependencies")

test_that("Can set/get/render (external) dependencies", {

  app <- Dash$new()
  default <- app$dependencies_get()
  expect_null(default)

  # add the dash styleguide
  dash_css <- htmltools::htmlDependency(
    name = "dash-css",
    version = "1.0.0",
    src = c(href = "https://codepen.io/chriddyp/pen"),
    stylesheet = "bWLwgP.css"
  )
  app$dependencies_set(dash_css)

  expect_equal(
    as.character(render_dependencies(app$dependencies_get(), local = FALSE)),
    '<link href="https://codepen.io/chriddyp/pen/bWLwgP.css" rel="stylesheet" />'
  )

  # TODO: render DOM and ensure css get placed in <head>

})
