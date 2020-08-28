context("attributes")

test_that("stylesheets can be added with or without attributes", {
  library(dashHtmlComponents)
  stylesheet_pattern <- '^.*<link href="(https.*)">.*$'
  script_pattern <- '^.*<script src="(https.*)">.*$'
      
  app <- Dash$new(external_stylesheets = list(
                                           list(
                                             href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                                             hreflang="en-us")
                                           ),
                  external_scripts = list(
                    "https://www.google-analytics.com/analytics.js",
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
  
  app$layout(htmlDiv(
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

})

test_that("invalid attributes trigger a warning", {
  library(dashHtmlComponents)

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

  expect_error(dash:::assertValidExternals(external_scripts, external_stylesheets), 
    "The following script or stylesheet attributes are invalid: baz, foo, bar.")
})

test_that("not passing named attributes triggers an error", {
  library(dashHtmlComponents)

  external_stylesheets <- list(
                            list(
                              href="https://codepen.io/chriddyp/pen/bWLwgP.css",
                              foo="somedata",
                              "moredata"
                              )
                            )
                                            
  external_scripts <- list()

  expect_error(dash:::assertValidExternals(external_scripts, external_stylesheets), 
    "Please verify that all attributes are named elements when specifying URLs for scripts and stylesheets.")
})

