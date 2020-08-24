context("routes")

test_that("URLs are properly redirected with app$redirect", {
 library(dashHtmlComponents)

 app <- Dash$new()

 app$redirect("/foo", "/")
 app$redirect("/bar/*", "/")

 app$layout(htmlDiv(
  "Hello world!"
  )
 )

 request_foo <- fiery::fake_request(
   "http://127.0.0.1:8050/foo"
 )

 request_bar <- fiery::fake_request(
   "http://127.0.0.1:8050/bar/foo"
 )

 # start up Dash briefly to load the routes
 app$run_server(block=FALSE)
 app$server$stop()

 response_foo <- app$server$test_request(request_foo)
 response_bar <- app$server$test_request(request_bar)

 expect_equal(
   response_foo$status,
   301L
  )

 expect_equal(
   response_foo$headers$Location,
   "/"
 )

 expect_equal(
   response_bar$status,
   301L
  )

 expect_equal(
   response_bar$headers$Location,
   "/"
 )

})

test_that("temporary redirection of URLs is possible with app$server_route", {
 library(dashHtmlComponents)

 app <- Dash$new()

 app$server_route("/baz", function(request, response, keys, ...) {
  response$status <- 307L
  response$set_header("Location", "/")
  TRUE
 })

 app$server_route("/qux/*", function(request, response, keys, ...) {
  response$status <- 307L
  response$set_header("Location", "/")
  TRUE
 })

 app$layout(htmlDiv(
  "Hello world!"
  )
 )

 request_baz <- fiery::fake_request(
   "http://127.0.0.1:8050/baz"
 )

 request_qux <- fiery::fake_request(
   "http://127.0.0.1:8050/qux/foo"
 )

 # start up Dash briefly to load the routes
 app$run_server(block=FALSE)
 app$server$stop()

 response_baz <- app$server$test_request(request_baz)
 response_qux <- app$server$test_request(request_qux)

 expect_equal(
   response_baz$status,
   307L
  )

 expect_equal(
   response_baz$headers$Location,
   "/"
 )

 expect_equal(
   response_qux$status,
   307L
  )

 expect_equal(
   response_qux$headers$Location,
   "/"
 )

})