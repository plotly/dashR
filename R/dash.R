#' Generate a Dash server
#'
#' Description coming soon
#'
#' @usage
#' app <- Dash$new(
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
#'   `name` \tab \tab The name of the Dash application (placed in the `<title>`
#'   of the HTML page).\cr
#'   `server` \tab \tab The web server used to power the application.
#'   Must be a [fiery::Fire] object.\cr
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
#'   possible layout mis-specifications when registering a callback. \cr 
#'   `components_cache_max_age` \tab \tab An integer value specifying the time
#'   interval prior to expiring cached assets. The default is 2678400 seconds,
#'   or 31 calendar days.
#'  }
#'
#' @section Fields:
#' \describe{
#'  \item{`server`}{
#'  A cloned (and modified) version of the [fiery::Fire] object
#'  provided to the `server` argument (various routes will be added which enable
#'  the dashR functionality).
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
#'     collection of dash components (e.g., [coreSlider], [htmlDiv], etc) or
#'     a function which returns a collection of components.
#'   }
#'   \item{`layout_get(render = TRUE)`}{
#'     Retrieves the layout. If render is `TRUE`, and the layout is a function,
#'     the result of the function (rather than the function itself) is returned.
#'   }
#'   \item{`callback(func = NULL, output = NULL)`}{
#'     A callback function defintion. The `func` argument accepts any R function
#'     and `output` defines which layout component property should adopt the results
#'     (via an [output] object). To determine what events trigger this callback,
#'     provide [input] (and/or [state]) object(s) (which should reference
#'     layout components) as argument value(s) to `func`.
#'   }
#'   \item{`dependencies_set(dependencies = NULL, add = TRUE)`}{
#'     Adds additional HTML dependencies to your dash application (beyond the 'internal' dependencies).
#'     The `dependencies` argument accepts [htmltools::htmlDependency] or
#'     [htmltools::htmlDependencies]. The `section` argument determines whether
#'     your dependencies are placed inside `<head>` or `<footer>`.
#'   }
#'   \item{`dependencies_get(all = FALSE)`}{
#'     Retrieve (just user-defined or all) HTML dependencies.
#'   }
#'   \item{`run_server(host = NULL, port = NULL, block = TRUE, showcase = FALSE, ...)`}{
#'     Launch the application. If provided, `host`/`port` set
#'     the `host`/`port` fields of the underlying [fiery::Fire] web
#'     server. The `block`/`showcase`/`...` arguments are passed along
#'     to the `ignite()` method of the [fiery::Fire] server.
#'   }
#'   \item{`run_heroku(host = "0.0.0.0", port = Sys.getenv('PORT', 8080), ...)`}{
#'     Like `run_server()` but sets sensible `host`/`port` defaults
#'     for running the app on Heroku.
#'   }
#' }
#'
#' @export
#' @docType class
#' @format An [R6::R6Class] generator object
#' @seealso <https://plot.ly/dashR/>
#'
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
                          suppress_callback_exceptions = FALSE,
                          components_cache_max_age = 2678400) {

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

      # config options
      self$config$routes_pathname_prefix <- resolve_prefix(routes_pathname_prefix, "DASH_ROUTES_PATHNAME_PREFIX")
      self$config$requests_pathname_prefix <- resolve_prefix(requests_pathname_prefix, "DASH_REQUESTS_PATHNAME_PREFIX")
      self$config$external_scripts <- external_scripts
      self$config$external_stylesheets <- external_stylesheets

      # produce a true copy of the fiery server, since we don't want our
      # attachments/modifications having unintended side-effects
      # https://github.com/thomasp85/fiery/issues/30
      #server <- server$clone()

      # ------------------------------------------------------------
      # Initialize a route stack and register a static resource route
      # ------------------------------------------------------------
      router <- routr::RouteStack$new()

      if (!(is.null(private$assets_folder))) { 
        if (!(dir.exists(private$assets_folder)) && gsub("/+", "", assets_folder) != "assets") {
          warning(sprintf(
            "The supplied assets folder, '%s', could not be found in the project directory.",
            private$assets_folder),
            call. = FALSE
          )
        } else if (dir.exists(private$assets_folder)) {
          private$asset_map <- private$walk_assets_directory(private$assets_folder)
          private$css <- private$asset_map$css
          private$scripts <- private$asset_map$scripts
          private$other <- private$asset_map$other
        }
      }
      
      # ------------------------------------------------------------------------
      # Set a sensible default logger
      # ------------------------------------------------------------------------
      server$set_logger(fiery::logger_console("{event}: {message}"))
      server$access_log_format <- fiery::combined_log_format

      # ------------------------------------------------------------------------
      # define & register routes on the server
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L88-L124
      # http://www.data-imaginist.com/2017/Introducing-routr/
      # ------------------------------------------------------------------------
      route <- routr::Route$new()

      dash_layout <- paste0(self$config$routes_pathname_prefix, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {

        lay <- private$layout_render()
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
            output=callback_signature$output,
            inputs=callback_signature$inputs,
            state=callback_signature$state
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
        thisOutput <- with(request$body$output, paste(id, property, sep = "."))
        callback <- private$callback_map[[thisOutput]][['func']]
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

        output_value <- do.call(callback, callback_args)

        # have to format the response body like this
        # https://github.com/plotly/dash/blob/064c811d/dash/dash.py#L562-L584
        resp <- list(
          response = list(
            props = setNames(list(output_value), request$body$output$property)
          )
        )

        response$body <- to_JSON(resp)
        response$status <- 200L
        response$type <- 'json'
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

        dep_path <- system.file(dep_pkg$rpkg_path,
                                package = dep_pkg$rpkg_name)

        response$body <- readLines(dep_path,
                                   warn = FALSE,
                                   encoding = "UTF-8")
        response$status <- 200L
        response$set_header('Cache-Control',
                            sprintf('public, max-age=%s',
                                    components_cache_max_age)
                            )
        response$type <- get_mimetype(filename)
        TRUE
      })

      dash_assets <- paste0(self$config$routes_pathname_prefix, private$assets_url_path, "/*")

      # ensure slashes are not doubled
      dash_assets <- sub("//", "/", dash_assets)
        
      route$add_handler("get", dash_assets, function(request, response, keys, ...) {
        # unfortunately, keys do not exist for wildcard headers in routr -- URL must be parsed
        # e.g. for "http://127.0.0.1:8080/assets/stylesheet.css?m=1552591104"
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
          
          response$set_header('Cache-Control',
                              sprintf('public, max-age=%s',
                                      components_cache_max_age)
          )
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
                                    components_cache_max_age)
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
        TRUE
      })

      router$add_route(route, "dashR-endpoints")
      server$attach(router)

      server$on("start", function(server, ...) {
        private$index()
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

    # ------------------------------------------------------------------------
    # HTML dependency management
    # ------------------------------------------------------------------------
    dependencies_get = function() {
      c(private$dependencies_user, private$dependencies)
    },
    dependencies_get_internal = function() {
      private$dependencies_internal
    },
    dependencies_set = function(dependencies = list(), add = TRUE) {

      if (!length(dependencies)) return()

      # do a sensible thing if just a single dependency is provided
      if (inherits(dependencies, "html_dependency")) {
        dependencies <- list(dependencies)
      }

      # ensure we have a list of htmltools::htmlDependency
      is_dep <- vapply(dependencies, inherits, logical(1), "html_dependency")
      if (any(!is_dep)) {
        stop("`dependencies` must be a *list* of htmltools::htmlDependency objects", call. = FALSE)
      }

      if (add) {
        dependencies <- c(private$dependencies_user, dependencies)
      }

      private$dependencies_user <- dependencies
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

      # register the callback_map
      private$callback_map[[paste(output$id, output$property, sep='.')]] <- list(
          output=output,
          inputs=inputs,
          state=state,
          func=func
        )
    },

    # ------------------------------------------------------------------------
    # convenient fiery wrappers
    # ------------------------------------------------------------------------
    run_server = function(host = NULL, port = NULL, block = TRUE, showcase = FALSE, ...) {
      if (!is.null(host)) self$server$host <- host
      if (!is.null(port)) self$server$port <- as.numeric(port)
      self$server$ignite(block = block, showcase = showcase, ...)
    },
    run_heroku = function(host = "0.0.0.0", port = Sys.getenv('PORT', 8080), ...) {
      self$server$host <- host
      self$server$port <- as.numeric(port)
      self$run_server(...)
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
        
    # fields for tracking HTML dependencies
    dependencies = list(),
    dependencies_user = list(),
    dependencies_internal = list(),

    # layout stuff
    layout_ = welcome_page(),
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

      # load package-level HTML dependencies
      pkgs <- unique(layout_flat[grepl("package$", layout_nms)])
      deps_layout <- lapply(pkgs, function(pkg) {
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
        fn_name <- paste0(".", pkg, "_js_metadata")
        fn_summary <- getAnywhere(fn_name)

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

      # DashR's own dependencies
      private$dependencies_internal <- dashR:::.dashR_js_metadata()

      # return the computed layout
      oldClass(layout_) <- c("dash_layout", oldClass(layout_))
      layout_
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
      
      return(list(css = css_map, 
                  scripts = scripts_map, 
                  other = other_files_map))
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
      version <- private$dependencies_internal$react$version
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
    
    collect_resources = function() {
      # collect and resolve package dependencies
      depsAll <- compact(c(
        private$react_deps()[private$react_versions() %in% private$react_version_enabled()],
        private$dependencies,
        private$dependencies_user,
        private$dependencies_internal[names(private$dependencies_internal) %in% 'dash-renderer']
      ))
      
      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- htmltools::resolveDependencies(depsAll, FALSE)
      
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
      if (!(is.null(private$css))) {
        css_assets <- generate_css_dist_html(href = paste0(private$assets_url_path, names(private$css)),
                                             local = TRUE,
                                             local_path = private$css,
                                             prefix = self$config$requests_pathname_prefix)
      } else {
        css_assets <- NULL
      }
      
      # collect CSS assets from external_stylesheets
      css_external <- vapply(self$config$external_stylesheets, 
                             generate_css_dist_html, 
                             FUN.VALUE=character(1),
                             local = FALSE)      
      
      # collect JS assets from dependencies
      # 
      if (!(is.null(private$scripts))) {
        scripts_assets <- generate_js_dist_html(href = paste0(private$assets_url_path, names(private$scripts)),
                                                local = TRUE,
                                                local_path = private$scripts,
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
      if ("/favicon.ico" %in% names(private$other)) {
        favicon <- sprintf("<link href=\"/_favicon.ico\" rel=\"icon\" type=\"image/x-icon\">")
      } else {
        favicon <- ""
      }
            
      # serving order of CSS and JS tags: package -> external -> assets
      css_tags <- paste(c(css_deps,
                          css_external,
                          css_assets),
                        collapse = "\n")
      
      scripts_tags <- paste(c(scripts_deps,
                              scripts_external,
                              scripts_assets),
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

# verify that properties attached to output/inputs/state value are valid
# @param layout
# @param component a component (should be a dependency)
validate_dependency <- function(layout_, dependency) {
  if (!is.layout(layout_)) stop("`layout` must be a dash layout object", call. = FALSE)
  if (!is.dependency(dependency)) stop("`dependency` must be a dash dependency object", call. = FALSE)

  valid_props <- component_props_given_id(layout, dependency$id)

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

assert_valid_wildcards <- function (...)
{
  args <- list(...)
  validation_results <- lapply(args, function(x) {
    grepl(c('^data-[a-zA-Z0-9]{1,}$|^aria-[a-zA-Z0-9]{1,}$'), x)
    }
  )
  if(FALSE %in% validation_results) {
    stop(sprintf("The following wildcards are not currently valid in DashR: '%s'",
                 paste((args)[grepl(FALSE, unlist(validation_results))],
                       collapse=", ")), call. = FALSE)
  } else {
    return(args)
  }
}
