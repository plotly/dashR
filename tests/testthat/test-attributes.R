test_that("stylesheets can be added with or without attributes", {
  stylesheet_pattern <- '^.*<link href="(https.*)">.*$'
  script_pattern <- '^.*<script src="(https.*)">.*$'

  app <- Dash$new(external_stylesheets = list(
                                           list(
                                             href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                                             hreflang="en-us")
                                           ),
                  external_scripts = list(
                    src="https://www.google-analytics.com/analytics.js",
                    list(
                      src = "https://cdn.polyfill.io/v2/polyfill.min.js"
                    ),
                    list(
                      src = "https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.10/lodash.core.js",
                      integrity = "sha256-Qqd/EfdABZUcAxjOkMi8eGEivtdTkh3b65xCZL4qAQA=",
                      crossorigin = "anonymous"
                    )
                  )
          )

  app$layout(html$div(
    "Hello world!"
  )
  )

  request_with_attributes <- fiery::fake_request(
    "http://127.0.0.1:8050"
  )

  # start up Dash briefly to generate the index
  app$run_server(block=FALSE)
  app$server$stop()

  response_with_attributes <- app$server$test_request(request_with_attributes)

  tags_by_line <- lapply(strsplit(response_with_attributes$body, "\n "), function(x) trimws(x))[[1]]
  stylesheet_hrefs <- grep(stylesheet_pattern, tags_by_line, value = TRUE)
  script_hrefs <- grep(script_pattern, tags_by_line, value = TRUE)

  expect_equal(
    stylesheet_hrefs,
    "<link href=\"https://codepen.io/chriddyp/pen/bWLwgP.css\" hreflang=\"en-us\" rel=\"stylesheet\">"
  )

  expect_equal(
    script_hrefs,
    c("<script src=\"https://www.google-analytics.com/analytics.js\"></script>",
      "<script src=\"https://cdn.polyfill.io/v2/polyfill.min.js\"></script>",
      "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.10/lodash.core.js\" integrity=\"sha256-Qqd/EfdABZUcAxjOkMi8eGEivtdTkh3b65xCZL4qAQA=\" crossorigin=\"anonymous\"></script>"
    )
  )

  app <- Dash$new(serve_locally=FALSE, external_stylesheets = list(
                                           list(
                                             href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                                             hreflang="en-us")
                                           ),
                  external_scripts = list(
                    src="https://www.google-analytics.com/analytics.js",
                    list(
                      src = "https://cdn.polyfill.io/v2/polyfill.min.js"
                    ),
                    list(
                      src = "https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.10/lodash.core.js",
                      integrity = "sha256-Qqd/EfdABZUcAxjOkMi8eGEivtdTkh3b65xCZL4qAQA=",
                      crossorigin = "anonymous"
                    )
                  )
          )

  app$layout(html$div(
    "Hello world!"
  )
  )

  request_with_attributes <- fiery::fake_request(
    "http://127.0.0.1:8050"
  )

  # start up Dash briefly to generate the index
  app$run_server(block=FALSE)
  app$server$stop()

  response_with_attributes <- app$server$test_request(request_with_attributes)

  tags_by_line <- lapply(strsplit(response_with_attributes$body, "\n "), function(x) trimws(x))[[1]]
  stylesheet_hrefs <- grep(stylesheet_pattern, tags_by_line, value = TRUE)
  script_hrefs <- grep(script_pattern, tags_by_line, value = TRUE)

  # construct the script tags as they should be generated within
  # Dash for R this way the mod times and version numbers will
  # always be in sync with those used by the backend
  internal_hrefs <- vapply(.dash_js_metadata(), function(x) x$src$href, character(1))

  dcc <- .dashCoreComponents_js_metadata()
  dhc <- .dashHtmlComponents_js_metadata()
  dt <- .dashTable_js_metadata()
  dbc <- .dashBootstrapComponents_js_metadata()

  dcc_min <- dcc[which(sapply(dcc, "[[", "script") == "dcc/dash_core_components.js")][[1]]
  dcc_shared <- dcc[which(sapply(dcc, "[[", "script") == "dcc/dash_core_components-shared.js")][[1]]
  dhc_min <- dhc[which(sapply(dhc, "[[", "script") == "html/dash_html_components.min.js")][[1]]
  dt_bundle <- dt[which(sapply(dt, "[[", "script") == "dash_table/bundle.js")][[1]]
  dbc_min <- dbc[which(sapply(dbc, "[[", "script") == "_components/dash_bootstrap_components.min.js")][[1]]

  dcc_min_path <- getDependencyPath(dcc_min)
  dcc_min_modtime <- as.integer(file.mtime(dcc_min_path))
  dcc_min_filename <- basename(buildFingerprint(dcc_min$script, dcc_min$version, dcc_min_modtime))

  dcc_shared_path <- getDependencyPath(dcc_shared)
  dcc_shared_modtime <- as.integer(file.mtime(dcc_shared_path))
  dcc_shared_filename <- basename(buildFingerprint(dcc_shared$script, dcc_shared$version, dcc_shared_modtime))

  dhc_min_path <- getDependencyPath(dhc_min)
  dhc_min_modtime <- as.integer(file.mtime(dhc_min_path))
  dhc_min_filename <- basename(buildFingerprint(dhc_min$script, dhc_min$version, dhc_min_modtime))

  dt_bundle_path <- getDependencyPath(dt_bundle)
  dt_bundle_modtime <- as.integer(file.mtime(dt_bundle_path))
  dt_bundle_filename <- basename(buildFingerprint(dt_bundle$script, dt_bundle$version, dt_bundle_modtime))

  dbc_min_path <- getDependencyPath(dbc_min)
  dbc_min_modtime <- as.integer(file.mtime(dbc_min_path))
  dbc_min_filename <- basename(buildFingerprint(dbc_min$script, dbc_min$version, dbc_min_modtime))

  dcc_min_ref <- paste0("/",
                    "_dash-component-suites/",
                    dcc_min$name,
                    "/",
                    dcc_min_filename,
                    "?v=",
                    dcc_min$version,
                    "&m=",
                    dcc_min_modtime)
  dcc_shared_ref <- paste0("/",
                        "_dash-component-suites/",
                        dcc_shared$name,
                        "/",
                        dcc_shared_filename,
                        "?v=",
                        dcc_shared$version,
                        "&m=",
                        dcc_shared_modtime)
  dhc_ref <- paste0("/",
                    "_dash-component-suites/",
                    dhc_min$name,
                    "/",
                    dhc_min_filename,
                    "?v=",
                    dhc_min$version,
                    "&m=",
                    dhc_min_modtime)
  dt_ref <- paste0("/",
                    "_dash-component-suites/",
                    dt_bundle$name,
                    "/",
                    dt_bundle_filename,
                    "?v=",
                    dt_bundle$version,
                    "&m=",
                    dt_bundle_modtime)
  dbc_ref <- paste0("/",
                    "_dash-component-suites/",
                    dbc_min$name,
                    "/",
                    dbc_min_filename,
                    "?v=",
                    dbc_min$version,
                    "&m=",
                    dbc_min_modtime)
  all_tags <- glue::glue("<script src=\"{c(internal_hrefs[c(\"react-prod\",
                                                            \"react-dom-prod\",
                                                            \"prop-types-prod\",
                                                            \"polyfill-prod\")],
                                           dbc_ref,
                                           dcc_min_ref,
                                           dcc_shared_ref,
                                           dhc_ref,
                                           dt_ref,
                                           internal_hrefs[\"dash-renderer-prod\"])}\"></script>\n")

  expect_equal(
    stylesheet_hrefs,
    "<link href=\"https://codepen.io/chriddyp/pen/bWLwgP.css\" hreflang=\"en-us\" rel=\"stylesheet\">"
  )

  expect_equal(
    script_hrefs,
      c(glue::glue_collapse(all_tags, sep="\n"),
      "<script src=\"https://www.google-analytics.com/analytics.js\"></script>",
      "<script src=\"https://cdn.polyfill.io/v2/polyfill.min.js\"></script>",
      "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.10/lodash.core.js\" integrity=\"sha256-Qqd/EfdABZUcAxjOkMi8eGEivtdTkh3b65xCZL4qAQA=\" crossorigin=\"anonymous\"></script>"
    )
  )

})

test_that("invalid attributes trigger an error", {
  external_stylesheets <- list(
                            list(
                              href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                              foo="somedata",
                              bar="moredata"
                              )
                            )

  external_scripts <- list(
                        "https://www.google-analytics.com/analytics.js",
                        list(
                          src = "https://cdn.polyfill.io/v2/polyfill.min.js"
                        ),
                        list(
                          src = "https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.10/lodash.core.js",
                          integrity = "sha256-Qqd/EfdABZUcAxjOkMi8eGEivtdTkh3b65xCZL4qAQA=",
                          baz = "anonymous"
                        )
                      )

  expect_error(assertValidExternals(external_scripts, external_stylesheets),
    "The following script or stylesheet attributes are invalid: baz, foo, bar.")
})

test_that("not passing named attributes triggers an error", {
  external_stylesheets <- list(
                            list(
                              href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                              foo="somedata",
                              "moredata"
                              )
                            )

  external_scripts <- list()

  expect_error(assertValidExternals(external_scripts, external_stylesheets),
    "Please verify that all attributes are named elements when specifying URLs for scripts and stylesheets.")
})

test_that("stylesheet can be passed as a simple list", {
  stylesheet_pattern <- '^.*<link href="(https.*)">.*$'
  script_pattern <- '^.*<script src="(https.*)">.*$'

  app <- Dash$new(external_stylesheets = list("https://codepen.io/chriddyp/pen/bWLwgP.css"))

  app$layout(html$div(
    "Hello world!"
  )
  )

  request_with_attributes <- fiery::fake_request(
    "http://127.0.0.1:8050"
  )

  # start up Dash briefly to generate the index
  app$run_server(block=FALSE)
  app$server$stop()

  response_with_attributes <- app$server$test_request(request_with_attributes)

  tags_by_line <- lapply(strsplit(response_with_attributes$body, "\n "), function(x) trimws(x))[[1]]
  stylesheet_hrefs <- grep(stylesheet_pattern, tags_by_line, value = TRUE)

  expect_equal(
    stylesheet_hrefs,
    "<link href=\"https://codepen.io/chriddyp/pen/bWLwgP.css\" rel=\"stylesheet\">"
  )
})

test_that("not passing named attributes triggers an error", {
  external_stylesheets = list(
                            list(
                              href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                              "somedata"
                              )
                            )

  expect_error(app <- Dash$new(external_stylesheets=external_stylesheets),
    "Please verify that all attributes are named elements when specifying URLs for scripts and stylesheets.")
  expect_error(app <- Dash$new(serve_locally=FALSE, external_stylesheets=external_stylesheets),
    "Please verify that all attributes are named elements when specifying URLs for scripts and stylesheets.")
})

test_that("passing a list with no href/src fails", {
  stylesheet_pattern <- '^.*<link href="(https.*)">.*$'
  script_pattern <- '^.*<script src="(https.*)">.*$'

  expect_error(app <- Dash$new(external_stylesheets = list(
                      href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                            list(
                              integrity="somedata",
                              crossorigin="moredata"
                              )
                            )
                  ),
                  "A valid URL must be included with every entry in external_stylesheets. Please sure no 'href' entries are missing or malformed.")

  expect_error(app <- Dash$new(serve_locally=FALSE, external_stylesheets = list(
                      href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                            list(
                              integrity="somedata",
                              crossorigin="moredata"
                              )
                            )
                  ),
                  "A valid URL must be included with every entry in external_stylesheets. Please sure no 'href' entries are missing or malformed.")

  expect_error(app <- Dash$new(external_scripts = list(
                      href="https://rivetscriptemporium.com/test.js",
                            list(
                              integrity="somedata",
                              crossorigin="moredata"
                              )
                            )
                  ),
                  "A valid URL must be included with every entry in external_scripts. Please sure no 'src' entries are missing or malformed.")

  expect_error(app <- Dash$new(serve_locally=FALSE, external_scripts = list(
                      href="https://rivetscriptemporium.com/test.js",
                            list(
                              integrity="somedata",
                              crossorigin="moredata"
                              )
                            )
                  ),
                  "A valid URL must be included with every entry in external_scripts. Please sure no 'src' entries are missing or malformed.")
})

test_that("default favicon resource is supplied when none is present in assets", {
  favicon_pattern <- '^.*<link href=".*/_favicon.*">.*$'

  app <- Dash$new()

  app$layout(html$div(
    "Hello world!"
  )
  )

  request_with_attributes <- fiery::fake_request(
    "http://127.0.0.1:8050"
  )

  # start up Dash briefly to generate the index
  app$run_server(block=FALSE)
  app$server$stop()

  response_with_attributes <- app$server$test_request(request_with_attributes)

  tags_by_line <- lapply(strsplit(response_with_attributes$body, "\n "), function(x) trimws(x))[[1]]
  favicon_hrefs <- grep(favicon_pattern, tags_by_line, value = TRUE)

  expect_equal(
    favicon_hrefs,
    "<link href=\"/_favicon.ico\" rel=\"icon\" type=\"image/x-icon\">"
  )
})
