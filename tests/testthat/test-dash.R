test_that("Can access fiery server within a dash app", {

  d <- Dash$new()
  expect_is(d, c("Dash", "R6"))
  expect_is(d$server, c("Fiery", "R6"))

})

test_that("Can set/get layout", {

  d <- Dash$new()
  div <- html$div("A div", id = "An id")
  d$layout(div)

  l <- d$layout_get()

  # dynamic layouts
  d$layout(function() { html$div("A div", id = "An id") })
  l2 <- d$layout_get()
  expect_identical(l, l2)
  expect_is(d$layout_get(render = FALSE), "function")

})

# Simplified dash_app syntax unittests

test_that("add_meta", {

  get_meta <- function(app) {
    app$.__enclos_env__$private$meta_tags
  }

  meta1 <- list(name = "keywords", content = "foo, analysis, graphs")
  meta2 <- list(name = "viewport", content = "width=device-width, initial-scale=1.0")

  expect_error(add_meta(meta1))
  expect_identical(
    dash_app() %>% add_meta(meta1) %>% get_meta(),
    Dash$new(meta_tags = list(meta1)) %>% get_meta()
  )
  expect_identical(
    dash_app() %>% add_meta(meta1) %>% get_meta(),
    dash_app() %>% add_meta(list(meta1)) %>% get_meta()
  )
  expect_identical(
    dash_app() %>% add_meta(list(meta1, meta2)) %>% get_meta(),
    Dash$new(meta_tags = list(meta1, meta2)) %>% get_meta()
  )
  expect_identical(
    dash_app() %>% add_meta(meta1) %>% add_meta(meta2) %>% get_meta(),
    dash_app() %>% add_meta(list(meta1, meta2)) %>% get_meta()
  )
})

test_that("add_stylesheet", {

  get_sheets <- function(app) {
    app$.__enclos_env__$self$config$external_stylesheets
  }

  sheet_simple1 <- "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
  sheet_simple2 <- "https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
  sheet_full <- list(
    href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css",
    integrity = "sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
  )

  expect_error(add_stylesheet(sheet_simple1))
  expect_identical(
    dash_app() %>% add_stylesheet(sheet_simple1) %>% get_sheets(),
    Dash$new(external_stylesheets = list(sheet_simple1)) %>% get_sheets()
  )
  expect_identical(
    dash_app() %>% add_stylesheet(sheet_simple1) %>% get_sheets(),
    dash_app() %>% add_stylesheet(list(sheet_simple1)) %>% get_sheets()
  )
  expect_identical(
    dash_app() %>% add_stylesheet(list(sheet_simple1, sheet_simple2)) %>% get_sheets(),
    Dash$new(external_stylesheets = list(sheet_simple1, sheet_simple2)) %>% get_sheets()
  )
  expect_identical(
    dash_app() %>% add_stylesheet(sheet_full) %>% get_sheets(),
    Dash$new(external_stylesheets = list(sheet_full)) %>% get_sheets()
  )
  expect_identical(
    dash_app() %>% add_stylesheet(list(sheet_simple1, sheet_simple2)) %>% add_stylesheet(sheet_full) %>% get_sheets(),
    Dash$new(external_stylesheets = list(sheet_simple1, sheet_simple2, sheet_full)) %>% get_sheets()
  )
})

test_that("add_script", {

  get_scripts <- function(app) {
    app$.__enclos_env__$self$config$external_scripts
  }

  script_simple1 <- "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
  script_simple2 <- "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
  script_full <- list(
    src = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js",
    integrity = "sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
  )

  expect_error(add_script(script_simple1))
  expect_identical(
    dash_app() %>% add_script(script_simple1) %>% get_scripts(),
    Dash$new(external_scripts = list(script_simple1)) %>% get_scripts()
  )
  expect_identical(
    dash_app() %>% add_script(script_simple1) %>% get_scripts(),
    dash_app() %>% add_script(list(script_simple1)) %>% get_scripts()
  )
  expect_identical(
    dash_app() %>% add_script(list(script_simple1, script_simple2)) %>% get_scripts(),
    Dash$new(external_scripts = list(script_simple1, script_simple2)) %>% get_scripts()
  )
  expect_identical(
    dash_app() %>% add_script(script_full) %>% get_scripts(),
    Dash$new(external_scripts = list(script_full)) %>% get_scripts()
  )
  expect_identical(
    dash_app() %>% add_script(list(script_simple1, script_simple2)) %>% add_script(script_full) %>% get_scripts(),
    Dash$new(external_scripts = list(script_simple1, script_simple2, script_full)) %>% get_scripts()
  )
})
