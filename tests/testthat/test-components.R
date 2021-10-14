test_that("Components work recursively (components can be children of components)", {

  # div inside a div
  x <- html$div(id = "one", html$div(id = "two"))
  expect_true(is.component(x))
  expect_true(is.component(x[[1]]$children))

  # slider inside a div
  x <- html$div(
    dccSlider(
      id = "h",
      min = 1,
      max = 100,
      value = 48
    )
  )

  expect_true(is.component(x))
  expect_true(is.component(x[[1]]$children))
  slider <- x$props
  expect_true(slider$children$props[["id"]] == "h")
  expect_true(slider$children$props[["min"]] == 1)
  expect_true(slider$children$props[["max"]] == 100)
  expect_true(slider$children$props[["value"]] == 48)
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

  expect_component_names(html$a())
  expect_component_names(dccDropdown())

  expect_equal(
    html$h2("A header")$props$children[[1]], "A header"
  )

  # test akin to this one https://github.com/plotly/dash-renderer/blob/851d717b/tests/test_render.py#L25-L38
  vals <- list("Basic string", 3.14, NULL, html$div("Just a test"))
  prop_vals <- html$h2(vals)$props
  expect_identical(prop_vals$children[[1]], vals[[1]])

  # TODO: test the rendered DOM!

})


test_that("Giving nonsense arguments to components yields error", {
  expect_error(
    html$a(nonsense = "string", gibberish = "string"),
    "The following props are not valid in this component: 'nonsense, gibberish'",
    fixed = TRUE
  )
})

test_that("wildcard attributes work with children", {
  s1 <- html$span("hmm", className = "value-output", `data-icon` = "fa-pencil")
  s2 <- html$span(list("hmm"), className = "value-output", `data-icon` = "fa-pencil")

  expect_equal(s1$props$children, "hmm")
  expect_equal(s1$props$`data-icon`, "fa-pencil")
  expect_equal(s2$props$children, list("hmm"))
  expect_equal(s2$props$`data-icon`, "fa-pencil")
})

# test_that("Can translate arbitrary HTML string", {
#   skip_if_not_installed("dashDangerouslySetInnerHtml")
#
#   html <- "<div> 1 </div>"
#   expect_is(
#     dashDangerouslySetInnerHtml::DangerouslySetInnerHTML(HTML(html)),
#     "dash_component"
#   )
# })
