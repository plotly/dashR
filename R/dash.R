#' Generate a Dash server
#'
#' Description coming soon
#'
#' @usage app <- Dash$new(name = "dash", server = fiery::Fire$new(), url_base_pathname = "/", csrf_protect = TRUE)
#'
#' @section Arguments:
#' \tabular{lll}{
#'   `name` \tab  \tab The name of the Dash application.\cr
#'   `server` \tab  \tab The web server which powers the application. Currently only [fiery::Fire] objects are allowed.\cr
#'   `url_base_pathname` \tab  \tab The base path for locating the Dash application.\cr
#'   `csrf_protect` \tab  \tab Whether to protect the Dash application from CSRF vulnerabilities.
#' }
#'
#' @section Fields:
#' \describe{
#'  \item{`server`}{A [fiery::Fire] object}
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{`layout_set(...)`}{Set the layout (i.e., user interface). Should be a collection of [components]}
#'   \item{`layout_get()`}{Retrieves the layout (i.e., user interface).}
#'   \item{`config_set(suppress_callback_exceptions, permissions_cache_expiry)`}{Set the config.}
#'   \item{`config_get()`}{Get the config.}
#'   \item{`callback(output, input, state)`}{Define the dependency graph (i.e., input/output relationships).}
#'   \item{`run_server(block = TRUE, showcase = FALSE, ...)`}{Launch the application. See [fiery::Fire] methods for a description of the arguments}
#' }
#'
#' @export
#' @docType class
#' @format An [R6::R6Class] generator object
#' @author Carson Sievert
#' @seealso <https://plot.ly/dash/>
#'
#' @examples
#'
#' # hello dash!
#' app <- dasher::Dash$new()
#' \dontrun{
#' app$run_server()
#' }
#'
#'
#' # use the layout_set method to define your UI
#' app$layout_set(
#'   html_h2("Hello Dash"),
#'   "Here is a slider",
#'   core_slider()
#' )
#' # retrieve the layout with layout_get()
#' app$layout_get()
#'
#'

Dash <- R6::R6Class(
  'Dash',
  public = list(
    # see https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L29-L35
    # Yes, I've ignored filename/sharing/app_url in this method...
    # @chriddyp mentioned they are being deprecated/moved to http://github.com/plotly/dash-auth
    # @thomasp85: does/will fiery have support for CSRF? http://flask-seasurf.readthedocs.io/en/latest/
    server = NULL,
    initialize = function(name = "dash", server = fiery::Fire$new(),
                          url_base_pathname = '/', csrf_protect = TRUE) {

      if (!inherits(server, "Fire"))  {
        stop("Only fiery webservers are supported at the moment", call. = FALSE)
      }

      self$server <- server
      private$name <- name
      private$url_base_pathname <- url_base_pathname
      private$csrf_protect <- csrf_protect

    },
    layout_get = function() {

      private$layout

    },
    layout_set = function(...) {

      private$layout <- html_div(list(...), id = "react-entry-point")

    },
    config_get = function() {

      private$config

    },
    config_set = function(suppress_callback_exceptions = NULL, permissions_cache_expiry = NULL) {

      private$config$suppress_callback_exceptions <-
          suppress_callback_exceptions %||% private$config$suppress_callback_exceptions

      private$config$permissions_cache_expiry <-
        permissions_cache_expiry %||% private$config$permissions_cache_expiry

    },
    callback = function(output, input, state) {
      stop("Not yet implemented")
    },
    run_server = function(block = TRUE, showcase = FALSE, ...) {
      self$server$ignite(block = block, showcase = showcase, ...)
    }
  ),

  private = list(
    name = NULL,
    url_base_pathname = NULL,
    csrf_protect = NULL,
    layout = welcome_page(),
    config = list(
      suppress_callback_exceptions = FALSE,
      permissions_cache_expiry = 5 * 60
    )
  )

)


