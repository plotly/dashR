#' @importFrom routr Route

dash_route <- routr::Route$new()

dash_route$add_handler("get", "/_dash-layout", function(request, response, keys, ...) {
  response$status <- 200L
  response$body <- list(
    h1 = 'This is a test server'
  )
  FALSE
})
