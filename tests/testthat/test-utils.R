test_that("remove_empty", {
  expect_error(remove_empty())
  expect_null(remove_empty(NULL))
  expect_identical(remove_empty(c(NULL, "A", "B")), c("A", "B"))
  expect_identical(remove_empty(c(NULL, NULL)), c())
  expect_identical(remove_empty(list(NULL, "A", "B")), list("A", "B"))
  expect_identical(remove_empty(list(NULL, "A", NULL, "B")), list("A", "B"))
  expect_identical(remove_empty(list(NULL, NULL)), list())
})

test_that("assert_dash", {
  expect_error(assert_dash())
  expect_error(assert_dash(NULL))
  expect_error(assert_dash("string"))
  expect_true(assert_dash(Dash$new()))
  expect_true(assert_dash(dash_app()))
  expect_true(assert_dash(set_layout(dash_app(), "test")))
})

test_that("componentify basics", {
  expect_error(componentify())
  expect_error(componentify(mtcars))
  expect_error(componentify(c("foo", "bar")))
  expect_null(componentify(NULL))
  expect_identical(
    componentify(div("foo")),
    div("foo")
  )
  expect_identical(
    componentify(dccInput("foo", "bar")),
    dccInput("foo", "bar")
  )
})

test_that("componentify simple child", {
  expect_identical(
    componentify(10),
    span(10)
  )
  expect_identical(
    componentify("foo"),
    span("foo")
  )
  expect_identical(
    componentify(TRUE),
    span(TRUE)
  )
})

test_that("componentify list", {
  expect_identical(
    componentify(list("foo", "bar")),
    div(span("foo"), span("bar"))
  )
  expect_identical(
    componentify(list("foo", "bar")),
    div(span("foo"), span("bar"))
  )
  expect_identical(
    componentify(list("foo", dccInput("foo", "bar"), 10, div("bar"))),
    div(
      span("foo"),
      dccInput("foo", "bar"),
      span(10),
      div("bar")
    )
  )
})
