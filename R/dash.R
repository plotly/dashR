#' Create and configure a Dash app object
#'
#' A framework for building analytical web applications, Dash offers a pleasant and productive development experience. No JavaScript required.
#'
#' @usage Dash
#'
#' @section Constructor: Dash$new(
#'   name = NULL,
#'   server = fiery::Fire$new(),
#'   assets_folder = 'assets',
#'   assets_url_path = '/assets',
#'   eager_loading = FALSE,
#'   assets_ignore = '',
#'   serve_locally = TRUE,
#'   meta_tags = NULL,
#'   url_base_pathname = '/',
#'   routes_pathname_prefix = NULL,
#'   requests_pathname_prefix = NULL,
#'   external_scripts = NULL,
#'   external_stylesheets = NULL,
#'   suppress_callback_exceptions = FALSE,
#'   show_undo_redo = FALSE
#' )
#'
#' @section Arguments:
#' \tabular{lll}{
#'   `name` \tab \tab Character. The name of the Dash application (placed in the title
#'   of the HTML page). DEPRECATED; please use `index_string()` or `interpolate_index()` instead.\cr
#'   `server` \tab \tab The web server used to power the application.
#'   Must be a [fiery::Fire] object.\cr
#'   `assets_folder` \tab \tab Character. A path, relative to the current working directory,
#'   for extra files to be used in the browser. Default is "assets". All .js and
#'   .css files will be loaded immediately unless excluded by `assets_ignore`,
#'   and other files such as images will be served if requested. Default is `assets`. \cr
#'   `assets_url_path` \tab \tab Character. Specify the URL path for asset serving. Default is `assets`. \cr
#'   `eager_loading` \tab \tab Logical. Controls whether asynchronous resources are prefetched (if `TRUE`) or loaded on-demand (if `FALSE`). \cr
#'   `assets_ignore` \tab \tab Character. A regular expression, to match assets to omit from
#'   immediate loading. Ignored files will still be served if specifically requested. You
#'   cannot use this to prevent access to sensitive files. \cr
#'   `serve_locally` \tab \tab Logical. Whether to serve HTML dependencies locally or
#'   remotely (via URL).\cr
#'   `meta_tags` \tab \tab List of lists. HTML `<meta>`tags to be added to the index page.
#'   Each list element should have the attributes and values for one tag, eg:
#'   `list(name = 'description', content = 'My App')`.\cr
#'   `url_base_pathname` \tab \tab Character. A local URL prefix to use app-wide. Default is
#'   `/`. Both `requests_pathname_prefix` and `routes_pathname_prefix` default to `url_base_pathname`.
#'   Environment variable is `DASH_URL_BASE_PATHNAME`.\cr
#'   `routes_pathname_prefix` \tab \tab Character. A prefix applied to the backend routes.
#'   Environment variable is `DASH_ROUTES_PATHNAME_PREFIX`.\cr
#'   `requests_pathname_prefix` \tab \tab Character. A prefix applied to request endpoints
#'   made by Dash's front-end. Environment variable is `DASH_REQUESTS_PATHNAME_PREFIX`.\cr
#'   `external_scripts` \tab \tab List. An optional list of valid URLs from which
#'   to serve JavaScript source for rendered pages.\cr
#'   `external_stylesheets` \tab \tab List. An optional list of valid URLs from which
#'   to serve CSS for rendered pages.\cr
#'   `suppress_callback_exceptions` \tab \tab Logical. Whether to relay warnings about
#'   possible layout mis-specifications when registering a callback.\cr
#'   `show_undo_redo` \tab \tab Logical. Set to `TRUE` to enable undo and redo buttons for
#'   stepping through the history of the app state.
#'  }
#'
#' @section Fields:
#' \describe{
#'  \item{`server`}{
#'  A cloned (and modified) version of the [fiery::Fire] object
#'  provided to the `server` argument (various routes will be added which enable
#'  Dash functionality).
#'  }
#'  \item{`config`}{
#'  A list of configuration options passed along to dash-renderer.
#'  Users shouldn't need to alter any of these options unless they are
#'  constructing their own authorization front-end or otherwise need to know
#'  where the application is making API calls.
#'  }
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{`layout(...)`}{
#'     Set the layout (i.e., user interface). The layout should be either a
#'     collection of Dash components (e.g., [dccSlider], [htmlDiv], etc) or
#'     a function which returns a collection of components.
#'   }
#'   \item{`layout_get(render = TRUE)`}{
#'     Retrieves the layout. If render is `TRUE`, and the layout is a function,
#'     the result of the function (rather than the function itself) is returned.
#'   }
#'   \item{`callback(output, params, func)`}{
#'     The `callback` method has three formal arguments:
#'     \describe{
#'       \item{output}{a named list including a component `id` and `property`}
#'       \item{params}{an unnamed list of [input] and [state] statements, each with defined `id` and `property`}
#'       \item{func}{any valid R function which generates [output] provided [input] and/or [state] arguments,
#'       a character string containing valid JavaScript, or a call to [clientsideFunction] including `namespace`
#'       and `function_name` arguments for a locally served JavaScript function}
#'     }
#'     The `output` argument defines which layout component property should
#'     receive the results (via the [output] object). The events that
#'     trigger the callback are then described by the [input] (and/or [state])
#'     object(s) (which should reference layout components), which become
#'     argument values for R callback handlers defined in `func`. Here `func` may
#'     either be an anonymous R function, a JavaScript function provided as a
#'     character string, or a call to `clientsideFunction()`, which describes a
#'     locally served JavaScript function instead. The latter two methods define
#'     a "clientside callback", which updates components without passing data to and
#'     from the Dash backend. The latter may offer improved performance relative
#'     to callbacks written purely in R.
#'   }
#'   \item{`title("dash")`}{
#'     The title of the app. If no title is supplied, Dash for R will use 'dash'.
#'   }
#'   \item{`title("dash")`}{
#'     The title of the app. If no title is supplied, Dash for R will use 'dash'.
#'   }
#'   \item{`callback_context()`}{
#'     The `callback_context` method permits retrieving the inputs which triggered
#'     the firing of a given callback, and allows introspection of the input/state
#'     values given their names. It is only available from within a callback;
#'     attempting to use this method outside of a callback will result in a warning.
#'   }
#'   \item{`get_asset_url(asset_path, prefix)`}{
#'     The `get_asset_url` method permits retrieval of an asset's URL given its filename.
#'     For example, `app$get_asset_url('style.css')` should return `/assets/style.css` when
#'     `assets_folder = 'assets'`. By default, the prefix is the value of `requests_pathname_prefix`,
#'     but this is configurable via the `prefix` parameter. Note: this method will
#'     present a warning and return `NULL` if the Dash app was not loaded via `source()`
#'     if the `DASH_APP_PATH` environment variable is undefined.
#'   }
#'   \item{`get_relative_path(path, requests_pathname_prefix)`}{
#'     The `get_relative_path` method simplifies the handling of URLs and pathnames for apps
#'     running locally and on a deployment server such as Dash Enterprise. It handles the prefix
#'     for requesting assets similar to the `get_asset_url` method, but can also be used for URL handling
#'     in components such as `dccLink` or `dccLocation`. For example, `app$get_relative_url("/page/")`
#'     would return `/app/page/` for an app running on a deployment server. The path must be prefixed with
#'     a `/`.
#'     \describe{
#'       \item{path}{Character. A path string prefixed with a leading `/` which directs at a path or asset directory.}
#'       \item{requests_pathname_prefix}{Character. The pathname prefix for the app on a deployed application. Defaults to the environment variable set by the server, or `""` if run locally.}
#'       }
#'   }
#'   \item{`strip_relative_path(path, requests_pathname_prefix)`}{
#'     The `strip_relative_path` method simplifies the handling of URLs and pathnames for apps
#'     running locally and on a deployment server such as Dash Enterprise. It acts almost opposite the `get_relative_path`
#'     method, by taking a `relative path` as an input, and returning the `path` stripped of the `requests_pathname_prefix`,
#'     and any leading or trailing `/`. For example, a path string `/app/homepage/`, would be returned as
#'     `homepage`. This is particularly useful for `dccLocation` URL routing.
#'     \describe{
#'       \item{path}{Character. A path string prefixed with a leading `/` and `requests_pathname_prefix` which directs at a path or asset directory.}
#'       \item{requests_pathname_prefix}{Character. The pathname prefix for the app on a deployed application. Defaults to the environment variable set by the server, or `""` if run locally.}
#'       }
#'  }
#'  \item{`index_string(string)`}{
#'     The `index_string` method allows the specification of a custom index by changing
#'     the default `HTML` template that is generated by the Dash UI. Meta tags, CSS, Javascript,
#'     are some examples of features that can be modified.
#'     This method will present a warning if your HTML template is missing any necessary elements
#'     and return an error if a valid index is not defined. The following interpolation keys are
#'     currently supported:
#'     \describe{
#'          \item{`{%metas%}`}{Optional - The registered meta tags.}
#'          \item{`{%favicon%}`}{Optional - A favicon link tag if found in assets.}
#'          \item{`{%css%}`}{Optional - Link tags to css resources.}
#'          \item{`{%config%}`}{Required - Config generated by dash for the renderer.}
#'          \item{`{%app_entry%}`}{Required - The container where dash react components are rendered.}
#'          \item{`{%scripts%}`}{Required - Collected dependencies scripts tags.}
#'          }
#'     \describe{
#'          \item{Example of a basic HTML index string:}{
#'          \preformatted{
#' "<!DOCTYPE html>
#' <html>
#'  <head>
#'   \{\%meta_tags\%\}
#'      <title>\{\{%css\%\}\}</title>
#'      \{\%favicon\%\}
#'      \{\%css_tags\%\}
#'  </head>
#'   <body>
#'     \{\%app_entry\%\}
#'     <footer>
#'      \{\%config\%\}
#'      \{\%scripts\%\}
#'     </footer>
#'   </body>
#' </html>"
#'              }
#'          }
#'      }
#'  }
#'  \item{`interpolate_index(template_index, ...)`}{
#'     With the `interpolate_index` method, we can pass a custom index with template string
#'     variables that are already evaluated. We can directly pass arguments to the `template_index`
#'     by assigning them to variables present in the template. This is similar to the `index_string` method
#'     but offers the ability to change the default components of the Dash index as seen in the example below:
#'     \preformatted{
#'     app$interpolate_index(
#'       template_index,
#'       metas = "<meta_charset='UTF-8'/>",
#'       renderer = renderer,
#'       config = config)
#'     }
#'     \describe{
#'     \item{template_index}{Character. A formatted string with the HTML index string. Defaults to the initial template}
#'     \item{...}{Named List. The unnamed arguments can be passed as individual named lists corresponding to the components
#'     of the Dash html index. These include the same arguments as those found in the `index_string()` template.}
#'     }
#'  }
#'  \item{`run_server(host =  Sys.getenv('HOST', "127.0.0.1"),
#'    port = Sys.getenv('PORT', 8050), block = TRUE, showcase = FALSE, ...)`}{
#'     The `run_server` method has 13 formal arguments, several of which are optional:
#'     \describe{
#'       \item{host}{Character. A string specifying a valid IPv4 address for the Fiery server, or `0.0.0.0` to listen on all addresses. Default is `127.0.0.1` Environment variable: `HOST`.}
#'       \item{port}{Integer. Specifies the port number on which the server should listen (default is `8050`). Environment variable: `PORT`.}
#'       \item{block}{Logical. Start the server while blocking console input? Default is `TRUE`.}
#'       \item{showcase}{Logical. Load the Dash application into the default web browser when server starts? Default is `FALSE`.}
#'       \item{use_viewer}{Logical. Load the Dash application into RStudio's viewer pane? Requires that `host` is either `127.0.0.1` or `localhost`, and that Dash application is started within RStudio; if `use_viewer = TRUE` and these conditions are not satisfied, the user is warned and the app opens in the default browser instead. Default is `FALSE`.}
#'       \item{debug}{Logical. Enable/disable all the dev tools unless overridden by the arguments or environment variables. Default is `FALSE` when called via `run_server`. Environment variable: `DASH_DEBUG`.}
#'       \item{dev_tools_ui}{Logical. Show Dash's dev tools UI? Default is `TRUE` if `debug == TRUE`, `FALSE` otherwise. Environment variable: `DASH_UI`.}
#'       \item{dev_tools_hot_reload}{Logical. Activate hot reloading when app, assets, and component files change? Default is `TRUE` if `debug == TRUE`, `FALSE` otherwise. Requires that the Dash application is loaded using `source()`, so that `srcref` attributes are available for executed code. Environment variable: `DASH_HOT_RELOAD`.}
#'       \item{dev_tools_hot_reload_interval}{Numeric. Interval in seconds for the client to request the reload hash. Default is `3`. Environment variable: `DASH_HOT_RELOAD_INTERVAL`.}
#'       \item{dev_tools_hot_reload_watch_interval}{Numeric. Interval in seconds for the server to check asset and component folders for changes. Default `0.5`. Environment variable: `DASH_HOT_RELOAD_WATCH_INTERVAL`.}
#'       \item{dev_tools_hot_reload_max_retry}{Integer. Maximum number of failed reload hash requests before failing and displaying a pop up. Default `0.5`. Environment variable: `DASH_HOT_RELOAD_MAX_RETRY`.}
#'       \item{dev_tools_props_check}{Logical. Validate the types and values of Dash component properties? Default is `TRUE` if `debug == TRUE`, `FALSE` otherwise. Environment variable: `DASH_PROPS_CHECK`.}
#'       \item{dev_tools_prune_errors}{Logical. Reduce tracebacks to just user code, stripping out Fiery and Dash pieces? Only available with debugging. `TRUE` by default, set to `FALSE` to see the complete traceback. Environment variable: `DASH_PRUNE_ERRORS`.}
#'       \item{dev_tools_silence_routes_logging}{Logical. Replace Fiery's default logger with `dashLogger` instead (will remove all routes logging)? Enabled with debugging by default because hot reload hash checks generate a lot of requests.}
#'     }
#'     Starts the Fiery server in local mode. If a parameter can be set by an environment variable, that is listed too. Values provided here take precedence over environment variables.
#'     Launch the application. If provided, `host`/`port` set the `host`/`port` fields of the underlying [fiery::Fire] web server. The `block`/`showcase`/`...` arguments are passed along
#'     to the `ignite()` method of the [fiery::Fire] server.
#'   }
#' }
#'
#' @examples
#' \dontrun{
#' library(dashCoreComponents)
#' library(dashHtmlComponents)
#' library(dash)

#' app <- Dash$new()
#' app$layout(
#'  dccInput(id = "inputID", value = "initial value", type = "text"),
#'  htmlDiv(id = "outputID")
#' )
#'
#' app$callback(output = list(id="outputID", property="children"),
#'              params = list(input(id="inputID", property="value"),
#'                       state(id="inputID", property="type")),
#'   function(x, y)
#'     sprintf("You've entered: '%s' into a '%s' input control", x, y)
#' )
#'
#' app$run_server(showcase = TRUE)
#' }
#'
#' @export
#' @docType class
#' @format An [R6::R6Class] generator object
#'

Dash <- R6::R6Class(
  'Dash',
  public = list(
    # user-facing fields
    server = NULL,
    config = list(),

    # i.e., the Dash$new() method
    initialize = function(name = NULL,
                          server = fiery::Fire$new(),
                          assets_folder = 'assets',
                          assets_url_path = '/assets',
                          eager_loading = FALSE,
                          assets_ignore = '',
                          serve_locally = TRUE,
                          meta_tags = NULL,
                          url_base_pathname = "/",
                          routes_pathname_prefix = NULL,
                          requests_pathname_prefix = NULL,
                          external_scripts = NULL,
                          external_stylesheets = NULL,
                          compress = TRUE,
                          suppress_callback_exceptions = FALSE,
                          show_undo_redo = FALSE) {

      # argument type checking
      assertthat::assert_that(inherits(server, "Fire"))
      assertthat::assert_that(is.logical(serve_locally))
      assertthat::assert_that(is.logical(suppress_callback_exceptions))

      # save relevant args as private fields
      if (!is.null(name)) {
        warning(sprintf(
          "The supplied application title, '%s', should be set using the title() method, or passed via index_string() or interpolate_index(); it has been ignored, and 'dash' will be used instead.",
          name),
          call. = FALSE
        )
      }
      private$serve_locally <- serve_locally
      private$eager_loading <- eager_loading
      # remove leading and trailing slash(es) if present
      private$assets_folder <- gsub("^/+|/+$", "", assets_folder)
      # remove trailing slash in assets_url_path, if present
      private$assets_url_path <- sub("/$", "", assets_url_path)
      private$assets_ignore <- assets_ignore
      private$suppress_callback_exceptions <- suppress_callback_exceptions
      private$compress <- compress
      private$app_root_path <- getAppPath()
      private$app_launchtime <- as.integer(Sys.time())
      private$meta_tags <- meta_tags
      private$in_viewer <- FALSE

      # config options
      self$config$routes_pathname_prefix <- resolvePrefix(routes_pathname_prefix, "DASH_ROUTES_PATHNAME_PREFIX", url_base_pathname)
      self$config$requests_pathname_prefix <- resolvePrefix(requests_pathname_prefix, "DASH_REQUESTS_PATHNAME_PREFIX", url_base_pathname)
      self$config$external_scripts <- external_scripts
      self$config$external_stylesheets <- external_stylesheets
      self$config$show_undo_redo <- show_undo_redo

      # ------------------------------------------------------------
      # Initialize a route stack and register a static resource route
      # ------------------------------------------------------------
      router <- routr::RouteStack$new()

      # ensure that assets_folder is neither NULL nor character(0)
      if (!(is.null(private$assets_folder)) & length(private$assets_folder) != 0) {
        if (!(dir.exists(private$assets_folder)) && gsub("/+", "", assets_folder) != "assets") {
          warning(sprintf(
            "The supplied assets folder, '%s', could not be found in the project directory.",
            private$assets_folder),
            call. = FALSE
          )
        } else if (dir.exists(private$assets_folder)) {
          if (length(countEnclosingFrames("dash_nested_fiery_server")) == 0) {
            private$refreshAssetMap()
            private$last_refresh <- as.integer(Sys.time())
          }
          # fiery is attempting to launch a server within a server, do not refresh assets
        }
      }

      # ------------------------------------------------------------------------
      # Set a sensible default logger
      # ------------------------------------------------------------------------
      server$set_logger(dashLogger)
      server$access_log_format <- fiery::combined_log_format

      # ------------------------------------------------------------------------
      # define & register routes on the server
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L88-L124
      # http://www.data-imaginist.com/2017/Introducing-routr/
      # ------------------------------------------------------------------------
      route <- routr::Route$new()

      dash_layout <- paste0(self$config$routes_pathname_prefix, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {
        rendered_layout <- private$layout_render()
        # pass the layout on to encode_plotly in case there are dccGraph
        # components which include Plotly.js figures for which we'll need to
        # run plotly_build from the plotly package
        lay <- encode_plotly(rendered_layout)
        response$body <- to_JSON(lay, pretty = TRUE)
        response$status <- 200L
        response$type <- 'json'

        TRUE
      })

      dash_deps <- paste0(self$config$routes_pathname_prefix, "_dash-dependencies")
      route$add_handler("get", dash_deps, function(request, response, keys, ...) {
        # dash-renderer wants an empty array when no dependencies exist (see python/01.py)
        if (!length(private$callback_map)) {
          response$body <- to_JSON(list())
          response$status <- 200L
          response$type <- 'json'

          return(FALSE)
        }

        payload <- Map(function(callback_signature) {
          list(
            inputs=callback_signature$inputs,
            output=createCallbackId(callback_signature$output),
            state=callback_signature$state,
            clientside_function=callback_signature$clientside_function
          )
        }, private$callback_map)

        response$body <- to_JSON(setNames(payload, NULL))
        response$status <- 200L
        response$type <- 'json'
        if (private$compress)
          response <- tryCompress(request, response)
        TRUE
      })

      dash_update <- paste0(self$config$routes_pathname_prefix, "_dash-update-component")
      route$add_handler("post", dash_update, function(request, response, keys, ...) {
        request <- request_parse_json(request)

        if (!"output" %in% names(request$body)) {
          response$body <- "Couldn't find output component in request body"
          response$status <- 500L
          response$type <- 'json'
          return(FALSE)
        }

        # get the callback associated with this particular output
        callback <- private$callback_map[[request$body$output]][['func']]
        if (!length(callback)) stop_report("Couldn't find output component.")
        if (!is.function(callback)) {
          stop(sprintf("Couldn't find a callback function associated with '%s'", thisOutput))
        }

        # the following callback_args code handles inputs which may contain
        # NULL values; we wish to retain the NULL elements, since these can
        # be passed into the callback handler, rather than dropping the list
        # elements when they are encountered (which also compromises the
        # sequencing of passed arguments). the R FAQ notes that list(NULL)
        # can be used to append NULL elements into a constructed list, but
        # that assigning NULL into list elements omits them from the object.
        #
        # we want the NULL elements to be wrapped in a list when they're
        # passed, so they're nested in the code below.
        #
        # https://cran.r-project.org/doc/FAQ/R-FAQ.html#Others:
        callback_args <- list()

        for (input_element in request$body$inputs) {
          if(is.null(input_element$value))
            callback_args <- c(callback_args, list(list(NULL)))
          else
            callback_args <- c(callback_args, list(input_element$value))
        }

        if (length(request$body$state)) {
          for (state_element in request$body$state) {
            if(is.null(state_element$value))
              callback_args <- c(callback_args, list(list(NULL)))
            else
              callback_args <- c(callback_args, list(state_element$value))
          }
        }

        # set the callback context associated with this invocation of the callback
        private$callback_context_ <- setCallbackContext(request$body)

        output_value <- getStackTrace(do.call(callback, callback_args),
                                      debug = private$debug,
                                      prune_errors = private$prune_errors)

        # reset callback context
        private$callback_context_ <- NULL

        # inspect the output_value to determine whether any outputs have no_update
        # objects within them; these should not be updated
        if (length(output_value) == 1 && class(output_value) == "no_update") {
          response$body <- character(1) # return empty string
          response$status <- 204L
        }
        else if (is.null(private$stack_message)) {
          # pass on output_value to encode_plotly in case there are dccGraph
          # components which include Plotly.js figures for which we'll need to
          # run plotly_build from the plotly package
          output_value <- encode_plotly(output_value)

          # for multiple outputs, have to format the response body like this, including 'multi' key:
          # https://github.com/plotly/dash/blob/d9ddc877d6b15d9354bcef4141acca5d5fe6c07b/dash/dash.py#L1174-L1209

          # for single outputs, the response body is formatted slightly differently:
          # https://github.com/plotly/dash/blob/d9ddc877d6b15d9354bcef4141acca5d5fe6c07b/dash/dash.py#L1210-L1220

          if (substr(request$body$output, 1, 2) == '..') {
            # omit return objects of class "no_update" from output_value
            updatable_outputs <- "no_update" != vapply(output_value, class, character(1))
            output_value <- output_value[updatable_outputs]

            # if multi-output callback, isolate the output IDs and properties
            ids <- getIdProps(request$body$output)$ids[updatable_outputs]
            props <- getIdProps(request$body$output)$props[updatable_outputs]

            # prepare a response object which has list elements corresponding to ids
            # which themselves contain named list elements corresponding to props
            # then fill in nested list elements based on output_value

            allprops <- setNames(vector("list", length(unique(ids))), unique(ids))

            idmap <- setNames(ids, props)

            for (id in unique(ids)) {
              allprops[[id]] <- output_value[grep(id, ids)]
              names(allprops[[id]]) <- names(idmap[which(idmap==id)])
            }

            resp <- list(
             response = allprops,
             multi = TRUE
             )
          } else {
            resp <- list(
              response = list(
                props = setNames(list(output_value), gsub( "(^.+)(\\.)", "", request$body$output))
              )
            )
          }

          response$body <- to_JSON(resp)
          response$status <- 200L
          response$type <- 'json'
        } else if (private$debug==TRUE) {
          # if there is an error, send it back to dash-renderer
          response$body <- private$stack_message
          response$status <- 500L
          response$type <- 'html'
          private$stack_message <- NULL
        } else {
          # if not in debug mode, do not return stack
          response$body <- NULL
          response$status <- 500L
          private$stack_message <- NULL
        }

        if (private$compress)
          response <- tryCompress(request, response)
        TRUE
      })

      # This endpoint supports dynamic dependency loading
      # during `_dash-update-component` -- for reference:
      # https://docs.python.org/3/library/pkgutil.html#pkgutil.get_data
      #
      # analogous to
      # https://github.com/plotly/dash/blob/2d735aa250fc67b14dc8f6a337d15a16b7cbd6f8/dash/dash.py#L543-L551
      dash_suite <- paste0(self$config$routes_pathname_prefix, "_dash-component-suites/:package_name/:filename")

      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
        filename <- basename(file.path(keys$filename))

        # checkFingerprint returns a list of length 2, the first element is
        # the un-fingerprinted path, if a fingerprint is present (otherwise
        # the original path is returned), while the second element indicates
        # whether the original filename included a valid fingerprint (by
        # Dash convention)
        fingerprinting_metadata <- checkFingerprint(filename)

        filename <- fingerprinting_metadata[[1]]
        has_fingerprint <- fingerprinting_metadata[[2]] == TRUE

        dep_list <- c(private$dependencies_internal,
                      private$dependencies,
                      private$dependencies_user)

        dep_pkg <- get_package_mapping(filename,
                                       keys$package_name,
                                       clean_dependencies(dep_list)
                                       )

        # return warning if a dependency goes unmatched, since the page
        # will probably fail to render properly anyway without it
        if (length(dep_pkg$rpkg_path) == 0) {
          warning(sprintf("The dependency '%s' could not be loaded; the file was not found.",
                          filename),
                  call. = FALSE)

          response$body <- NULL
          response$status <- 404L
        } else {
          # need to check for debug mode, don't cache, don't etag
          # if debug mode is not active
          dep_path <- system.file(dep_pkg$rpkg_path,
                                  package = dep_pkg$rpkg_name)

          response$type <- get_mimetype(filename)

          if (grepl("text|javascript", response$type)) {
            response$body <- readLines(dep_path,
                                       warn = FALSE,
                                       encoding = "UTF-8")

            if (private$compress && length(response$body) > 0) {
              response <- tryCompress(request, response)
            }
          } else {
            file_handle <- file(dep_path, "rb")
            file_size <- file.size(dep_path)

            response$body <- readBin(dep_path,
                                     raw(),
                                     file_size)
            close(file_handle)
          }

          if (!private$debug && has_fingerprint) {
            response$status <- 200L
            response$set_header('Cache-Control',
                                sprintf('public, max-age=%s',
                                        31536000) # 1 year
            )
          } else if (!private$debug && !has_fingerprint) {
            modified <- as.character(as.integer(file.mtime(dep_path)))

            response$set_header('ETag', modified)

            request_etag <- request$get_header('If-None-Match')

            if (!is.null(request_etag) && modified == request_etag) {
              response$body <- NULL
              response$status <- 304L
            } else {
              response$status <- 200L
            }
          } else {
            response$status <- 200L
          }
        }

        TRUE
      })

      dash_assets <- paste0(self$config$routes_pathname_prefix, private$assets_url_path, "/*")

      # ensure slashes are not doubled
      dash_assets <- sub("//", "/", dash_assets)

      route$add_handler("get", dash_assets, function(request, response, keys, ...) {
        # unfortunately, keys do not exist for wildcard headers in routr -- URL must be parsed
        # e.g. for "http://127.0.0.1:8050/assets/stylesheet.css?m=1552591104"
        #
        # the following regex pattern will return "/stylesheet.css":
        assets_pattern <- paste0("(?<=",
                                 gsub("/",
                                      "\\\\/",
                                      private$assets_url_path),
                                 ")([^?])+"
                                 )

        # now, identify vector positions for asset string matching pattern above
        asset_match <- gregexpr(pattern = assets_pattern, request$url, perl=TRUE)
        # use regmatches to retrieve only the substring following assets_url_path
        asset_to_match <- unlist(regmatches(request$url, asset_match))

        # now that we've parsed the URL, attempt to match the subpath in the map,
        # then return the local absolute path to the asset
        asset_path <- get_asset_path(private$asset_map,
                                     asset_to_match)

        # the following codeblock attempts to determine whether the requested
        # content exists, if the data should be encoded as plain text or binary,
        # and opens/closes a file handle if the type is assumed to be binary
        if (!(is.null(asset_path)) && file.exists(asset_path)) {
          response$type <- request$headers[["Content-Type"]] %||%
            get_mimetype(asset_to_match)

          if (grepl("text|javascript", response$type)) {
            response$body <- readLines(asset_path,
                                       warn = FALSE,
                                       encoding = "UTF-8")

            if (private$compress && length(response$body) > 0) {
              response <- tryCompress(request, response)
            }
          } else {
            file_handle <- file(asset_path, "rb")
            file_size <- file.size(asset_path)

            response$body <- readBin(file_handle,
                                     raw(),
                                     file_size)
            close(file_handle)
          }

          response$status <- 200L
        }
        TRUE
      })

      dash_favicon <- paste0(self$config$routes_pathname_prefix, "_favicon.ico")

      route$add_handler("get", dash_favicon, function(request, response, keys, ...) {
        asset_path <- get_asset_path(private$asset_map,
                                     "/favicon.ico")

        file_handle <- file(asset_path, "rb")
        response$body <- readBin(file_handle,
                                 raw(),
                                 file.size(asset_path))
        close(file_handle)

        response$set_header('Cache-Control',
                            sprintf('public, max-age=%s',
                                    '31536000')
                            )
        response$type <- 'image/x-icon'
        response$status <- 200L

        TRUE
      })

      # Add a 'catchall' handler to redirect other requests to the index
      dash_catchall <- paste0(self$config$routes_pathname_prefix, "*")
      route$add_handler('get', dash_catchall, function(request, response, keys, ...) {
        response$body <- private$.index
        response$status <- 200L
        response$type <- 'html'

        if (private$compress)
          response <- tryCompress(request, response)
        TRUE
      })

      dash_reload_hash <- paste0(self$config$routes_pathname_prefix, "_reload-hash")
      route$add_handler("get", dash_reload_hash, function(request, response, keys, ...) {
        modified_files <- private$modified_since_reload
        hard <- TRUE

        if (is.null(modified_files)) {
          # dash-renderer requires that this element not be NULL
          modified_files <- list()
        }

        resp <- list(files = modified_files,
                     hard = hard,
                     packages = c("dash_renderer",
                                  unique(
                                    vapply(
                                      private$dependencies,
                                      function(x) x[["name"]],
                                      FUN.VALUE=character(1),
                                      USE.NAMES = FALSE)
                                  )
                     ),
                     reloadHash = self$config$reload_hash)
        response$body <- to_JSON(resp)
        response$status <- 200L
        response$type <- 'json'

        # reset the field for the next reloading operation
        private$modified_since_reload <- list()
        TRUE
      })

      router$add_route(route, "dashR-endpoints")
      server$attach(router)

      server$on("start", function(server, ...) {
        private$generateReloadHash()
        private$index()

        viewer <- !(is.null(getOption("viewer"))) && (dynGet("use_viewer") == TRUE)

        app_url <- paste0("http://", self$server$host, ":", self$server$port)

        if (viewer && self$server$host %in% c("localhost", "127.0.0.1")) {
          rstudioapi::viewer(app_url)
          private$in_viewer <- TRUE
          }
        else if (viewer) {
          warning("\U{26A0} RStudio viewer not supported; ensure that host is 'localhost' or '127.0.0.1' and that you are using RStudio to run your app. Opening default browser...")
          utils::browseURL(app_url)
        }
      })

      # user-facing fields
      self$server <- server
    },

    # ------------------------------------------------------------------------
    # dash layout methods
    # ------------------------------------------------------------------------
    layout_get = function(render = TRUE) {
      if (render) private$layout_render() else private$layout_
    },
    layout = function(...) {
      private$layout_ <- if (is.function(..1)) ..1 else list(...)
      # render the layout, and then return the rendered layout without printing
      invisible(private$layout_render())
    },

    react_version_set = function(version) {
      versions <- private$react_versions()
      idx <- versions %in% version
      # needs to match one react & one react-dom version
      if (sum(idx) != 2) {
        stop(sprintf(
          "React version '%s' is not supported. Supported versions include: '%s'",
          version, paste(unique(versions), collapse = "', '")
        ), call. = FALSE)
      }
      private$react_version_enabled <- version
    },

    # ------------------------------------------------------------------------
    # callback registration
    # ------------------------------------------------------------------------
    callback = function(output, params, func) {
      assert_valid_callbacks(output, params, func)

      inputs <- params[vapply(params, function(x) 'input' %in% attr(x, "class"), FUN.VALUE=logical(1))]
      state <- params[vapply(params, function(x) 'state' %in% attr(x, "class"), FUN.VALUE=logical(1))]

      if (is.function(func)) {
        clientside_function <- NULL
      } else if (is.character(func)) {
        # update the scripts before generating tags, and remove exact
        # duplicates from inline_scripts
        fn_name <- paste0("_dashprivate_", output$id)

        func <- paste0('<script>\n',
                       'var clientside = window.dash_clientside = window.dash_clientside || {};\n',
                       'var ns = clientside["', fn_name, '"] = clientside["', fn_name, '"] || {};\n',
                       'ns["', output$property, '"] = \n',
                       func,
                       '\n;',
                       '</script>')

        private$inline_scripts <- unique(c(private$inline_scripts, func))

        clientside_function <- clientsideFunction(namespace = fn_name,
                                                  function_name = output$property)

        func <- NULL
      } else {
        clientside_function <- func
        func <- NULL
      }

      # register the callback_map
      private$callback_map <- insertIntoCallbackMap(private$callback_map,
                                                    inputs,
                                                    output,
                                                    state,
                                                    func,
                                                    clientside_function)
    },

    # ------------------------------------------------------------------------
    # request and return callback context
    # ------------------------------------------------------------------------
    callback_context = function() {
      if (is.null(private$callback_context_)) {
        warning("callback_context is undefined; callback_context may only be accessed within a callback.")
      }
      private$callback_context_
    },

    # ------------------------------------------------------------------------
    # return asset URLs
    # ------------------------------------------------------------------------
    get_asset_url = function(asset_path, prefix = self$config$requests_pathname_prefix) {
      app_root_path <- Sys.getenv("DASH_APP_PATH")

      if (app_root_path == "" && getAppPath() != FALSE) {
        # app loaded via source(), root path is known
        app_root_path <- dirname(private$app_root_path)
      } else if (getAppPath() == FALSE) {
        # app not loaded via source(), env var not set, no reliable way to ascertain root path
        warning("application not started via source(), and DASH_APP_PATH environment variable is undefined. get_asset_url returns NULL since root path cannot be reliably identified.")
        return(NULL)
      }

      asset <- lapply(private$asset_map,
                      function(x) {
                        # asset_path should be prepended with the full app root & assets path
                        # if leading slash(es) present in asset_path, remove them before
                        # assembling full asset path
                        asset_path <- file.path(app_root_path,
                                                private$assets_folder,
                                                sub(pattern="^/+",
                                                    replacement="",
                                                    asset_path))
                        return(names(x[x == asset_path]))
                      }
      )
      asset <- unlist(asset, use.names = FALSE)

      if (length(asset) == 0)
        stop(sprintf("the asset path '%s' is not valid; please verify that this path exists within the '%s' directory.",
                     asset_path,
                     private$assets_folder))

      # strip multiple slashes if present, since we'll
      # introduce one when we concatenate the prefix and
      # asset path & prepend the asset name with route prefix
      return(gsub(pattern="/+",
                  replacement="/",
                  paste(prefix,
                        private$assets_url_path,
                        asset,
                        sep="/")))
    },

    # ------------------------------------------------------------------------
    # return relative asset URLs
    # ------------------------------------------------------------------------
    
    get_relative_path = function(path, requests_pathname_prefix = self$config$requests_pathname_prefix) {
      asset = get_relative_path(requests_pathname = requests_pathname_prefix, path = path)
      return(asset)
    },
    
    
    # ------------------------------------------------------------------------
    # return relative asset URLs
    # ------------------------------------------------------------------------
    
    strip_relative_path = function(path, requests_pathname_prefix = self$config$requests_pathname_prefix) {
      asset = strip_relative_path(requests_pathname = requests_pathname_prefix, path = path)
      return(asset)
    },

    # specify a custom index string
    # ------------------------------------------------------------------------
    index_string = function(string) {
      private$custom_index <- validate_keys(string)
    },
    
    # ------------------------------------------------------------------------
    # modify the templated variables by using the `interpolate_index` method. 
    # ------------------------------------------------------------------------
    interpolate_index = function(template_index = private$template_index[[1]], ...) {
      template = template_index
      kwargs <- list(...)
      
      for (name in names(kwargs)) {
        key = paste0('\\{\\%', name, '\\%\\}')
        template = sub(key, kwargs[[name]], template)
      } 
      
      invisible(validate_keys(names(kwargs)))
      
      private$template_index <- template
    },
    
    # ------------------------------------------------------------------------
    # specify a custom title
    # ------------------------------------------------------------------------
    title = function(string = "dash") {
      assertthat::assert_that(is.character(string))
      private$name <- string
    },
        
    # ------------------------------------------------------------------------
    # convenient fiery wrappers
    # ------------------------------------------------------------------------
    run_server = function(host = Sys.getenv('HOST', "127.0.0.1"),
                          port = Sys.getenv('PORT', 8050),
                          block = TRUE,
                          showcase = FALSE,
                          use_viewer = FALSE,
                          dev_tools_prune_errors = TRUE,
                          debug = Sys.getenv('DASH_DEBUG'),
                          dev_tools_ui = Sys.getenv('DASH_UI'),
                          dev_tools_props_check = Sys.getenv('DASH_PROPS_CHECK'),
                          dev_tools_hot_reload = Sys.getenv('DASH_HOT_RELOAD'),
                          dev_tools_hot_reload_interval = Sys.getenv('DASH_HOT_RELOAD_INTERVAL'),
                          dev_tools_hot_reload_watch_interval = Sys.getenv('DASH_HOT_RELOAD_WATCH_INTERVAL)'),
                          dev_tools_hot_reload_max_retry = Sys.getenv('DASH_HOT_RELOAD_MAX_RETRY'),
                          dev_tools_silence_routes_logging = NULL,
                          ...) {
      if (exists("dash_nested_fiery_server", env=parent.frame(1))) {
        # fiery is attempting to launch a server within a server, abort gracefully
        return(NULL)
      }

      getServerParam <- function(value, type, default) {
        if (length(value) == 0 || is.na(value))
          return(default)
        if (type %in% c("double", "integer") && value < 0)
          return(default)
        if (toupper(value) %in% c("TRUE", "FALSE") && type == "logical")
          value <- as.logical(toupper(value))
        if (type == "integer")
          value <- as.integer(value)
        if (type == "double")
          value <- as.double(value)
        if (value != "" && typeof(value) == type) {
          return(value)
        } else {
          return(default)
        }
      }

      debug <- getServerParam(debug, "logical", FALSE)
      private$debug <- debug

      self$server$host <- getServerParam(host, "character", "127.0.0.1")
      self$server$port <- getServerParam(as.integer(port), "integer", 8050)

      dev_tools_ui <- getServerParam(dev_tools_ui, "logical", debug)
      dev_tools_props_check <- getServerParam(dev_tools_props_check, "logical", debug)
      dev_tools_silence_routes_logging <- getServerParam(dev_tools_silence_routes_logging, "logical", debug)
      dev_tools_hot_reload <- getServerParam(dev_tools_hot_reload, "logical", debug)

      private$prune_errors <- getServerParam(dev_tools_prune_errors, "logical", TRUE)

      if(getAppPath() != FALSE) {
        source_dir <- dirname(getAppPath())
        private$app_root_modtime <- modtimeFromPath(source_dir, recursive = TRUE, asset_path = private$assets_folder)
      } else {
        source_dir <- NULL
      }

      # set the modtime to track state of the Dash app directory
      # this calls getAppPath, which will try three approaches to
      # identifying the local app path (depending on whether the app
      # is invoked via script, source(), or executed directly from console)
      self$config$ui <- dev_tools_ui

      if (dev_tools_hot_reload) {
        hot_reload <- TRUE
        hot_reload_interval <- getServerParam(dev_tools_hot_reload_interval, "double", 3)
        hot_reload_watch_interval <- getServerParam(dev_tools_hot_reload_watch_interval, "double", 0.5)
        hot_reload_max_retry <- getServerParam(as.integer(dev_tools_hot_reload_max_retry), "integer", 8)
        # convert from seconds to msec as used by js `setInterval`
        self$config$hot_reload <- list(interval = hot_reload_interval * 1000, max_retry = hot_reload_max_retry)
      } else {
        hot_reload <- FALSE
      }

      self$config$silence_routes_logging <- dev_tools_silence_routes_logging
      self$config$props_check <- dev_tools_props_check

      if (hot_reload == TRUE & !(is.null(source_dir))) {
        self$server$on('cycle-end', function(server, ...) {
          # handle case where assets are not present, since we can still hot reload the app itself
          #
          # private$last_reload stores the time of the last hard or soft reload event
          # private$last_cycle will be set when the cycle-end handler terminates
          #
          if (!is.null(private$last_cycle) & !is.null(hot_reload_watch_interval)) {
            permit_reload <- (Sys.time() - private$last_reload) >= hot_reload_watch_interval
          } else {
            permit_reload <- FALSE
          }

          if (permit_reload) {
            if (dir.exists(private$assets_folder)) {
              # by specifying asset_path, we can exclude assets from the root_modtime when recursive=TRUE
              # otherwise modifying CSS assets will always trigger a hard reload
              current_asset_modtime <- modtimeFromPath(private$assets_folder, recursive = TRUE)
              current_root_modtime <- modtimeFromPath(source_dir, recursive = TRUE, asset_path = private$assets_folder)
              updated_assets <- isTRUE(current_asset_modtime > private$asset_modtime)
              updated_root <- isTRUE(current_root_modtime > private$app_root_modtime)
              private$app_root_modtime <- current_root_modtime
            } else {
              # there is no assets folder, update the root modtime only
              current_asset_modtime <- NULL
              current_root_modtime <- modtimeFromPath(source_dir, recursive = TRUE)
              updated_root <- isTRUE(current_root_modtime > private$app_root_modtime)
              updated_assets <- FALSE
              private$app_root_modtime <- current_root_modtime
            }

            if (!is.null(current_asset_modtime) && updated_assets) {
              # refreshAssetMap silently returns a list of updated objects in the map
              # we can use this to retrieve the modified files, and also determine if
              # any are scripts or other non-CSS data
              has_assets <- file.exists(file.path(source_dir, private$assets_folder))

              if (length(has_assets) != 0 && has_assets) {
                updated_files <- private$refreshAssetMap()
                file_extensions <- tools::file_ext(updated_files$modified)

                # if the vector of file_extensions is logical(0), this ensures
                # we return FALSE instead of logical(0)
                checkIfCSS <- function(extension) {
                  if (length(extension) == 0)
                    return(FALSE)
                  else
                    return(extension == "css")
                }

                all_updated <- c(updated_files$added, updated_files$modified)
                private$modified_since_reload <- lapply(setNames(all_updated, NULL),
                                                        function(current_file) {
                                                        list(is_css = checkIfCSS(tools::file_ext(current_file)),
                                                             modified = modtimeFromPath(current_file),
                                                             url = paste(private$assets_url_path, basename(current_file), sep="/"))
                                                          })

                private$asset_modtime <- current_asset_modtime
                # update the hash passed back to the renderer, and bump the timestamp
                # to match the current reloading event
                other_changed <- any(tools::file_ext(updated_files$modified) != "css")
                other_added <- any(tools::file_ext(updated_files$added) != "css")
                other_deleted <- any(tools::file_ext(updated_files$deleted) != "css")
                }
            }

            if (updated_assets || updated_root) {
              self$config$reload_hash <- private$generateReloadHash()
              flush.console()

              # if any filetypes other than CSS are encountered in those which
              # are modified or deleted, restart the server
              hard_reload <- updated_root || (has_assets && (other_changed || other_added || other_deleted))

              if (!hard_reload) {
                # refresh the index but don't restart the server
                private$index()
                # while not a "hard" reload, update last_reload to reflect "soft" reloads also
                # since we determine whether to perform subsequent reloads based this value
                private$last_reload <- as.integer(Sys.time())
              } else {
                # if the server was started via Rscript or via source()
                # then update the app object here
                if (!(getAppPath() == FALSE)) {
                  app_env <- new.env(parent = .GlobalEnv)
                  # set the flag to automatically abort the server on execution
                  assign("dash_nested_fiery_server", TRUE, envir=app_env)
                  source(getAppPath(), app_env)
                  # set the layout and refresh the callback map
                  write(crayon::cyan$bold("\U{1F504} Changes to app or its assets detected, reloading ..."), stderr())
                  private$callback_map <- get("callback_map", envir=get("app", envir=app_env)$.__enclos_env__$private)
                  private$layout_ <- get("layout_", envir=get("app", envir=app_env)$.__enclos_env__$private)
                  private$index()
                  # if using the viewer, reload app there
                  if (private$in_viewer)
                    rstudioapi::viewer(paste0("http://", self$server$host, ":", self$server$port))
                  # tear down the temporary environment
                  rm(app_env)
                }
              }
            }
          }

          # reset the timestamp so we're able to determine when the last cycle end occurred
          private$last_cycle <- as.integer(Sys.time())
        })
      } else if (hot_reload == TRUE & is.null(source_dir)) {
          message("\U{26A0} No source directory information available; hot reloading has been disabled.\nPlease ensure that you are loading your Dash for R application using source().\n")
        }
      self$server$ignite(block = block, showcase = showcase, ...)
      }
    ),

  private = list(
    # private fields defined on initiation
    name = NULL,
    serve_locally = NULL,
    eager_loading = NULL,
    meta_tags = NULL,
    assets_folder = NULL,
    assets_url_path = NULL,
    assets_ignore = NULL,
    url_base_pathname = NULL,
    routes_pathname_prefix = NULL,
    requests_pathname_prefix = NULL,
    suppress_callback_exceptions = NULL,
    compress = NULL,
    asset_map = NULL,
    css = NULL,
    scripts = NULL,
    other = NULL,

    # initialize flags for debug mode and stack pruning
    debug = NULL,
    prune_errors = NULL,
    stack_message = NULL,

    # callback context
    callback_context_ = NULL,

    # fields for setting modification times and paths to track state
    asset_modtime = NULL,
    app_launchtime = NULL,
    app_root_path = NULL,
    app_root_modtime = NULL,

    # fields for controlling hot reloading state
    last_reload = numeric(1),
    last_refresh = NULL,
    last_cycle = NULL,
    modified_since_reload = NULL,

    # field to store whether viewer has been requested
    in_viewer = NULL,

    # fields for tracking HTML dependencies
    dependencies = list(),
    dependencies_user = list(),
    dependencies_internal = list(),

    # layout stuff
    layout_ = NULL,
    layout_ids = NULL,
    layout_render = function() {
      # assuming private$layout is either a function or a list of components...
      layout_ <- if (is.function(private$layout_)) private$layout_() else private$layout_

      # accommodate functions that return a single component
      if (is.component(layout_)) layout_ <- list(layout_)

      # make sure we are working with a list of components
      layout_ <- lapply(layout_, private$componentify)

      # Put the list of components into a container div. I'm pretty sure dash
      # requires the layout to be one component, but R folks are used to
      # being able to supply "components" to ...
      layout_ <- dashHtmlComponents::htmlDiv(children = layout_, id = layout_container_id())

      # store the layout as a (flattened) vector form since we query the
      # vector names several times to verify ID naming (among other things)
      layout_flat <- rapply(layout_, I)
      layout_nms <- names(layout_flat)

      # verify that layout ids are unique
      idx <- grep("props\\.id$", layout_nms)
      if (!length(idx)) {
        warning(
          "No ids were found in the layout. ",
          "Component ids are critical for targetting callbacks in your application",
          call. = FALSE
        )
      }
      private$layout_ids <- as.character(layout_flat[idx])
      duped <- anyDuplicated(private$layout_ids)
      if (duped) {
        stop(
          sprintf("layout ids must be unique -- the following id was duplicated: '%s'", private$layout_ids[duped]),
          call. = FALSE
        )
      }

      # load package-level HTML dependencies from attached pkgs
      metadataFns <- lapply(.packages(), getDashMetadata)
      metadataFns <- metadataFns[lengths(metadataFns) != 0]

      deps_layout <- lapply(metadataFns, function(dep) {
        # the objective is to identify JS dependencies
        # without requiring that a proprietary R format
        # file is loaded at object initialization to
        # retrieve them; this is undesirable since there
        # is no easy way to generate .RData or .rds within
        # Python, which we now use to 'transpile' JSON>>R
        #
        # the following code is somewhat unorthodox, but
        # permits us to write dependencies to text, then
        # load them as (internal/hidden) functions with
        # no arguments. this approach is modular, but should
        # be refactored at a later date, as it is far from
        # elegant.
        #
        # construct function name based on package name
        fn_summary <- getAnywhere(dep)

        # ensure that the object refers to a function,
        # and we are able to locate it somewhere
        if (length(fn_summary$where) == 0) return(NULL)

        if (mode(fn_summary$obj[[1]]) == "function") {
          # function is available
          dep_list <- do.call(fn_summary$obj[[1]], list())

          return(dep_list)
        } else {
          return(NULL)
        }
      })

      deps_layout <- unlist(deps_layout, recursive=FALSE)

      # add on HTML dependencies we've identified by crawling the layout
      private$dependencies <- c(private$dependencies, deps_layout)

      # return the computed layout
      oldClass(layout_) <- c("dash_layout", oldClass(layout_))
      layout_
    },

    refreshAssetMap = function() {
      # if hot reloading, use canonical path to app as retrieved via getAppPath()
      # this should be useful if the server is run in non-blocking mode while
      # hot reloading is active, and the user decides to setwd() ...
      if (getAppPath() != FALSE) {
        private$asset_modtime <- modtimeFromPath(file.path(dirname(getAppPath()), private$assets_folder), recursive = TRUE)
      } else {
        private$asset_modtime <- modtimeFromPath(private$assets_folder, recursive = TRUE)
      }

      # before refreshing the asset map, temporarily store it for the
      # comparison with the updated map
      previous_map <- private$asset_map

      # refresh the asset map
      current_map <- private$walk_assets_directory(private$assets_folder)

      # need to check whether the assets have actually been updated, since
      # this function is also called to generate the asset map
      if (!is.na(private$asset_modtime) && private$asset_modtime > private$app_launchtime) {
        # here we use mapply to make pairwise comparisons for each of the
        # asset classes in the map -- before/after for css, js, and other
        # assets; this returns a list whose subelements correspond to each
        # class, and three vectors of updated objects for each (deleted,
        # changed, and new files)
        list_of_diffs <- mapply(changedAssets,
                                previous_map,
                                current_map,
                                SIMPLIFY=FALSE)

        # these lines collapse the modified assets into vectors, and scrub
        # duplicated NULL return values
        deleted <- unlist(lapply(list_of_diffs, `[`, "deleted"))
        changed <- unlist(lapply(list_of_diffs, `[`, "changed"))
        new <- unlist(lapply(list_of_diffs, `[`, "new"))

        # update the asset map
        private$asset_map <- current_map

        # when the asset map is refreshed, this function will invisibly
        # return the vectors of updated assets, grouped by deleted,
        # modified, and added files
        private$last_refresh <- as.integer(Sys.time())

        return(invisible(list(deleted=deleted,
                              modified=changed,
                              added=new)))
      } else {
        private$asset_map <- current_map
        private$last_refresh <- as.integer(Sys.time())
        return(NULL)
      }
    },

    walk_assets_directory = function(assets_dir = private$assets_folder) {
      # obtain the full canonical path
      asset_path <- normalizePath(file.path(assets_dir))

      # remove multiple slashes if present
      asset_path <- gsub("//+",
                         "/",
                         asset_path)

      # collect all the file paths to all files in assets, walk
      # directory tree recursively
      files <- list.files(path = asset_path,
                          full.names = TRUE,
                          recursive = TRUE)

      # if the user supplies an assets_ignore filter regex, use this
      # to filter the file map to exclude anything that matches
      if (private$assets_ignore != "") {
        files <- files[!grepl(pattern = private$assets_ignore,
                              files,
                              perl = TRUE)]
      }

      # regex to match substring of absolute path
      # the following lines escape out slashes, keeping subpath
      # but without private$assets_folder included
      assets_pattern <- paste0("(?<=",
                               gsub("/",
                                    "\\\\/",
                                    private$assets_folder),
                               ")([^?])+"
      )

      # if file extension is .css, add to stylesheets
      sheet_paths <- files[tools::file_ext(files) == "css"]

      # if file extension is .js, add to scripts
      script_paths <- files[tools::file_ext(files) == "js"]

      # file_paths includes all assets that are neither CSS nor JS
      # this is to avoid duplicate entries in the map when flattened
      file_paths <- files[!(tools::file_ext(files) %in% c("css", "js"))]

      # for CSS, JavaScript, and everything to be served in assets, construct
      # a map -- a list of three character string vectors, in which the elements
      # are absolute (local system) paths to the assets being served, and the
      # names attribute of the elements matches the relative asset path
      if (length(sheet_paths)) {
        # first, sort the filenames alphanumerically
        sheet_paths <- sheet_paths[order(basename(sheet_paths))]
        # now, identify vector positions for asset strings matching pattern above
        match_sheets <- gregexpr(pattern = assets_pattern, sheet_paths, perl=TRUE)
        # use regmatches to retrieve only the substring including assets/...
        sheet_names <- regmatches(sheet_paths, match_sheets)
        # assign names for matched assets corresponding to substring
        css_map <- setNames(sheet_paths, sheet_names %||% "/")
      } else {
        css_map <- NULL
      }

      if (length(script_paths)) {
        # first, sort the filenames alphanumerically
        script_paths <- script_paths[order(basename(script_paths))]
        # now, identify vector positions for asset strings matching pattern above
        match_scripts <- gregexpr(pattern = assets_pattern, script_paths, perl=TRUE)
        # use regmatches to retrieve only the substring including assets/...
        script_names <- regmatches(script_paths, match_scripts)
        # assign names for matched assets corresponding to substring
        scripts_map <- setNames(script_paths, script_names %||% "/")
      } else {
        scripts_map <- NULL
      }

      if (length(file_paths)) {
        # first, sort the filenames alphanumerically
        file_paths <- file_paths[order(basename(file_paths))]
        # now, identify vector positions for asset strings matching pattern above
        match_all <- gregexpr(pattern = assets_pattern, file_paths, perl=TRUE)
        # use regmatches to retrieve only the substring including assets/...
        file_names <- regmatches(file_paths, match_all)
        # assign names for matched assets corresponding to substring
        other_files_map <- setNames(file_paths, file_names %||% "/")
      } else {
        other_files_map <- NULL
      }

      # set attributes for the return object to include the file
      # modification times for each entry in the asset_map
      return(list(css = setModtimeAsAttr(css_map),
                  scripts = setModtimeAsAttr(scripts_map),
                  other = setModtimeAsAttr(other_files_map)
                  )
             )
    },

    componentify = function(x) {
      if (is.component(x)) return(x)
      if (all(vapply(x, is.component, logical(1)))) return(x)
      stop("The layout must be a component or a collection of components", call. = FALSE)
    },

    # the input/output mapping passed back-and-forth between the client & server
    callback_map = list(),

    # the list of inline scripts passed as strings via (clientside) callbacks
    inline_scripts = list(),

    # akin to https://github.com/plotly/dash-renderer/blob/master/dash_renderer/__init__.py
    react_version_enabled= function() {
      version <- private$dependencies_internal$`react-prod`$version
      return(version)
      },
    react_deps = function() {
      deps <- private$dependencies_internal
      deps[grepl("^react", names(deps))]
      },
    react_versions = function() {
      vapply(private$react_deps(), "[[", character(1), "version")
      },

    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    custom_index = NULL,
    template_index = c(
    "<!DOCTYPE html>
        <html>
          <head>
            {%meta_tags%}
            <title>{%title%}</title>
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
        </html>", NA),
    .index = NULL,

    generateReloadHash = function() {
      last_update_time <- max(as.integer(private$app_root_modtime),
                              as.integer(private$asset_modtime),
                              as.integer(private$app_launchtime),
                              na.rm=TRUE)

      # update the timestamp to reflect the current reloading event
      private$last_reload <- as.integer(Sys.time())

      digest::digest(as.character(last_update_time),
                     "md5",
                     serialize = FALSE)
    },

    collect_resources = function() {
      # Dash's own dependencies
      # serve the dev version of dash-renderer when in debug mode
      dependencies_all_internal <- .dash_js_metadata()

      if (private$debug) {
        depsSubset <- dependencies_all_internal[!names(dependencies_all_internal) %in% c("dash-renderer-prod",
                                                                                         "dash-renderer-map-prod",
                                                                                         "prop-types-prod")]
      } else {
        depsSubset <- dependencies_all_internal[!names(dependencies_all_internal) %in% c("dash-renderer-dev",
                                                                                         "dash-renderer-map-dev",
                                                                                         "prop-types-dev")]
      }

      private$dependencies_internal <- depsSubset

      # collect and resolve package dependencies
      depsAll <- compact(c(
        private$react_deps()[private$react_versions() %in% private$react_version_enabled()],
        private$dependencies_internal[grepl(pattern = "prop-types", x = private$dependencies_internal)],
        private$dependencies_internal[grepl(pattern = "polyfill", x = private$dependencies_internal)],
        private$dependencies,
        private$dependencies_user,
        private$dependencies_internal[grepl(pattern = "dash-renderer", x = private$dependencies_internal)]
      ))

      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- depsAll[!vapply(depsAll,
                                 function(v) {
                                   !is.null(v[["script"]]) && tools::file_ext(v[["script"]]) == "map"
                                   }, logical(1))]

      # stylesheets always go in header
      css_deps <- compact(lapply(depsAll, function(dep) {
        if (is.null(dep$stylesheet)) return(NULL)
        dep$script <- NULL
        dep
      }))

      css_deps <- render_dependencies(css_deps,
                                      local = private$serve_locally,
                                      prefix=self$config$requests_pathname_prefix)

      # ensure that no dependency has both async and dynamic set
      if (any(
        vapply(depsAll, function(dep)
          length(intersect(c("dynamic", "async"), names(dep))) > 1,
          logical(1)
        )
       )
      )
        stop("Can't have both 'dynamic' and 'async' in a Dash dependency; please correct and reload.", call. = FALSE)

      # remove dependencies which are dynamic from the script list
      # to avoid placing them into the index
      depsAll <- depsAll[!vapply(depsAll,
                                 isDynamic,
                                 logical(1),
                                 eager_loading = private$eager_loading)]

      # scripts go after dash-renderer dependencies (i.e., React),
      # but before dash-renderer itself
      scripts_deps <- compact(lapply(depsAll, function(dep) {
        if (is.null(dep$script)) return(NULL)
        dep$stylesheet <- NULL
        dep
      }))

      scripts_deps <- render_dependencies(scripts_deps,
                                          local = private$serve_locally,
                                          prefix=self$config$requests_pathname_prefix)

      # collect CSS assets from dependencies
      if (!(is.null(private$asset_map$css))) {
        css_assets <- generate_css_dist_html(href = paste0(private$assets_url_path, names(private$asset_map$css)),
                                             local = TRUE,
                                             local_path = private$asset_map$css,
                                             prefix = self$config$requests_pathname_prefix)
      }
      else {
        css_assets <- NULL
      }

      # collect CSS assets from external_stylesheets
      css_external <- vapply(self$config$external_stylesheets,
                             generate_css_dist_html,
                             FUN.VALUE=character(1),
                             local = FALSE)

      # collect JS assets from dependencies
      #
      if (!(is.null(private$asset_map$scripts))) {
        scripts_assets <- generate_js_dist_html(href = paste0(private$assets_url_path, names(private$asset_map$scripts)),
                                                local = TRUE,
                                                local_path = private$asset_map$scripts,
                                                prefix = self$config$requests_pathname_prefix)
      } else {
        scripts_assets <- NULL
      }

      # collect JS assets from external_scripts
      scripts_external <- vapply(self$config$external_scripts,
                                 generate_js_dist_html,
                                 FUN.VALUE=character(1))

      # create tag for favicon, if present
      # other_files_map[names(other_files_map) %in% "/favicon.ico"]
      if ("/favicon.ico" %in% names(private$asset_map$other)) {
        favicon <- sprintf("<link href=\"/_favicon.ico\" rel=\"icon\" type=\"image/x-icon\">")
      } else {
        favicon <- ""
      }

      # set script tag to invoke a new dash_renderer
      scripts_invoke_renderer <- sprintf("<script id=\"%s\" type=\"%s\">%s</script>",
                                         "_dash-renderer",
                                         "application/javascript",
                                         "var renderer = new DashRenderer();")

      # add inline tags
      scripts_inline <- private$inline_scripts

      # serving order of CSS and JS tags: package -> external -> assets
      css_tags <- paste(c(css_deps,
                          css_external,
                          css_assets),
                        collapse = "\n            ")

      scripts_tags <- paste(c(scripts_deps,
                              scripts_external,
                              scripts_assets,
                              scripts_inline,
                              scripts_invoke_renderer),
                            collapse = "\n              ")

      meta_tags <- paste(generate_meta_tags(private$meta_tags),
                         collapse = "\n            ")

      return(list(css_tags = css_tags,
                  scripts_tags = scripts_tags,
                  favicon = favicon,
                  meta_tags = meta_tags))
    },

    index = function() {
      # generate tags for all assets
      all_tags <- private$collect_resources()

      # retrieve favicon tag for serving in the index
      favicon <- all_tags[["favicon"]]

      # retrieve CSS tags for serving in the index
      css_tags <- all_tags[["css_tags"]]

      # retrieve script tags for serving in the index
      scripts <- all_tags[["scripts_tags"]]

      # insert meta tags if present
      meta_tags <- all_tags[["meta_tags"]]
      
      # define the react-entry-point
      app_entry <- "<div id='react-entry-point'><div class='_dash-loading'>Loading...</div></div>"
      # define the dash default config key
      config <- sprintf("<script id='_dash-config' type='application/json'> %s </script>", to_JSON(self$config))

      if (is.null(private$name))
        private$name <- 'dash'
      
      if (!is.null(private$custom_index)) {
        string_index <- glue::glue(private$custom_index, .open = "{%", .close = "%}")
        
        private$.index <- string_index
      }
      
      else if (length(private$template_index) == 1) {
        private$.index <- private$template_index
      }

      # define the react-entry-point
      app_entry <- "<div id='react-entry-point'><div class='_dash-loading'>Loading...</div></div>"
      # define the dash default config key
      config <- sprintf("<script id='_dash-config' type='application/json'> %s </script>", to_JSON(self$config))

      if (is.null(private$name))
        private$name <- 'dash'

      if (!is.null(private$custom_index)) {
        string_index <- glue::glue(private$custom_index, .open = "{%", .close = "%}")

        private$.index <- string_index
      }

      else if (length(private$template_index) == 1) {
        private$.index <- private$template_index
      }

      else {
        private$.index <- sprintf(
       '<!DOCTYPE html>
        <html>
          <head>
            %s
            <title>%s</title>
            %s
            %s
          </head>

          <body>
            %s
            <footer>
              %s
              %s
            </footer>
          </body>
        </html>',
          meta_tags,
          private$name,
          favicon,
          css_tags,
          app_entry,
          config,
          scripts
        )
      }
    }
  )
)

validate_dependency <- function(layout_, dependency) {
  if (!is.layout(layout_)) stop("`layout` must be a dash layout object", call. = FALSE)
  if (!is.dependency(dependency)) stop("`dependency` must be a dash dependency object", call. = FALSE)

  valid_props <- component_props_given_id(layout_, dependency$id)

  if (!isTRUE(dependency$property %in% valid_props)) {
    warning(
      sprintf(
        "'%s' is not a valid property for the component with id '%s'. Try one of the following: '%s'",
        dependency$property, dependency$id, paste(valid_props, collapse = "', '")
      ),
      call. = FALSE
    )
    return(FALSE)
  }

  TRUE
}
