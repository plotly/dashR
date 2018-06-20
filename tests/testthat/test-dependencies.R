context("html-dependencies")

test_that("Can set/get/render (external) dependencies", {

  app <- Dash$new()
  default <- app$dependencies_get()
  expect_length(default, 0)

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


test_that("plotly.js is only included if a coreGraph() is", {

  # helper function
  has_plotly <- function(app) {
    d <- app$dependencies_get()
    d <- setNames(d, sapply(d, "[[", "name"))
    any(grepl("plotly", d[["dash-core-components"]]$script))
  }

  # by default, an app that has core components,
  # but *no* coreGraph() should *not* have plotly.js
  app <- Dash$new()
  app$layout_set(
    coreLocation('url', refresh = FALSE),
    coreLink('Navigate to "/"', href = '/'),
    htmlBr(),
    coreLink('Navigate to "/page-2"', href = '/page-2'),
    htmlDiv(id = 'page-content')
  )
  app$callback(
    function(pathname = input("url", "pathname")) {
      htmlH3(paste("You are on page", pathname))
    },
    output("page-content")
  )
  expect_false(has_plotly(app))

  # but, this can be turned off
  app <- Dash$new(exclude_plotly_bundle = FALSE)
  app$layout_set(
    coreLocation('url', refresh = FALSE),
    coreLink('Navigate to "/"', href = '/'),
    htmlBr(),
    coreLink('Navigate to "/page-2"', href = '/page-2'),
    htmlDiv(id = 'page-content')
  )
  app$callback(
    function(pathname = input("url", "pathname")) {
      htmlH3(paste("You are on page", pathname))
    },
    output("page-content")
  )
  expect_true(has_plotly(app))

  # of course, app that does have coreGraph() should include plotly.js
  app <- Dash$new()
  app$layout_set(
    htmlDiv(
      coreDropdown(
        id = 'dropdown',
        options = c('A', 'B'),
        value = 'A'
      ),
      coreGraph(id = 'graph')
    )
  )

  app$callback(
    function(value = input("dropdown")) {
      list(
        data = list(
          list(x = c(1, 2, 3), y = c(4, 1, 2))
        ),
        layout = list(
          title = paste('Graph of ', value),
          margin = list(l = 20, b = 20, r = 10, t = 60)
        )
      )
    }, output("graph", "figure")
  )

  d <- app$dependencies_get()
  d <- setNames(d, sapply(d, "[[", "name"))
  hasPlotly <- any(grepl("plotly", d[["dash-core-components"]]$script))
  expect_true(hasPlotly)

})
