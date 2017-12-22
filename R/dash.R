#' Generate a Dash server
#'
#' Description coming soon
#'
#' @usage app <- Dash$new(name = "dash", server = fiery::Fire$new(), url_base_pathname = "/")
#'
#' @section Arguments:
#' \tabular{lll}{
#'   `name` \tab  \tab The name of the Dash application.\cr
#'   `server` \tab  \tab The web server which powers the application. Currently only [fiery::Fire] objects are allowed.\cr
#'   `url_base_pathname` \tab  \tab The base path for locating the Dash application.\cr
#'   `serve_locally` \tab  \tab Whether to serve HTML dependencies using local files or via a URL
#' }
#'
#' @section Fields:
#' \describe{
#'  \item{`server`}{A [fiery::Fire] object}
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
#'     as a list via `.dots` (see demo/input-argument-list.R)
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
#'   \item{`config_set(suppress_callback_exceptions, permissions_cache_expiry)`}{
#'     Set the config.
#'   }
#'   \item{`config_get()`}{
#'     Get the config.
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
#'   htmlH2("Hello Dash"),
#'   "Here is a slider",
#'   coreSlider()
#' )
#' # retrieve the layout with layout_get()
#' app$layout_get()
#'
#'

Dash <- R6::R6Class(
  'Dash',
  public = list(
    # expose initialize arguments in case you want to modify them downstream
    name = "dash",
    server = NULL,
    serve_locally = TRUE,
    url_base_pathname = '/',

    # TODO: what is this static_folder argument? Let's just have folks use routr::ressource_route()?
    # https://github.com/plotly/dash/blob/31315d6/dash/dash.py#L25
    initialize = function(name = "dash", server = fiery::Fire$new(),
                          url_base_pathname = '/', serve_locally = TRUE) {

      # Since these are fields (i.e., can be over-ridden later on),
      # we check these arguments at print time
      self$name <- name
      self$serve_locally <- serve_locally
      self$url_base_pathname <- url_base_pathname

      if (!inherits(server, "Fire"))  {
        stop("Only fiery webservers are supported at the moment", call. = FALSE)
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
      router <- routr::RouteStack$new()
      route <- routr::Route$new()

      dash_login <- paste0(url_base_pathname, "_dash-login")
      route$add_handler("post", dash_login, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- "Not yet implemented"
        FALSE
      })

      dash_layout <- paste0(url_base_pathname, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {
        response$status <- 200L
        response$type <- 'json'
        lay <- private$layout_render()
        response$body <- to_JSON(lay, pretty = TRUE)
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
        wrapper <- private$callback_map[[
          with(request$body$output, paste(id, property, sep = "."))
          ]]
        if (!length(wrapper)) stop_report("Couldn't find output component.")

        # helper function to update formal arguments of the callback function
        # with their new prop value(s)
        update_formals <- function(wrapper, request, type = c("inputs", "state")) {
          type <- match.arg(type)
          currentValues <- as.data.frame(request$body[[type]])
          # nothing to do...
          if (nrow(currentValues) == 0) return(wrapper)
          currentValues$key <- with(currentValues, paste0(id, ".", property))
          for (i in seq_along(wrapper[[type]])) {
            depObj <- wrapper[[type]][[i]]
            key <- with(depObj, paste0(id, ".", property))
            idx <- match(key, currentValues[["key"]])
            if (is.na(idx)) {
              warning(type, " ", key, " not found.", call. = FALSE)
              next
            }
            # NOTE: length(idx) > 1 should never happen because layout ids
            # are guaranteed to be unique at this point
            prop_val <- currentValues[idx, ][["value"]]
            prop_nm <- names(wrapper[[type]])[[i]]

            # update the value of the formal argument with the new prop value
            formals(wrapper$func)[prop_nm] <- setNames(list(prop_val), prop_nm)
          }
          wrapper
        }

        wrapper <- update_formals(wrapper, request, "inputs")
        wrapper <- update_formals(wrapper, request, "state")

        # overwrite the func definition in the closure's environment
        # effectively replacing the func's arguments with the new values
        environment(wrapper$closure)$func <- wrapper$func
        output_value <- wrapper$closure()

        # provides a means for post-processing an R object of a special class
        output_value <- format_output_value(output_value)

        # have to format the response body like this
        # https://github.com/plotly/dash/blob/064c811d/dash/dash.py#L562-L584
        resp <- list(
          response = list(
            props = setNames(list(output_value), request$body$output$property)
          )
        )

        response$status <- 200L
        response$type <- 'json'
        response$body <- to_JSON(resp)
        FALSE
      })

      # TODO: once implemented in dash-renderer, leverage this endpoint so
      # we can dynamically load dependencies during `_dash-update-component`
      # https://plotly.slack.com/archives/D07PDTRK6/p1507657249000714?thread_ts=1505157408.000123&cid=D07PDTRK6
      dash_suite <- paste0(url_base_pathname, "_dash-component-suites")
      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- "Not yet implemented"
        FALSE
      })

      route$add_handler("get", url_base_pathname, function(request, response, keys, ...) {
        response$status <- 200L
        response$type <- 'html'
        response$body <- private$index()
        FALSE
      })

      router$add_route(route, "dasher-endpoints")
      server$attach(router)

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

    # ------------------------------------------------------------------------
    # dash configuration management
    # ------------------------------------------------------------------------
    config_get = function() {
      private$config
    },
    # TODO: implement these new config params
    # https://github.com/plotly/dash/blob/31315d66/dash/dash.py#L51-L52
    config_set = function(suppress_callback_exceptions = NULL, permissions_cache_expiry = NULL) {
      private$config$suppress_callback_exceptions <-
        suppress_callback_exceptions %||% private$config$suppress_callback_exceptions
      private$config$permissions_cache_expiry <-
        permissions_cache_expiry %||% private$config$permissions_cache_expiry
    },

    # ------------------------------------------------------------------------
    # callback registration
    # ------------------------------------------------------------------------
    callback = function(func = NULL, output = NULL, .dots = NULL) {

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

      # turn bare R functions into a "wrapper" so eval logic is consistent
      wrapper <- if (is.wrapper(func)) func else wrappify(func)

      # argument type checking
      assertthat::assert_that(is.output(output))

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
      if (length(illegal_ids)) {
        # TODO: provide an option to suppress this (because demo/urls-02.R)
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
      validate_dependency(layout, output)
      lapply(wrapper$inputs, function(i) validate_dependency(layout, i))
      lapply(wrapper$state, function(s) validate_dependency(layout, s))

      # store the callback mapping/function so we may access it later
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L530-L546
      outputID <- paste(unlist(output), collapse = ".")
      private$callback_map[[outputID]] <- wrapper
    },

    # ------------------------------------------------------------------------
    # convenient fiery wrappers
    # ------------------------------------------------------------------------
    # TODO: how to run on multiple processes?
    run_server = function(block = TRUE, showcase = FALSE, ...) {
      self$server$ignite(block = block, showcase = showcase, ...)
    }
  ),

  private = list(
    layout = welcome_page(),
    layout_flat = NULL,
    layout_render = function() {
      # assuming private$layout is either a function or a list of components...
      layout <- if (is.function(private$layout)) private$layout() else private$layout

      # accomodate functions that return a single component
      if (is.component(layout)) layout <- list(layout)

      # at this point we should be working with a list of components
      is_component <- vapply(layout, is.component, logical(1))
      if (!all(is_component)) {
        stop(
          'Layout must be a collection of dash components ',
          'or a function that returns a collection of components.',
          call. = FALSE
        )
      }
      # ensure everything is wrapped up in a container div
      # TODO: is this necessary?
      layout <- dashHtmlComponents::htmlDiv(
        children = layout, id = "dasher-layout-container"
      )
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
    # TODO: what is going to be the official interface for some of these options?
    config = list(
      suppress_callback_exceptions = FALSE,
      permissions_cache_expiry = 5 * 60,
      plotly_domain = Sys.getenv("plotly_domain", "https://plot.ly"),
      fid = NULL,
      oauth_client_id = 'RcXzjux4DGfb8bWG9UNGpJUGsTaS0pUVHoEf7Ecl',
      redirect_uri = 'http://localhost:9595'
    ),
    # the input/output mapping passed back-and-forth between the client & server
    callback_map = list(),
    # field for tracking HTML dependencies defined by the user
    dependencies_user = NULL,

    # compute HTML dependencies based on the current layout
    dependencies_layout = function() {
      # What "component packages" (i.e., components created via dashTranspileR)
      # are we working with?
      private$layout_render() # TODO: avoid calling this twice
      layout_nms <- names(private$layout_flat)
      pkgs <- unique(private$layout_flat[grepl("package$", layout_nms)])
      lapply(pkgs, function(pkg) {
        readRDS(system.file("dasher_deps.rds", package = pkg))
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
      if (!dash_router$has_route("dasher-resources")) {
        # resource routes are designed to serve directories (not individual files)
        resources <- routr::ressource_route('/' = libdir)
        dash_router$add_route(resources, "dasher-resources")
        self$server$attach(dash_router, force = TRUE)
      }

      dependencies
    },

    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    index = function() {

      # make sure fields are of the right type
      assertthat::assert_that(is.character(self$name))
      assertthat::assert_that(is.logical(self$serve_locally))
      assertthat::assert_that(is.character(self$url_base_pathname))

      # collect and resolve dependencies
      depsAll <- c(
        deps[c("react", "react-dom")],
        private$dependencies_user,
        private$dependencies_layout(),
        deps["dash-renderer"]
      )

      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- resolve_dependencies(depsAll)

      # register a resource route for dependencies (if necessary)
      if (isTRUE(self$serve_locally)) {
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
        self$name,
        render_dependencies(depsCSS, local = self$serve_locally),
        # dash-renderer needs these config settings (JSON object)
        to_JSON(c(private$config, list(url_base_pathname = self$url_base_pathname))),
        render_dependencies(depsScripts, local = self$serve_locally)
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
  }

  TRUE
}
