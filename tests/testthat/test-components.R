context("components")

test_that("Components work recursively (components can be children of components)", {

  # div inside a div
  x <- htmlDiv(id = "one", htmlDiv(id = "two"))
  expect_true(is.component(x))
  expect_true(x$props$id == "one")
  inner <- x$props$children[[1]]
  expect_true(is.component(inner))
  expect_true(inner$props$id == "two")

  # slider inside a div
  x <- htmlDiv(
    coreSlider(
      id = "h",
      min = 1,
      max = 100,
      value = 48
    )
  )

  expect_true(is.component(x))
  slider <- x$props$children[[1]]
  expect_true(is.component(slider))
  expect_true(slider$props$id == "h")
  expect_true(slider$props$min == 1)
  expect_true(slider$props$max == 100)
  expect_true(slider$props$value == 48)
})

test_that("Component constructors behave as intended", {

  # components have three main keys
  # (1) props: or the main properties, which are recursive (component)
  # (2) type: or the 'name' of the component
  # (3) namespace: is this a core/html component?

  expect_component_names <- function(component) {
    diff <- setdiffsym(names(component), c("props", "type", "namespace", "propNames", "package"))
    expect_length(diff, 0)
  }

  expect_component_names(htmlA())
  expect_component_names(coreDropdown())


  expect_equal(
    htmlH2("A header")$props$children[[1]], "A header"
  )

  # test akin to this one https://github.com/plotly/dash-renderer/blob/851d717b/tests/test_render.py#L25-L38
  vals <- list("Basic string", 3.14, NULL, htmlDiv("Just a test"))
  prop_vals <- htmlH2(vals)$props
  expect_identical(prop_vals$children[[1]], vals)

  # TODO: test the rendered DOM!

})


test_that("Giving nonsense arguments to components yields error", {
  expect_error(
    htmlA(nonsense = "string"),
    "Didn't recognize the following named arguments: 'nonsense'",
    fixed = TRUE
  )
})


test_that("Can identify whether a component contains a component of a given type", {
  g <- coreGraph()
  s <- coreSlider()
  expect_true(component_contains_type(g, "dashCoreComponents", "Graph"))
  expect_false(component_contains_type(g, "dash", "Graph"))
  expect_false(component_contains_type(s, "dashCoreComponents", "Graph"))
  expect_true(component_contains_type(htmlDiv(s, htmlDiv(g)), "dashCoreComponents", "Graph"))
})


#test_that("core component plotly.js bundle isn't included unless Graph() is provided", {
#  app <- Dash$new()
#  g <- coreGraph()
#  app$layout_set(g)
#  # TODO: render DOM and search for plotly.js bundle?
#})

library(htmltools)
test_that("Can translate shiny.tags to components", {

  expect_identical(
    as_component(tags$div()),
    htmlDiv()
  )
  expect_identical(
    as_component(tags$div(tags$div())),
    htmlDiv(htmlDiv())
  )
  expect_identical(
    as_component(tags$div(id = "foo", tags$div(class = "bar"))),
    htmlDiv(id = "foo", htmlDiv(className = "bar"))
  )
  expect_identical(
    as_component(tags$div(style = "position: absolute", tags$div(class = "bar"))),
    htmlDiv(style = list(position = "absolute"), htmlDiv(className = "bar"))
  )
  expect_identical(
    as_component(tags$div(style = "position: absolute; width: 100%", tags$div(class = "bar"))),
    htmlDiv(style = list(position = "absolute", width = "100%"), htmlDiv(className = "bar"))
  )
  tagz <- tagList(
    tags$a(href = "/testing"),
    tags$h1("a title")
  )
  expect_identical(
    as_component(tagz),
    list(htmlA(href = "/testing"), htmlH1("a title"))
  )
})

test_that("Can translate arbitrary HTML string", {
  skip_if_not_installed("dashDangerouslySetInnerHtml")

  html <- "<div> 1 </div>"
  expect_identical(
    as_component(HTML(html)),
    dashDangerouslySetInnerHtml::DangerouslySetInnerHTML(HTML(html))
  )

})
