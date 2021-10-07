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
