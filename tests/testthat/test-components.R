context("components")

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
