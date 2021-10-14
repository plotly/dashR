test_that("Tag basics", {
  expect_identical(div("a", "b"), html$div(list("a", "b")))
  expect_identical(div("a", "b", 5), html$div(list("a", "b", 5)))
  expect_identical(div("a", "b", 5, id = "test"), html$div(list("a", "b", 5), id = "test"))
  expect_identical(
    span("a", 5, id = "test", "b", className = "foo"),
    html$span(list("a", 5, "b"), id = "test", className = "foo")
  )
  expect_identical(
    div(span("test"), dccInput("input")),
    html$div(list(html$span("test"), dccInput("input")))
  )
})

test_that("No children", {
  expect_identical(div(), dash:::htmlDiv())
  expect_identical(div(list()), dash:::htmlDiv(children = list()))
  expect_false(identical(div(), div(list())))
  expect_identical(div(id = "test"), dash:::htmlDiv(id = "test"))
})

test_that("Illegal attributes", {
  expect_error(div(foo = "test"))
  expect_error(div(download = "download"))
  expect_error(a(download = "download"), NA)
})

test_that("Single child is not a list", {
  expect_identical(div("a"), html$div("a"))
  expect_false(identical(div("a"), div(list("a"))))
  expect_identical(div(list("a", "b")), html$div(list("a", "b")))
})

test_that("Boolean and NULL attributes", {
  expect_identical(div(hidden = NA)$props$hidden, "hidden")
  expect_identical(div(hidden = "")$props$hidden, "hidden")
  expect_identical(div(hidden = "test")$props$hidden, "test")
  expect_null(div(hidden = NULL)$props$hidden)
})
