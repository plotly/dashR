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
#' app$run_server(showcase = TRUE)
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
    server = NULL,
    initialize = function(name = "dash", server = fiery::Fire$new(),
                          url_base_pathname = '/', csrf_protect = TRUE) {

      private$name <- name
      private$url_base_pathname <- url_base_pathname
      private$csrf_protect <- csrf_protect

      if (!inherits(server, "Fire"))  {
        stop("Only fiery webservers are supported at the moment", call. = FALSE)
      }

      # first, add a route to package resources, as described in
      # http://www.data-imaginist.com/2017/Introducing-routr/
      # @thomasp85 any ideas why this doesn't seem to work?

      router <- routr::RouteStack$new()
      # TODO: does this need to respect `url_base_pathname`?
      dasher_resources <- ressource_route('/' = system.file(package = 'dasher'))
      #dasher_resources <- ressource_route('/_dasher-resources' = system.file(package = 'dasher'))
      router$add_route(dasher_resources, 'dasher_resources', after = 1)

      # ------------------------------------------------------------------------
      # define & register routes on the server
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L88-L124
      # ------------------------------------------------------------------------

      route <- routr::Route$new()

      dash_login <- paste0(url_base_pathname, "_dash-login")
      route$add_handler("post", dash_login, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- list(
          h1 = "Not yet implemented"
        )
        FALSE
      })

      # TODO: listviewer::jsonedit() instead of plain JSON?
      dash_layout <- paste0(url_base_pathname, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {
        response$status <- 200L
        response$type <- 'json'
        response$body <- to_JSON(private$layout, pretty = TRUE)
        FALSE
      })

      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L367-L378
      dash_deps <- paste0(url_base_pathname, "_dash-dependencies")
      route$add_handler("get", dash_deps, function(request, response, keys, ...) {

        outputs <- strsplit(names(private$callback_map), "\\.")
        new_map <- Map(function(x, y) {
          x[["output"]] <- list(id = y[[1]], property = y[[2]])
          x
        }, private$callback_map, outputs)

        response$status <- 200L
        response$type <- 'json'
        response$body <- to_JSON(setNames(new_map, NULL))
        FALSE
      })

      dash_update <- paste0(url_base_pathname, "_dash-update-component")
      route$add_handler("post", dash_update, function(request, response, keys, ...) {
        browser()
        response$status <- 500L
        response$body <- list(
          h1 = "Not yet implemented"
        )
        FALSE
      })

      dash_suite <- paste0(url_base_pathname, "_dash-component-suites")
      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- list(
          h1 = "Not yet implemented"
        )
        FALSE
      })

      dash_routes <- paste0(url_base_pathname, "_dash-routes")
      route$add_handler("get", dash_routes, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- list(
          h1 = "Not yet implemented"
        )
        FALSE
      })

      catch_all <- paste0(url_base_pathname, "*")
      route$add_handler("get", catch_all, function(request, response, keys, ...) {
        response$status <- 200L
        response$type <- 'html'
        response$body <- private$index()
        FALSE
      })

      # TODO: is using the app name in this way a good idea?
      router$add_route(route, name)
      server$attach(router)

      # --------------------------------------------------------------------
      # When the server boots, serve all the assets and what-not
      # --------------------------------------------------------------------

      #server$on("start", function(server, ...) {
      #  private$layout
      #})

      self$server <- server

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
    # TODO: make this the 'default' callback method, but provide specialized methods that know
    # how to "containerize" special types of output (e.g., callback_plot(), callback_print(), etc)
    callback = function(fun = NULL, output = NULL, inputs = NULL, states = NULL) {

      if (!is.function(fun)) {
        stop("fun must be a valid R function", call. = FALSE)
      }

      # caching on the filesytem should ensure memoization works across sessions?
      # or at least at some point in the future?
      # https://github.com/r-lib/memoise/issues/29
      #fm <- memoise::memoise(
      #  fun, cache = memoise::cache_filesystem()
      #)

      # a *single* output is required
      if (!is.output(output)) {
        stop("The `output` argument must be a result of the output() function", call. = FALSE)
      }

      # ensure we have a *list* of inputs
      if (is.null(inputs) || is.input(inputs)) inputs <- list(inputs)
      is_input <- vapply(inputs, is.input, logical(1))
      if (!all(is_input)) {
        stop("The `inputs` argument must be a list of input() objects", call. = FALSE)
      }

      # states is optional
      if (!is.null(states)) {
        # but, when specified, must be a list
        if (is.state(states)) states <- list(states)
        is_state <- vapply(inputs, is.state, logical(1))
        if (!all(is_state)) {
          stop("The `states` argument must be a list of state() objects", call. = FALSE)
        }
      }

      # TODO: verify the component_values are valid given the layout
      # available_events <- c("children", names(formals(match.fun("html_a")))[-1])


      # store the callback mapping/function so we may access it later
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L530-L546
      # TODO: leverage tidyeval to ensure we're evaluating things in proper envir?
      outputID <- paste(unlist(output), collapse = ".")
      private$callback_map[[outputID]] <- list(inputs = inputs, state = states)
      private$callback_fun[[outputID]] <- fun

    },

    # TODO: the dream!?! Have users just write an expression that reference inputs/outputs?
    #callback_ = function(expr) {
    #  eval(expr)
    #},
    run_server = function(block = TRUE, showcase = FALSE, ...) {

      self$server$ignite(block = block, showcase = showcase, ...)

    }
  ),

  private = list(
    name = NULL,
    url_base_pathname = NULL,
    csrf_protect = NULL,
    layout = welcome_page(),
    # TODO: what is going to be the official interface for some of these options?
    config = list(
      suppress_callback_exceptions = FALSE,
      permissions_cache_expiry = 5 * 60,
      plotly_domain = Sys.getenv("plotly_domain", "https://plot.ly"),
      fid = NULL,
      oauth_client_id = 'RcXzjux4DGfb8bWG9UNGpJUGsTaS0pUVHoEf7Ecl',
      redirect_uri = 'http://localhost:9595'
    ),
    callback_map = list(),
    callback_fun = list(),
    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    index = function() {

      config <- c(
        private$config,
        list(url_base_pathname = private$url_base_pathname)
      )

      sprintf(
        '<!DOCTYPE html>
        <html>
          <head>
            <meta charset="UTF-8"/>
            <title>%s</title>
          </head>

          <body>
            <div id="react-entry-point">
              <div class="_dash-loading">Loading...</div>
            </div>

            <footer>
              <script id="_dash-config" type="application/json"> %s </script>
              %s
              %s
              %s
            </footer>
          </body>
        </html>',
        private$name, to_JSON(config),
        # react/react-dom *always* needs to be loaded first
        render_dependencies(c("react", "react-dom")),
        # TODO: come up with an automated way to determine component dependent dependencies
        render_dependencies(c("dash-html-components", "dash-core-components")),
        # dash-renderer *always* goes last
        render_dependencies("dash-renderer")
      )
    }

  )

)






