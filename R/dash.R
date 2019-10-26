#' Create and configure a Dash app object
#'
#' A framework for building analytical web applications, Dash offers a pleasant and productive development experience. No JavaScript required.
#'
#' @usage Dash
#'
#' @section Constructor: Dash$new(
#'   name = "dash",
#'   server = fiery::Fire$new(),
#'   assets_folder = 'assets',
#'   assets_url_path = '/assets',
#'   assets_ignore = '',
#'   serve_locally = TRUE,
#'   routes_pathname_prefix = '/',
#'   requests_pathname_prefix = '/'
#' )
#'
#' @section Arguments:
#' \tabular{lll}{
#'   `name` \tab \tab Character. The name of the Dash application (placed in the `<title>`
#'   of the HTML page).\cr
#'   `server` \tab \tab The web server used to power the application.
#'   Must be a [fiery::Fire] object.\cr
#'   `assets_folder` \tab \tab Character. A path, relative to the current working directory,
#'   for extra files to be used in the browser. Default is "assets". All .js and
#'   .css files will be loaded immediately unless excluded by `assets_ignore`,
#'   and other files such as images will be served if requested. Default is `assets`. \cr
#'   `assets_url_path` \tab \tab Character. Specify the URL path for asset serving. Default is `assets`. \cr
#'   `assets_ignore` \tab \tab Character. A regular expression, to match assets to omit from
#'   immediate loading. Ignored files will still be served if specifically requested. You
#'   cannot use this to prevent access to sensitive files. \cr
#'   `serve_locally` \tab \tab Whether to serve HTML dependencies locally or
#'   remotely (via URL).\cr
#'   `routes_pathname_prefix` \tab \tab a prefix applied to the backend routes.\cr
#'   `requests_pathname_prefix` \tab \tab a prefix applied to request endpoints
#'   made by Dash's front-end.\cr
#'   `external_scripts` \tab \tab An optional list of valid URLs from which
#'   to serve JavaScript source for rendered pages.\cr
#'   `external_stylesheets` \tab \tab An optional list of valid URLs from which
#'   to serve CSS for rendered pages.\cr
#'   `suppress_callback_exceptions` \tab \tab Whether to relay warnings about
#'   possible layout mis-specifications when registering a callback.
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
#'       \item{func}{any valid R function which generates [output] provided [input] and/or [state] arguments, or a call to [clientsideFunction] including `namespace` and `function_name` arguments for a locally served JavaScript function}
#'     }
#'     The `output` argument defines which layout component property should
#'     receive the results (via the [output] object). The events that
#'     trigger the callback are then described by the [input] (and/or [state])
#'     object(s) (which should reference layout components), which become
#'     argument values for R callback handlers defined in `func`.
#'
#'     `func` may either be an anonymous R function, or a call to
#'     `clientsideFunction()`, which describes a locally served JavaScript
#'     function instead. The latter defines a "clientside callback", which
#'     updates components without passing data to and from the Dash backend.
#'     The latter may offer improved performance relative to callbacks written
#'     in R.
#'   }
#'   \item{`run_server(host =  Sys.getenv('DASH_HOST', "127.0.0.1"),
#'    port = Sys.getenv('DASH_PORT', 8050), block = TRUE, showcase = FALSE, ...)`}{
#'     Launch the application. If provided, `host`/`port` set
#'     the `host`/`port` fields of the underlying [fiery::Fire] web
#'     server. The `block`/`showcase`/`...` arguments are passed along
#'     to the `ignite()` method of the [fiery::Fire] server.
#'   }
#' }
#'
#' @examples
#' \dontrun{
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
    initialize = function(name = "dash",
                          server = fiery::Fire$new(),
                          assets_folder = 'assets',
                          assets_url_path = '/assets',
                          assets_ignore = '',
                          serve_locally = TRUE,
                          routes_pathname_prefix = NULL,
                          requests_pathname_prefix = NULL,
                          external_scripts = NULL,
                          external_stylesheets = NULL,
                          suppress_callback_exceptions = FALSE) {

      # argument type checking
      assertthat::assert_that(is.character(name))
      assertthat::assert_that(inherits(server, "Fire"))
      assertthat::assert_that(is.logical(serve_locally))
      assertthat::assert_that(is.logical(suppress_callback_exceptions))

      # save relevant args as private fields
      private$name <- name
      private$serve_locally <- serve_locally
      # remove leading and trailing slash(es) if present
      private$assets_folder <- gsub("^/+|/+$", "", assets_folder)
      # remove trailing slash in assets_url_path, if present
      private$assets_url_path <- sub("/$", "", assets_url_path)
      private$assets_ignore <- assets_ignore
      private$suppress_callback_exceptions <- suppress_callback_exceptions
      private$app_root_path <- getAppPath()
      private$app_launchtime <- as.integer(Sys.time())

      # config options
      self$config$routes_pathname_prefix <- resolve_prefix(routes_pathname_prefix, "DASH_ROUTES_PATHNAME_PREFIX")
      self$config$requests_pathname_prefix <- resolve_prefix(requests_pathname_prefix, "DASH_REQUESTS_PATHNAME_PREFIX")
      self$config$external_scripts <- external_scripts
      self$config$external_stylesheets <- external_stylesheets

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
      server$set_logger(dash::dashLogger)
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
        TRUE
      })

      # This endpoint supports dynamic dependency loading
      # during `_dash-update-component` -- for reference:
      # https://github.com/plotly/dash/blob/1249ffbd051bfb5fdbe439612cbec7fa8fff5ab5/dash/dash.py#L488
      # https://docs.python.org/3/library/pkgutil.html#pkgutil.get_data
      dash_suite <- paste0(self$config$routes_pathname_prefix, "_dash-component-suites/:package_name/:filename")

      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
        filename <- basename(file.path(keys$filename))
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
          dep_path <- system.file(dep_pkg$rpkg_path,
                                  package = dep_pkg$rpkg_name)

          response$body <- readLines(dep_path,
                                     warn = FALSE,
                                     encoding = "UTF-8")
          response$status <- 200L
          response$type <- get_mimetype(filename)
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
            mime::guess_type(asset_to_match,
                             empty = "application/octet-stream")

          if (grepl("text|javascript", response$type)) {
            response$body <- readLines(asset_path,
                                       warn = FALSE,
                                       encoding = "UTF-8")
          } else {
            file_handle <- file(asset_path, "rb")
            response$body <- readBin(file_handle,
                                     raw(),
                                     file.size(asset_path))
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
        
        use_viewer <- !(is.null(getOption("viewer"))) && (dynGet("use_viewer") == TRUE)
        host <- dynGet("host")
        port <- dynGet("port")
        
        app_url <- paste0("http://", host, ":", port)
        
        if (use_viewer && host %in% c("localhost", "127.0.0.1")) 
          rstudioapi::viewer(app_url)
        else if (use_viewer) {
          warning("\U{26A0} RStudio viewer not supported; ensure that host is 'localhost' or '127.0.0.1' and that you are using RStudio to run your app. Opening default browser...")
          utils::browseURL(app_url)
          }
      })

      # user-facing fields
      self$server <- server
      self$config$running <- TRUE
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
    # convenient fiery wrappers
    # ------------------------------------------------------------------------
    run_server = function(host = Sys.getenv('DASH_HOST', "127.0.0.1"), 
                          port = Sys.getenv('DASH_PORT', 8050), 
                          block = TRUE, 
                          showcase = FALSE, 
                          use_viewer = FALSE,
                          dev_tools_prune_errors = TRUE, 
                          debug = FALSE, 
                          dev_tools_ui = NULL,
                          dev_tools_props_check = NULL,
                          dev_tools_hot_reload = NULL,
                          dev_tools_hot_reload_interval = 3,
                          dev_tools_hot_reload_watch_interval = 0.5,
                          dev_tools_silence_routes_logging = NULL,
                          ...) {
      
      if (exists("dash_nested_fiery_server", env=parent.frame(1))) {
        # fiery is attempting to launch a server within a server, abort gracefully
        return(NULL)
      }
      
      self$server$host <- host
      self$server$port <- as.numeric(port)
      
      self$config$hot_reload_interval <- dev_tools_hot_reload_interval
      self$config$hot_reload_watch_interval <- dev_tools_hot_reload_watch_interval
      
      if(getAppPath() != FALSE) {
        source_dir <- dirname(getAppPath())
        private$app_root_modtime <- modtimeFromPath(source_dir, recursive = TRUE)
      } else {
        source_dir <- NULL
      }
      
      # set the modtime to track state of the Dash app directory
      # this calls getAppPath, which will try three approaches to
      # identifying the local app path (depending on whether the app
      # is invoked via script, source(), or executed dire ctly from console)
      if (is.null(dev_tools_ui) && debug || isTRUE(dev_tools_ui)) {
        self$config$ui <- TRUE
      } else {
        self$config$ui <- FALSE
      }
      
      if (is.null(dev_tools_hot_reload) && debug || isTRUE(dev_tools_hot_reload)) {
        self$config$hot_reload <- TRUE
      } else {
        self$config$hot_reload <- FALSE
      }
      
      if (is.null(dev_tools_silence_routes_logging) && debug || isTRUE(dev_tools_silence_routes_logging)) {
        self$config$silence_routes_logging <- TRUE
      } else {
        self$config$silence_routes_logging <- FALSE
      }

      if (is.null(dev_tools_props_check) && debug || isTRUE(dev_tools_props_check)) {
        self$config$props_check <- TRUE
      } else {
        self$config$props_check <- FALSE
      }

      private$prune_errors <- dev_tools_prune_errors
      private$debug <- debug
      
      if (self$config$hot_reload == TRUE & !(is.null(source_dir))) {
        self$server$on('cycle-end', function(server, ...) {
          if ((as.integer(Sys.time()) - private$last_refresh) >= self$config$hot_reload_watch_interval) {
            current_asset_modtime <- modtimeFromPath(private$assets_folder, recursive = TRUE)
            # by specifying asset_path, we can exclude assets from the root_modtime when recursive=TRUE
            # otherwise modifying CSS assets will always trigger a hard reload
            current_root_modtime <- modtimeFromPath(source_dir, recursive = TRUE, asset_path = private$assets_folder)
            
            updated_assets <- isTRUE(current_asset_modtime > private$asset_modtime)
            updated_root <- isTRUE(current_root_modtime > private$app_root_modtime)
            
            private$app_root_modtime <- current_root_modtime
          
            if (!is.null(current_asset_modtime) && (updated_assets || updated_root)) {
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
              
              self$config$reload_hash <- private$generateReloadHash()
              flush.console()
              
              # if any filetypes other than CSS are encountered in those which
              # are modified or deleted, restart the server
              hard_reload <- updated_root || (has_assets && other_changed || other_added || other_deleted)
              
              if (!hard_reload) {
                # refresh the index but don't restart the server
                private$index()
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
                    # tear down the temporary environment
                    rm(app_env)
                  }
                }
            }
          }
        })
      } else if (self$config$hot_reload == TRUE & is.null(source_dir)) {
          message("\U{26A0} No source directory information available; hot reloading has been disabled.\nPlease ensure that you are loading your Dash for R application using source().\n")
        }      
      self$server$ignite(block = block, showcase = showcase, ...)
      }
    ),

  private = list(
    # private fields defined on initiation
    name = NULL,
    serve_locally = NULL,
    assets_folder = NULL,
    assets_url_path = NULL,
    assets_ignore = NULL,
    routes_pathname_prefix = NULL,
    requests_pathname_prefix = NULL,
    suppress_callback_exceptions = NULL,
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
    last_reload = NULL,
    last_refresh = NULL,
    modified_since_reload = NULL,
    
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

      # accomodate functions that return a single component
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
      if (private$asset_modtime > private$app_launchtime) {
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
        private$dependencies,
        private$dependencies_user,
        private$dependencies_internal[grepl(pattern = "dash-renderer", x = private$dependencies_internal)]
      ))

      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- depsAll[!vapply(depsAll,
                                 function(v) {
                                   !is.null(v[["script"]]) && tools::file_ext(v[["script"]]) == "map"
                                   }, logical(1))]

      # styleheets always go in header
      css_deps <- compact(lapply(depsAll, function(dep) {
        if (is.null(dep$stylesheet)) return(NULL)
        dep$script <- NULL
        dep
      }))

      css_deps <- render_dependencies(css_deps,
                                      local = private$serve_locally,
                                      prefix=self$config$requests_pathname_prefix)

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

      # serving order of CSS and JS tags: package -> external -> assets
      css_tags <- paste(c(css_deps,
                          css_external,
                          css_assets),
                        collapse = "\n")

      scripts_tags <- paste(c(scripts_deps,
                              scripts_external,
                              scripts_assets,
                              scripts_invoke_renderer),
                            collapse = "\n")

      return(list(css_tags = css_tags,
                  scripts_tags = scripts_tags,
                  favicon = favicon))
    },

    index = function() {
      # generate tags for all assets
      all_tags <- private$collect_resources()

      # retrieve favicon tag for serving in the index
      favicon <- all_tags[["favicon"]]

      # retrieve CSS tags for serving in the index
      css_tags <- all_tags[["css_tags"]]

      # retrieve script tags for serving in the index
      scripts_tags <- all_tags[["scripts_tags"]]

      private$.index <- sprintf(
        '<!DOCTYPE html>
        <html>
          <head>
            <meta charset="UTF-8"/>
            <title>%s</title>
            %s
            %s
          </head>

          <body>
            <div id="react-entry-point">
              <div class="_dash-loading">Loading...</div>
            </div>

            <footer>
              <script id="_dash-config" type="application/json"> %s </script>
              %s
            </footer>
          </body>
        </html>',
        private$name,
        favicon,
        css_tags,
        to_JSON(self$config),
        scripts_tags
      )
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
