test_that("URLs are properly redirected with app$redirect", {
 app <- Dash$new()

 app$redirect("/foo", "/")
 app$redirect("/bar/*", "/foo")
 app$redirect("/users/:user_id", function(keys) paste0("/accounts/", keys$user_id))

 app$layout(html$div(
  "Hello world!"
  )
 )

 request_foo <- fiery::fake_request(
   "http://127.0.0.1:8050/foo"
 )

 request_bar <- fiery::fake_request(
   "http://127.0.0.1:8050/bar/foo"
 )

 request_fn <- fiery::fake_request(
   "http://127.0.0.1:8050/users/johndoe"
 )

 # start up Dash briefly to load the routes
 app$run_server(block=FALSE)
 app$server$stop()

 response_foo <- app$server$test_request(request_foo)
 response_bar <- app$server$test_request(request_bar)
 response_fn <- app$server$test_request(request_fn)

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
   "/foo"
  )

 expect_equal(
   response_fn$status,
   301L
  )

 expect_equal(
   response_fn$headers$Location,
   "/accounts/johndoe"
  )

})

test_that("temporary redirection of URLs is possible with app$server_route", {
 app <- Dash$new()

 app$server_route("/baz", function(request, response, keys, ...) {
  response$status <- 307L
  response$set_header("Location", "/")
  TRUE
 })

 app$server_route("/qux/*", function(request, response, keys, ...) {
  response$status <- 307L
  response$set_header("Location", "/foo")
  TRUE
 })

 app$layout(html$div(
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
   "/foo"
 )

})
