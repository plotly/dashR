context("customindex")

test_that("Omitting required template keys produces warnings", {
  string <-
    "<!DOCTYPE html>
  <html>
  <head>
  {%meta_tags%}
  <title>Testing Again</title>
  {%favicon%}
  {%css_tags%}
  </head>
  <body>
  {%app_entry%}
  <footer>
  {%config%}
  {%scripts%}
  </footer>
  </body>
  </html>"
  
  app <- Dash$new()
  
  expect_error(
    app$index_string(gsub("\\{\\%config\\%\\}|\\{\\%scripts\\%\\}|\\{\\%app_entry\\%\\}", "", string)),
    "Did you forget to include app_entry, config, scripts in your index string?"
  )
  
  expect_error(
    app$index_string(gsub("\\{\\%scripts\\%\\}", "", string)),
    "Did you forget to include scripts in your index string?"
  )
  
  expect_error(
    app$index_string(gsub("\\{\\%app_entry\\%\\}", "", string)),
    "Did you forget to include app_entry in your index string?"
  )
  
  expect_error(
    app$index_string(gsub("\\{\\%config\\%\\}", "", string)),
    "Did you forget to include config in your index string?"
  )
})

test_that("Customizing title using `name` produces a warning", {

  expect_warning(
    Dash$new(name="Testing"),
    "The supplied application title, 'Testings', should be set using the title() method, or passed via index_string() or interpolate_index(); it has been ignored, and 'dash' will be used instead.",
    fixed=TRUE
  )
})
