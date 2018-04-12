#' Generate a Dash server
#'
#' Description coming soon
#'
#' @usage
#' app <- Dash$new(
#'   name = "dash",
#'   server = fiery::Fire$new(),
#'   static_folder = NULL,
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
#'   `static_folder` \tab \tab A character vector of directories for serving
#'   with the application (the default, `NULL`, means don't serve additional
#'   directories). If provided, the names attribute defines corresponding url
#'   path, otherwise it defaults to '/'.\cr
#'   `serve_locally` \tab \tab Whether to serve HTML dependencies locally or
#'   remotely (via URL).\cr
#'   `routes_pathname_prefix` \tab \tab a prefix applied to the backend routes.\cr
#'   `requests_pathname_prefix` \tab \tab a prefix applied to request endpoints
#'   made by Dash's front-end.\cr
#'   `suppress_callback_exceptions` \tab \tab Whether to relay warnings about
#'   possible layout mis-specifications when registering a callback. For an
#'   example of when it is ok to suppress these callbacks, see
#'   `runTutorial("urls-part-2.R")`
#'  }
#'
#' @section Fields:
#' \describe{
#'  \item{`server`}{A cloned (and modified) version of the [fiery::Fire] object
#'  provided to the `server` argument (various routes will be added which enable
#'  the dashR functionality).}
#'  \item{`config`}{A list of configuration options passed along to
#'  dash-renderer. Users shouldn't need to alter any of these options
#'  unless they are constructing their own authorization front-end or
#'  otherwise need to know where the application is making API calls.
#'  }
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{`layout_set(...)`}{
#'     Set the layout (i.e., user interface). The layout should be either a
#'     collection of dash components (e.g., [coreSlider], [htmlDiv], etc) or
#'     a function which returns a collection of components.
#'   }
#'   \item{`layout_get(render = TRUE)`}{
#'     Retrieves the layout. If render is `TRUE`, and the layout is a function,
#'     the result of the function (rather than the function itself) is returned.
#'   }
#'   \item{`callback(func = NULL, output = NULL, .dots = NULL)`}{
#'     A callback function defintion. The `func` argument accepts any R function
#'     and `output` defines which layout component property should adopt the results
#'     (via an [output] object). To determine what events trigger this callback,
#'     provide [input] (and/or [state]) object(s) (which should reference
#'     layout components) as argument value(s) to `func`. When dealing with many
#'     arguments, it may be useful to create them programmatically and supply them
#'     as a list via `.dots`.
#'   }
#'   \item{`callback_print(func = NULL, output = NULL, .dots = NULL, pre = TRUE, ...)`}{
#'     Like `callback`, except the results from `func` are printed, captured, and
#'     (optionally) wrapped in a [htmlPre] component. This makes it easy to place
#'     R console output inside the `output` container. If `pre = TRUE` (the default),
#'     additional arguments (`...`) are passed onto [htmlPre].
#'   }
#'   \item{`callback_png(func = NULL, output = NULL, .dots = NULL, width = NULL, height = NULL, cairo = TRUE, ...)`}{
#'      Like `callback`, except any graphics `func` may produce are captured and
#'      wrapped into a [htmlImg] component. This makes it easy to place results
#'      that an R graphics (png) device would give you inside the `output` container.
#'   }
#'   \item{`dependencies_set(dependencies = NULL, section = NULL, priority = NULL)`}{
#'     Adds additional HTML dependencies to your dash application (beyond the 'internal' dependencies).
#'     The `dependencies` argument accepts [htmltools::htmlDependency] or
#'     [htmltools::htmlDependencies]. The `section` argument determines whether
#'     your dependencies are placed inside `<head>` or `<footer>`. The `priority`
#'     argument controls the order of the dependencies within a `section` (lower
#'     numbers are granted higher priority). If provided, the `section` and `priority`
#'     arguments should either be of length 1 or the same length as `dependencies`.
#'   }
#'   \item{`dependencies_get(all = FALSE)`}{
#'     Retrieve (just user-defined or all) HTML dependencies.
#'   }
#'   \item{`run_server(block = TRUE, showcase = FALSE, ...)`}{
#'     Launch the application. See [fiery::Fire] methods for a description of the arguments
#'   }
#' }
#'
#' @export
#' @docType class
#' @format An [R6::R6Class] generator object
#' @author Carson Sievert
#' @seealso <https://plot.ly/dashR/>
#'
#' @examples
#'
#' app <- runTutorial("urls-part-2.R")
#' app$server$stop()
#'
#'

Dash <- R6::R6Class(
  'Dash',
  public = list(
    # user-facing fields
    server = NULL,
    # i.e., the Dash$new() method
    initialize = function(name = "dash",
                          server = fiery::Fire$new(),
                          static_folder = NULL,
                          serve_locally = TRUE,
                          routes_pathname_prefix = '/',
                          requests_pathname_prefix = '/',
                          suppress_callback_exceptions = FALSE) {

      # argument type checking
      assertthat::assert_that(is.character(name))
      assertthat::assert_that(inherits(server, "Fire"))
      assertthat::assert_that(is.logical(serve_locally))
      assertthat::assert_that(is.character(routes_pathname_prefix))
      assertthat::assert_that(is.character(requests_pathname_prefix))
      assertthat::assert_that(is.logical(suppress_callback_exceptions))

      # save relevant args as private fields
      private$name <- name
      private$serve_locally <- serve_locally
      private$suppress_callback_exceptions <- suppress_callback_exceptions

      # config options
      self$config$routes_pathname_prefix <- routes_pathname_prefix
      self$config$requests_pathname_prefix <- requests_pathname_prefix

      # produce a true copy of the fiery server, since we don't want our
      # attachments/modifications having unintended side-effects
      # https://github.com/thomasp85/fiery/issues/30
      #server <- server$clone()

      # ------------------------------------------------------------
      # Initialize a route stack and register a static resource route
      # ------------------------------------------------------------
      router <- routr::RouteStack$new()

      if (!is.null(static_folder)) {
        static_folder_absolute <- normalizePath(static_folder, mustWork = TRUE)

        # these should all be directories, right?
        if (!all(dir_exists(static_folder_absolute))) {
          warning(
            "One or more of the following paths is not a directory, '%s'",
            paste(static_folder, collapse = "', '"),
            call. = FALSE
          )
        }

        # default to '/' if no url path is specified (via name attribute)
        static_folder_absolute <- setNames(
          static_folder_absolute, names(static_folder) %||% "/"
        )

        static_route <- do.call(routr::resource_route, as.list(static_folder_absolute))
        router$add_route(static_route, 'static_route')
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

      dash_layout <- paste0(routes_pathname_prefix, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {
        lay <- private$layout_render()
        response$body <- to_JSON(lay, pretty = TRUE)
        response$status <- 200L
        response$type <- 'json'
        FALSE
      })

      dash_deps <- paste0(routes_pathname_prefix, "_dash-dependencies")
      route$add_handler("get", dash_deps, function(request, response, keys, ...) {

        # dash-renderer wants an empty array when no dependencies exist (see python/01.py)
        if (!length(private$callback_map)) {
          response$body <- to_JSON(list())
          response$status <- 200L
          response$type <- 'json'
          return(FALSE)
        }

        # client wants the mapping formatted this way -- https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L367-L378
        outputs <- strsplit(names(private$callback_map), "\\.")
        payload <- Map(function(x, y) {
          # IMPORTANT: if state/events don't exist, dash-renderer wants them
          # to be an empty array (i.e., null/missing won't work)
          list(
            output = list(id = y[[1]], property = y[[2]]),
            inputs = setNames(x[["inputs"]] %||% list(), NULL),
            state = setNames(x[["state"]] %||% list(), NULL),
            # TODO: Chris mentioned that events might be deprecated?
            events = setNames(x[["events"]] %||% list(), NULL)
          )
        }, private$callback_map, outputs)

        response$body <- to_JSON(setNames(payload, NULL))
        response$status <- 200L
        response$type <- 'json'
        FALSE
      })

      dash_update <- paste0(routes_pathname_prefix, "_dash-update-component")
      route$add_handler("post", dash_update, function(request, response, keys, ...) {

        request <- request_parse_json(request)

        # get the callback associated with this particular output
        thisOutput <- with(request$body$output, paste(id, property, sep = "."))
        wrapper <- private$callback_map[[thisOutput]]
        if (!length(wrapper)) stop_report("Couldn't find output component.")

        # helper function to update formal arguments of the callback function
        # with their new prop value(s)
        update_formals <- function(wrapper, request, type = c("inputs", "state")) {
          type <- match.arg(type)

          # put input/state info into more convenient data structures (if they exist)
          ids <- sapply(request$body[[type]], "[[", "id")
          if (!length(ids)) return(wrapper)
          props <- sapply(request$body[[type]], "[[", "property")
          # TODO: provide an option to simplify values?
          values <- lapply(request$body[[type]], function(x) jsonlite:::simplify(x[["value"]]))
          values_map <- setNames(values, paste0(ids, ".", props))

          # map component key (ie, id.property) to the callback argument name
          formal_map <- sapply(wrapper[[type]], "[[", "key")
          names(values_map) <- names(formal_map)[match(names(values_map), formal_map)]

          # note that a modifyList() strategy throws away NULL args, which is WRONG
          formals(wrapper$func)[names(values_map)] <- values_map
          wrapper
        }

        wrapper <- update_formals(wrapper, request, "inputs")
        wrapper <- update_formals(wrapper, request, "state")

        # overwrite the func definition in the closure's environment
        # effectively replacing the func's arguments with the new values
        environment(wrapper$closure)$func <- wrapper$func
        output_value <- wrapper$closure()

        # provides a means for post-processing an R object of a special class
        output_value <- format_output_value(output_value, private$dependencies_user)

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
        FALSE
      })

      # TODO: once implemented in dash-renderer, leverage this endpoint so
      # we can dynamically load dependencies during `_dash-update-component`
      # https://plotly.slack.com/archives/D07PDTRK6/p1507657249000714?thread_ts=1505157408.000123&cid=D07PDTRK6
      dash_suite <- paste0(routes_pathname_prefix, "_dash-component-suites")
      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- "Not yet implemented"
        FALSE
      })


      route$add_handler("get", routes_pathname_prefix, function(request, response, keys, ...) {
        response$body <- private$index()
        response$status <- 200L
        response$type <- 'html'
        FALSE
      })

      router$add_route(route, "dashR-endpoints")
      server$attach(router)

      # user-facing fields
      self$server <- server
    },

    # ------------------------------------------------------------------------
    # dash layout methods
    # ------------------------------------------------------------------------
    layout_get = function(render = TRUE) {
      if (render) private$layout_render() else private$layout
    },
    layout_set = function(...) {
      private$layout <- if (is.function(..1)) ..1 else list(...)
    },

    config = list(),

    # ------------------------------------------------------------------------
    # HTML dependency management
    # ------------------------------------------------------------------------
    dependencies_get = function() {
      private$dependencies_user
    },
    dependencies_set = function(dependencies = NULL) {

      if (is.null(dependencies)) {
        if (length(private$dependencies_user)) {
          message("Removing previously specified HTML dependencies")
          private$dependencies_user <- NULL
        }
        return(NULL)
      }

      # do a sensible thing if just a single dependency is provided
      if (inherits(dependencies, "html_dependency")) {
        dependencies <- list(dependencies)
      }

      # ensure we have a list of htmltools::htmlDependency
      is_dep <- vapply(dependencies, inherits, logical(1), "html_dependency")
      if (any(!is_dep)) {
        stop("`dependencies` must be a *list* of htmltools::htmlDependency objects", call. = FALSE)
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
      private$react_version <- version
    },

    # ------------------------------------------------------------------------
    # callback registration
    # ------------------------------------------------------------------------
    callback = function(func = NULL, output = NULL, .dots = NULL) {
      private$callback_(wrap(func), output, .dots)
    },
    callback_print = function(func = NULL, output = NULL, .dots = NULL, pre = TRUE, ...) {
      private$callback_(
        wrap_print(func, pre = TRUE, ...), output, .dots
      )
    },
    callback_png = function(func = NULL, output = NULL, .dots = NULL,  width = NULL, height = NULL, cairo = TRUE, ...) {
      private$callback_(
        wrap_png(func, width = NULL, height = NULL, cairo = TRUE, ...),
        output, .dots
      )
    },
    # TODO: test this out before exposing
    #callback_svg = function(func = NULL, output = NULL, .dots = NULL) {
    #  private$callback(wrap_svg(), output, .dots)
    #},


    # ------------------------------------------------------------------------
    # convenient fiery wrappers
    # ------------------------------------------------------------------------
    # TODO: how to run on multiple processes?
    run_server = function(block = TRUE, showcase = FALSE, ...) {
      self$server$ignite(block = block, showcase = showcase, ...)
    }
  ),

  private = list(
    # private fields defined on initiation
    name = NULL,
    serve_locally = NULL,
    routes_pathname_prefix = NULL,
    requests_pathname_prefix = NULL,
    suppress_callback_exceptions = NULL,

    # layout stuff
    layout = welcome_page(),
    layout_flat = NULL,
    layout_render = function() {
      # assuming private$layout is either a function or a list of components...
      layout <- if (is.function(private$layout)) private$layout() else private$layout

      # accomodate functions that return a single component
      if (is.component(layout)) layout <- list(layout)

      is_component <- vapply(layout, is.component, logical(1))
      if (!all(is_component)) {
        stop(
          'Layout must be a collection of dash components ',
          'or a function that returns a collection of components.',
          call. = FALSE
        )
      }
      # register htmlwidget dependencies
      is_widget <- vapply(layout, is.htmlwidget, logical(1))
      # make sure height/width translate to valid CSS props
      layout[is_widget] <- lapply(layout[is_widget], function(w) {
        w[["width"]] <- htmltools::validateCssUnit(w[["width"]])
        w[["height"]] <- htmltools::validateCssUnit(w[["height"]])
        w
      })
      widget_deps <- lapply(layout[is_widget], function(w) {
        name <- w[["props"]][["name"]]
        package <- w[["props"]][["package"]] %||% name
        try_library("htmlwidgets", "Htmlwidget")
        utils::getFromNamespace("getDependency", "htmlwidgets")(name, package)
      })
      private$dependencies_widget <- Reduce(c, widget_deps)

      # ensure everything is wrapped up in a container div
      # TODO: is this necessary?
      layout <- dashHtmlComponents::htmlDiv(children = layout, id = new_id())

      # store the layout as a (flattened) vector form since we query the
      # vector names several times to verify ID naming (among other things)
      private$layout_flat <- rapply(layout, I)

      # verify that layout ids are unique
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
      # return the computed layout
      oldClass(layout) <- c("dash_layout", oldClass(layout))
      layout
    },

    # the input/output mapping passed back-and-forth between the client & server
    callback_map = list(),

    callback_ = function(wrapper = NULL, output = NULL, .dots = NULL) {

      # argument type checking
      assertthat::assert_that(is.wrapper(wrapper))
      assertthat::assert_that(is.output(output))

      # TODO: cache layouts so we don't have to do this for every callback...
      layout <- private$layout_render()
      if (identical(layout, welcome_page())) {
        stop("The layout must be set before defining any callbacks", call. = FALSE)
      }

      if (!is.null(.dots)) {
        nms <- names(.dots)
        if (length(nms) != length(.dots) || any(nchar(nms) == 0)) {
          stop("Every element of the `.dots` list must be named", call. = FALSE)
        }
        # TODO:
        # (1) add the restriction that they must all be input/state objects?
        # (2) does it matter whether or not .dots is `alist()`?
        formals(func) <- c(formals(func), .dots)
      }

      # -----------------------------------------------------------------------
      # verify that output/input/state IDs provided exists in the layout
      # -----------------------------------------------------------------------
      ids <- private$layout_flat[grep("id$", names(private$layout_flat))]
      callback_ids <- unlist(c(
        output$id,
        sapply(wrapper$inputs, "[[", "id"),
        sapply(wrapper$state, "[[", "id")
      ))
      illegal_ids <- setdiff(callback_ids, ids)
      if (length(illegal_ids) && !private$suppress_callback_exceptions) {
        warning(
          sprintf(
            "The following id(s) do not match any in the layout: '%s'",
            paste(illegal_ids, collapse = "', '")
          ),
          call. = FALSE
        )
      }

      # ----------------------------------------------------------------------
      # verify that properties attached to output/inputs/state value are valid
      # ----------------------------------------------------------------------
      if (!private$suppress_callback_exceptions) {
        validate_dependency(layout, output)
        lapply(wrapper$inputs, function(i) validate_dependency(layout, i))
        lapply(wrapper$state, function(s) validate_dependency(layout, s))
      }

      # store the callback mapping/function so we may access it later
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L530-L546
      private$callback_map[[output[["key"]]]] <- wrapper
    },


    # field for tracking HTML dependencies defined by the user
    dependencies_user = NULL,
    dependencies_widget = NULL,

    # compute HTML dependencies based on the current layout
    dependencies_layout = function() {
      # What "component packages" (i.e., components created via dashTranspileR)
      # are we working with?
      private$layout_render() # TODO: avoid calling this twice
      layout_nms <- names(private$layout_flat)
      pkgs <- unique(private$layout_flat[grepl("package$", layout_nms)])
      lapply(pkgs, function(pkg) {
        readRDS(system.file("dashR_deps.rds", package = pkg))
      })
    },

    # copy HTML dependencies to a resource route
    dependencies_register = function(dependencies) {

      # copy dependencies to temp dir and make their file path relative to it
      libdir <- tempdir()
      dependencies <- resourcify(dependencies, libdir)

      # dash endpoints should already be registered at this point...
      # TODO: provide a more uniquely identifiable name https://github.com/thomasp85/routr/issues/6
      routrs <- self$server$plugins
      if (!"request_routr" %in% names(routrs)) stop("Something unexpected happened.")

      # register a route to dependencies on the server (if it doesn't already exist)
      dash_router <- routrs[["request_routr"]]
      if (!dash_router$has_route("dashR-resources")) {
        # resource routes are designed to serve directories (not individual files)
        resources <- routr::ressource_route('/' = libdir)
        dash_router$add_route(resources, "dashR-resources", after = 1)
        self$server$attach(dash_router, force = TRUE)
      }

      dependencies
    },

    # akin to https://github.com/plotly/dash-renderer/blob/master/dash_renderer/__init__.py
    react_version = "15.4.2",
    react_deps = function() deps[grepl("^react", names(deps))],
    react_versions = function() vapply(private$react_deps(), "[[", character(1), "version"),

    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    index = function() {

      # collect and resolve dependencies
      depsAll <- c(
        private$react_deps()[private$react_versions() %in% private$react_version],
        private$dependencies_widget,
        private$dependencies_user,
        private$dependencies_layout(),
        deps["dash-renderer"]
      )

      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- resolve_dependencies(depsAll)

      # register a resource route for dependencies (if necessary)
      if (isTRUE(private$serve_locally)) {
        depsAll <- private$dependencies_register(depsAll)
      }

      # styleheets always go in header
      depsCSS <- compact(lapply(depsAll, function(dep) {
        if (is.null(dep$stylesheet)) return(NULL)
        dep$script <- NULL
        dep
      }))

      # scripts go after dash-renderer dependencies (i.e., React),
      # but before dash-renderer itself
      depsScripts <- compact(lapply(depsAll, function(dep) {
        if (is.null(dep$script)) return(NULL)
        dep$stylesheet <- NULL
        dep
      }))

      sprintf(
        '<!DOCTYPE html>
        <html>
          <head>
            <meta charset="UTF-8"/>
            <title>%s</title>
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
        render_dependencies(depsCSS, local = private$serve_locally),
        to_JSON(self$config),
        render_dependencies(depsScripts, local = private$serve_locally)
      )
    }
  )
)




# verify that properties attached to output/inputs/state value are valid
# @param layout
# @param component a component (should be a dependency)
validate_dependency <- function(layout, dependency) {
  if (!is.layout(layout)) stop("`layout` must be a dash layout object", call. = FALSE)
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
