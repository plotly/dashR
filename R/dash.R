#' Generate a Dash server
#'
#' The Dash generator inherits from the [fiery::Fire] class.
#'
#' @usage NULL
#' @format NULL
#'
#' @section Initialization:
#' A new 'Dash'-object is initialized using the `new()` method on the generator:
#'
#' \strong{Usage}
#' \tabular{l}{
#'  `app <- Dash$new(name = "dash", url_base_pathname = "/", csrf_protect = TRUE)`
#' }
#'
#' \strong{Arguments}
#' \tabular{lll}{
#'  `host` \tab  \tab A string overriding the default host (see the *Fields* section below)\cr
#'  `port` \tab  \tab An integer overriding the default port (see the *Fields* section below)
#' }
#'
#' @section Fields:
#' \describe{
#'  \item{`name`}{A name for the dash server.}
#'  \item{`url_base_pathname`}{a path for prepending to dash endpoints.}
#'  \item{`csrf_protect``}{prevent cross-site request forgery (CSRF)}
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{}
#' }
#'
#' @export
#' @docType class
#'
#' @examples
#'
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
    name = NULL,
    server = NULL,
    url_base_pathname = NULL,
    csrf_protect = NULL,
    initialize = function(name = "dash", server = fiery::Fire$new(),
                          url_base_pathname = '/', csrf_protect = TRUE) {
      self$name <- name
      self$server <- server
      self$url_base_pathname <- url_base_pathname
      self$csrf_protect <- csrf_protect
    },
    layout_set = function(...) {
      private$ui <- html_div(
        list(...), id = "react-entry-point"
      )
    },
    layout_get = function() {
      private$ui
    },
    add_callback = function() {
      stop("Not yet implemented")
    },
    run_server = function(block = TRUE, showcase = FALSE, ...) {
      self$server$ignite(block = block, showcase = showcase, ...)
    }
  ),

  private = list(
    ui = welcome_page()
  )

  #active = list(
  #  config = function(supress_callback_exceptions) {
  #    if (!missing(supress_callback_exceptions)) {
  #      self$config$supress_callback_exceptions <- supress_callback_exceptions
  #    }
  #    self
  #  }
  #)
)


