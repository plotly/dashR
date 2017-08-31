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
#'   \item{`layout_set(...)`}{Set the layout (i.e., user interface).}
#'   \item{`layout_get()`}{Retrieves the layout.}
#'   \item{`callback(fun, output)`}{Callback function to execute when relevant inputs change.}
#'   \item{`config_set(suppress_callback_exceptions, permissions_cache_expiry)`}{Set the config.}
#'   \item{`config_get()`}{Get the config.}
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
      router <- routr::RouteStack$new()
      # TODO: does this need to respect `url_base_pathname`?
      dasher_resources <- ressource_route('/' = system.file(package = 'dasher'))
      router$add_route(dasher_resources, 'dasher_resources', after = 1)

      # ------------------------------------------------------------------------
      # define & register routes on the server
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L88-L124
      # ------------------------------------------------------------------------
      route <- routr::Route$new()

      dash_login <- paste0(url_base_pathname, "_dash-login")
      route$add_handler("post", dash_login, function(request, response, keys, ...) {



        response$body <- list(
          h1 = "Not yet implemented"
        )
        FALSE
      })

      dash_layout <- paste0(url_base_pathname, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {
        response$status <- 200L
        response$type <- 'json'
        response$body <- to_JSON(private$layout, pretty = TRUE)
        FALSE
      })

      dash_deps <- paste0(url_base_pathname, "_dash-dependencies")
      route$add_handler("get", dash_deps, function(request, response, keys, ...) {

        # dash-renderer wants an empty array when no dependencies exist (see python/01.py)
        if (!length(private$callback_map)) {
          response$status <- 200L
          response$type <- 'json'
          response$body <- to_JSON(list())
          return(FALSE)
        }

        # client wants the mapping formatted this way -- https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L367-L378
        outputs <- strsplit(names(private$callback_map), "\\.")
        payload <- Map(function(x, y) {
          x[["output"]] <- list(id = y[[1]], property = y[[2]])
          # IMPORTANT: if state/events don't exist, they *must* be an empty array
          # (i.e., null/missing won't work) or else the dash-renderer throws a fit
          x[["state"]] <- setNames(x[["state"]] %||% list(), NULL)
          x[["events"]] <- setNames(x[["events"]] %||% list(), NULL)
          x[["inputs"]] <- setNames(x[["inputs"]] %||% list(), NULL)
          x
        }, private$callback_map, outputs)

        response$status <- 200L
        response$type <- 'json'
        response$body <- to_JSON(setNames(payload, NULL))
        FALSE
      })

      dash_update <- paste0(url_base_pathname, "_dash-update-component")
      route$add_handler("post", dash_update, function(request, response, keys, ...) {

        # request body must be parsed on demand (to avoid errors by odd formats)
        # http://www.data-imaginist.com/2017/Introducing-reqres/
        if (!request$is("json")) stop("Expected a JSON request", call. = FALSE)
        success <- request$parse(reqres::default_parsers["application/json"])
        if (!success) stop("Failed to parse body", call. = FALSE)

        # get the callback associated with this particular output
        outputID <- with(request$body$output, paste(id, property, sep = "."))
        outputComponent <- private$callback_map[[outputID]]
        if (!length(outputComponent)) stop_report("Couldn't find output component.")

        # compute the new output value, if necessary
        # TODO: this is almost certainly the wrong way to perform evaluation
        # (1) Leverage tidyeval (or similar) to ensure evaluation happens in proper envir
        # (2) Leverage memoise (or similar) to cache redundant computations
        input_values <- request$body$inputs[["value"]]
        args <- formals(outputComponent$callback)
        if (length(args) != length(input_values)) stop_report("Malformed input definition.")

        output_value <- do.call(
          outputComponent$callback,
          args = setNames(as.list(input_values), names(args))
        )

        # have to format the response body like this
        # https://github.com/plotly/dash/blob/064c811d/dash/dash.py#L562-L584
        resp <- list(
          response = list(
            props = setNames(
              list(format_output_value(output_value)),
              request$body$output$property
            )
          )
        )

        response$status <- 200L
        response$type <- 'json'
        response$body <- to_JSON(resp)
        FALSE
      })

      # TODO: is this endpoint really necessary?
      dash_suite <- paste0(url_base_pathname, "_dash-component-suites")
      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
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
        # TODO: generate the index page on server start?
        response$body <- private$index()
        FALSE
      })

      # TODO: is using the app name in this way a good idea?
      router$add_route(route, name)
      server$attach(router)

      # -----------------------------------------------------------------
      # Some simple HTTP request logging (flask does this automatically)
      # -----------------------------------------------------------------
      reporter <- getOption("dasher.http.reporter",
        function(server, id, request, ...) {
          msg <- sprintf(
            '%s - - [%s]  "%s %s HTTP/1.1" %s',
            request$host, Sys.time(), request$method,
            request$path, request$response$status
          )
          cat(msg, "\n")
        })

      if (is.function(reporter)) {
        server$on("after-request", reporter)
      }

      self$server <- server

    },

    layout_get = function() {

      private$layout

    },
    layout_set = function(...) {

      private$layout <- html_div(...)

      # verify that layout ids are unique
      private$layout_flat <- rapply(private$layout, I)
      idx <- grep("id$", names(private$layout_flat))
      if (!length(idx)) {
        warning(
          "No ids were found in the layout. ",
          "Component ids are critical for targetting callbacks in your application",
          call. = FALSE
        )
      }
      ids <- as.character(private$layout_flat[idx])
      duped <- anyDuplicated(ids)
      if (duped) {
        stop(
          sprintf("layout ids must be unique -- the following id was duplicated: '%s'", ids[duped]),
          call. = FALSE
        )
      }

    },
    css_get = function() {

      # TODO: should this return a list of htmlDependency objects?
      private$css

    },
    css_set = function() {

      # TODO: implement

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
    callback = function(fun = NULL, output = NULL, envir = parent.frame()) {

      if (!is.function(fun)) stop("The `fun` argument must be an R function", call. = FALSE)

      # a *single* output is required
      if (!is.output(output)) stop("The `output` argument must be a result of the `output()`` function", call. = FALSE)

      # TODO: do we ever have to worry about the eval envir here?
      inputz <- lapply(formals(fun), eval)
      is_inputy <- vapply(inputz, function(x) is.input(x) || is.state(x), logical(1))
      if (!all(is_inputy)) {
        stop(
          "Argument values of callback function (`fun`) must be input/state",
          "objects created via `input()`/`state()`. \n\n",
          sprint(
            "I found a problem with these arguments: '%s'",
            paste(names(inputz)[!is_inputy], collapse = "', '")
          ),
          call. = FALSE
        )
      }

      # -----------------------------------------------------------------------
      # verify that output/input/state IDs provided exists in the layout
      # -----------------------------------------------------------------------

      ids <- private$layout_flat[grep("id$", names(private$layout_flat))]
      callback_ids <- unlist(c(output$id, sapply(inputz, "[[", "id")))
      illegal_ids <- setdiff(callback_ids, ids)
      if (length(illegal_ids)) {
        stop(
          sprintf(
            "The following id(s) do not match any in the layout: '%s'",
            paste(illegal_ids, collapse = "', '")
          ),
          call. = FALSE
        )
      }

      # ----------------------------------------------------------------------
      # verify that properties attached to output/inputs/state value are valid
      # first, for a given id, we must infer the component type
      # ----------------------------------------------------------------------

      # @param layout
      # @param component a component (should be a dependency)
      validate_dependency <- function(layout, dependency) {
        if (!is.dependency(dependency)) {
          stop("`dependency` must be a dependency object", call. = FALSE)
        }

        type <- component_infer_type(private$layout, dependency$id)
        valid_props <- infer_props(type)

        if (!isTRUE(dependency$property %in% valid_props)) {
          stop(
            sprintf(
              "The %s property '%s' is not a valid property for '%s' components. Try one of the folllowing: '%s'",
              class(dependency)[2], dependency$property, type,
              paste(valid_props, collapse = "', '")
            ),
            call. = FALSE
          )
        }

        TRUE
      }

      validate_dependency(private$layout, output)
      for (i in seq_along(inputz)) {
        validate_dependency(private$layout, inputz[[i]])
      }

      # store the callback mapping/function so we may access it later
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L530-L546
      # TODO: leverage tidyeval to ensure we're evaluating things in proper envir?
      outputID <- paste(unlist(output), collapse = ".")
      private$callback_map[[outputID]] <- list(
        callback = fun,
        inputs = inputz[vapply(inputz, is.input, logical(1))],
        state = inputz[vapply(inputz, is.state, logical(1))]
      )

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
    layout_flat = rapply(welcome_page(), I),
    # TODO: include @chriddyp's CSS by default? https://codepen.io/chriddyp/pen/bWLwgP.css
    css = NULL,
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



    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    index = function() {

      config <- c(
        private$config,
        list(url_base_pathname = private$url_base_pathname)
      )

      namespaces <- private$layout_flat[grep("namespace$", names(private$layout_flat))]

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
              <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
              %s
            </footer>
          </body>
        </html>',
        private$name, to_JSON(config),
        # react/react-dom *always* needs to be loaded first
        render_dependencies(c("react", "react-dom")),
        render_dependencies(gsub("_", "-", unique(namespaces))),
        # TODO: how to handle custom components? Just have folks
        # 'dynamically' register them?
        # https://plot.ly/dash/plugins
        # TODO: what should we do about plotly/htmlwidgets?

        # dash-renderer *always* goes last
        render_dependencies("dash-renderer")
      )
    }

  )

)



