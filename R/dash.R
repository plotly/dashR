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
#'     Set the layout (i.e., user interface).
#'   }
#'   \item{`layout_get()`}{
#'     Retrieves the layout.
#'   }
#'   \item{`callback(func, output)`}{
#'     Callback function to execute when relevant inputs change.
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
    # expose the fiery server in case users want to add/customize things downstream
    server = NULL,

    # TODO: what is this static_folder argument? Do we need one?
    # https://github.com/plotly/dash/blob/31315d6/dash/dash.py#L25
    initialize = function(name = "dash", server = fiery::Fire$new(),
                          url_base_pathname = '/', csrf_protect = TRUE,
                          serve_locally = TRUE) {

      private$name <- name
      private$url_base_pathname <- url_base_pathname
      private$csrf_protect <- csrf_protect
      private$serve_locally <- serve_locally

      if (!inherits(server, "Fire"))  {
        stop("Only fiery webservers are supported at the moment", call. = FALSE)
      }

      # http://www.data-imaginist.com/2017/Introducing-routr/
      router <- routr::RouteStack$new()

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
        wrapper <- private$callback_map[[
          with(request$body$output, paste(id, property, sep = "."))
        ]]
        if (!length(wrapper)) stop_report("Couldn't find output component.")

        # compute the new output value, if necessary
        inputValMap <- as.data.frame(request$body$inputs)
        for (i in seq_along(wrapper$inputs)) {
          input <- wrapper$inputs[[i]]
          idx <- inputValMap$id %in% input$id & inputValMap$property %in% input$property
          if (sum(idx) != 1) warning("Unexpected behavior. Please report to https://github.com/plotly/dasher")
          newValue <- setNames(list(inputValMap[idx, "value"]), names(wrapper$inputs)[[i]])
          formals(wrapper$func) <- modifyList(formals(wrapper$func), newValue)
        }

        # TODO: is this a bad idea?
        environment(wrapper$closure)$func <- wrapper$func
        output_value <- wrapper$closure()

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
        response$body <- private$index_html
        FALSE
      })

      # TODO: is using the app name in this way a good idea?
      router$add_route(route, name)
      server$attach(router)

      # generate index page on server start...
      # Why? Well, if we do it inside the GET /* handler, we have to map
      # a resource route inside another route, which leads to weird errors
      server$on("start", function(server, ...) {

        # register a resource route pointing the dependencies on the server
        # note that registration will modify the source path to be relative to
        # the resource route
        private$index_html <- private$index()
      })

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

    # ------------------------------------------------------------------------
    # dash layout methods
    # ------------------------------------------------------------------------
    layout_get = function() {
      private$layout
    },
    layout_set = function(...) {

      # store the layout and a (flattened) vector form since we query the
      # vector names several times to verify ID naming (among other things)
      container <- html_div(...)
      oldClass(container) <- c("dash_layout", oldClass(container))
      private$layout <- container
      private$layout_flat <- rapply(private$layout, I)

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
    callback = function(func = NULL, output = NULL, envir = parent.frame()) {

      if (identical(private$layout, welcome_page())) {
        stop("The layout must be set before definind any callbacks", call. = FALSE)
      }

      # turn bare R functions into a "wrapper" so eval logic is consistent
      wrapper <- if (is.wrapper(func)) func else wrappify(func)

      # argument type checking
      assertthat::assert_that(is.output(output))
      assertthat::assert_that(is.environment(envir))

      # -----------------------------------------------------------------------
      # verify that output/input/state IDs provided exists in the layout
      # -----------------------------------------------------------------------
      ids <- private$layout_flat[grep("id$", names(private$layout_flat))]
      callback_ids <- unlist(c(
        output$id,
        sapply(wrapper$inputs, "[[", "id"),
        sapply(wrapper$states, "[[", "id")
      ))
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
      # ----------------------------------------------------------------------
      # TODO: need to rethink this...how to support it generally for any transpiled package?
      #validate_dependency(private$layout, output)
      #for (i in seq_along(inputz)) {
      #  validate_dependency(private$layout, inputz[[i]])
      #}

      # store the callback mapping/function so we may access it later
      # https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L530-L546
      # TODO: leverage tidyeval to ensure we're evaluating things in proper envir?
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
    # initialize parameters
    # TODO: should these be exposed as fields?
    name = NULL,
    url_base_pathname = NULL,
    csrf_protect = NULL,
    serve_locally = FALSE,

    layout = welcome_page(),
    layout_flat = rapply(welcome_page(), I),
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

    # compute HTML dependencies based on the current layout
    dependencies_layout = function() {
      # What "component packages" (i.e., components created via dashTranspileR)
      # are we working with?
      layout_nms <- names(private$layout_flat)
      pkgs <- unique(private$layout_flat[grepl("package$", layout_nms)])
      lapply(pkgs, function(pkg) {
        readRDS(system.file("data", "dependencies.rds", package = pkg))
      })
    },

    # copy HTML dependencies to a resource route
    dependencies_register = function(dependencies) {

      # resourcify makes the source file path relative to the libdir
      libdir <- tempdir()
      dependencies <- resourcify(dependencies, libdir)

      # create and register a new routestack with the server
      # note that resoure routes are designed to serve directories (not individual files)
      router <- routr::RouteStack$new()
      route <- routr::ressource_route('/' = libdir)
      router$add_route(route, "dasher-resources", after = 1)
      self$server$attach(router, force = TRUE)

      dependencies
    },

    index_html = NULL,
    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    index = function() {

      # collect and resolve dependencies
      depsAll <- c(
        deps[c("react", "react-dom")],
        private$dependencies_layout(),
        private$dependencies_user,
        deps["dash-renderer"]
      )

      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- resolve_dependencies(depsAll)

      # register a resource route for dependencies (if necessary)
      if (isTRUE(private$serve_locally)) {
        depsAll<- private$dependencies_register(depsAll)
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
        # dash-renderer needs these config settings (JSON object)
        to_JSON(c(private$config, list(url_base_pathname = private$url_base_pathname))),
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


  type <- component_type_given_id(layout, dependency$id)
  valid_props <- component_props_given_type(type)

  if (!isTRUE(dependency$property %in% valid_props)) {
    stop(
      sprintf(
        "The %s property '%s' is not a valid property for '%s' components. Try one of the following: '%s'",
        class(dependency)[2], dependency$property, type,
        paste(valid_props, collapse = "', '")
      ),
      call. = FALSE
    )
  }

  TRUE
}

# register a resource route pointing to a collection of HTML dependencies

# NOTE: this implementation assumes htmltools::resolveDependencies()
# has already been used to resolve paths and duplicates
dependencies_register <- function(app, dependencies) {
  assert_that(inherits(app, "Dash"))
  #assert_that(inherits(dependencies, "html_dependencies"))

  # TODO: implement this field!
  if (isTRUE(app$serve_locally)) return(app)

  # copy all the HTML dependencies to a temporary directory
  # which will be used for serving those (local) resources
  # note, this is similar to what happens inside htmltools::save_html()
  libdir <- tempdir()
  dependencies <- lapply(dependencies, function(dep) {
    dep <- htmltools::copyDependencyToDir(dep, libdir, FALSE)
    htmltools::makeDependencyRelative(dep, libdir, FALSE)
  })

  # create and register a new routestack with the server
  router <- routr::RouteStack$new()
  route <- routr::ressource_route('/' = libdir)
  router$add_route(route, "dasher-resources", after = 1)
  app$server$attach(router, force = TRUE)

  dependencies
}


