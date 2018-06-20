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
#'  \item{`exclude_plotly_bundle`}{
#'  Whether or not to exclude the plotly.js bundle when "core components" exist,
#'  but [dashCoreComponents::coreGraph] is not provided to the `layout_set()`
#'  method (i.e., the initial layout).
#'  The only time `exclude_plotly_bundle` should be `TRUE` is if you don't want
#'  a `coreGraph()` in the initial layout, but want to insert one via a callback.
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
    config = list(),

    # i.e., the Dash$new() method
    initialize = function(name = "dash",
                          server = fiery::Fire$new(),
                          static_folder = NULL,
                          serve_locally = TRUE,
                          routes_pathname_prefix = '/',
                          requests_pathname_prefix = '/',
                          suppress_callback_exceptions = FALSE,
                          exclude_plotly_bundle = TRUE) {

      # argument type checking
      assertthat::assert_that(is.character(name))
      assertthat::assert_that(inherits(server, "Fire"))
      assertthat::assert_that(is.logical(serve_locally))
      assertthat::assert_that(is.character(routes_pathname_prefix))
      assertthat::assert_that(is.character(requests_pathname_prefix))
      assertthat::assert_that(is.logical(suppress_callback_exceptions))
      assertthat::assert_that(is.logical(exclude_plotly_bundle))

      # save relevant args as private fields
      private$name <- name
      private$serve_locally <- serve_locally
      private$suppress_callback_exceptions <- suppress_callback_exceptions
      private$exclude_plotly_bundle <- exclude_plotly_bundle

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
        local_path <- normalizePath(static_folder, mustWork = TRUE)

        # these should all be directories, right?
        if (!all(dir_exists(local_path))) {
          warning(
            "One or more of the following paths is not a directory, '%s'",
            paste(static_folder, collapse = "', '"),
            call. = FALSE
          )
        }

        # default to '/' if no url path is specified (via name attribute)
        resource_map <- setNames(local_path, names(static_folder) %||% "/")

        static_route <- do.call(routr::ressource_route, as.list(resource_map))
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

      dash_index <- routes_pathname_prefix
      route$add_handler("get", dash_index, function(request, response, keys, ...) {
        response$body <- private$.index
        response$status <- 200L
        response$type <- 'html'
        TRUE
      })

      dash_layout <- paste0(routes_pathname_prefix, "_dash-layout")
      route$add_handler("get", dash_layout, function(request, response, keys, ...) {
        lay <- private$layout_render()
        response$body <- to_JSON(lay, pretty = TRUE)
        response$status <- 200L
        response$type <- 'json'
        TRUE
      })

      dash_deps <- paste0(routes_pathname_prefix, "_dash-dependencies")
      route$add_handler("get", dash_deps, function(request, response, keys, ...) {

        # dash-renderer wants an empty array when no dependencies exist (see python/01.py)
        if (!length(private$callback_map)) {
          response$body <- to_JSON(list())
          response$status <- 200L
          response$type <- 'json'
          return(TRUE)
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
        TRUE
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
        output_value <- format_output_value(output_value, self$dependencies_get())

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

      # TODO: once implemented in dash-renderer, leverage this endpoint so
      # we can dynamically load dependencies during `_dash-update-component`
      # https://plotly.slack.com/archives/D07PDTRK6/p1507657249000714?thread_ts=1505157408.000123&cid=D07PDTRK6
      dash_suite <- paste0(routes_pathname_prefix, "_dash-component-suites")
      route$add_handler("get", dash_suite, function(request, response, keys, ...) {
        response$status <- 500L
        response$body <- "Not yet implemented"
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
      if (render) private$layout_render() else private$layout
    },
    layout_set = function(...) {
      private$layout <- if (is.function(..1)) ..1 else list(...)
    },

    # ------------------------------------------------------------------------
    # HTML dependency management
    # ------------------------------------------------------------------------
    dependencies_get = function() {
      c(private$dependencies_user, private$dependencies)
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
    routes_pathname_prefix = NULL,
    requests_pathname_prefix = NULL,
    suppress_callback_exceptions = NULL,
    exclude_plotly_bundle = TRUE,

    # fields for tracking HTML dependencies
    dependencies = list(),
    dependencies_user = list(),

    # layout stuff
    layout = welcome_page(),
    layout_ids = NULL,
    layout_render = function() {
      # assuming private$layout is either a function or a list of components...
      layout <- if (is.function(private$layout)) private$layout() else private$layout

      # accomodate functions that return a single component
      if (is.component(layout)) layout <- list(layout)

      # at this point we should be working with a list of:
      # (1) dash components
      # (2) stuff built on htmltools
      # this function ensures we have a list of dash components
      layout <- lapply(layout, private$componentify)

      # Put the list of components into a container div. I'm pretty sure dash
      # requires the layout to be one component, but R folks are used to
      # being able to supply "components" to ...
      layout <- dashHtmlComponents::htmlDiv(children = layout, id = layout_container_id())

      # store the layout as a (flattened) vector form since we query the
      # vector names several times to verify ID naming (among other things)
      layout_flat <- rapply(layout, I)
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
      # note that this rds file is created by dashRtranspile
      pkgs <- unique(layout_flat[grepl("package$", layout_nms)])
      dashR_deps <- lapply(pkgs, function(pkg) {
        dep_file <- system.file("dashR_deps.rds", package = pkg)
        if (dep_file == "") return(NULL)
        readRDS(dep_file)
      })

      # if core components are used, but no coreGraph() exists,
      # don't include the plotly.js bundle
      if (private$exclude_plotly_bundle) {
        hasCore <- "dashCoreComponents" %in% pkgs
        hasGraph <- component_contains_type(layout, "dashCoreComponents", "Graph")
        if (hasCore && !hasGraph) {
          idx <- which(pkgs %in% "dashCoreComponents")
          scripts <- dashR_deps[[idx]][["script"]]
          dashR_deps[[idx]][["script"]] <- scripts[!grepl("^plotly-*", scripts)]
        }
      }

      # add on HTML dependencies we've identified by crawling the layout
      private$dependencies <- c(private$dependencies, dashR_deps)

      # bootstrap JavaScript requires jQuery
      # TODO: handle non-minified version as well
      scripts <- basename(unlist(lapply(private$dependencies, "[[", "script")))
      if ("bootstrap.min.js" %in% scripts) {
        private$dependencies <- c(list(jquery_shiny()), private$dependencies)
      }

      # return the computed layout
      oldClass(layout) <- c("dash_layout", oldClass(layout))
      layout
    },

    componentify = function(x) {

      # register add any relevant HTML dependencies
      private$dependencies <- c(private$dependencies, htmltools::htmlDependencies(x))

      if (is.component(x)) {
        # a component's children could be holding tags
        if ("children" %in% x[["propNames"]]) {
          x[["props"]][["children"]] <- lapply(x[["props"]][["children"]], private$componentify)
        }

        # register HTML dependencies tied to dashRwidgets::htmlwidget
        # https://github.com/plotly/dashRwidgets/blob/c6c6941/tools/transpile.R#L10
        # https://github.com/plotly/dashRwidgets/blob/c6c6941/R/utils.R#L19
        # TODO: perhaps dashRwidgets should automatically attachDependencies?
        if (is.htmlwidget(x)) {
          name <- x[["props"]][["name"]]
          package <- x[["props"]][["package"]] %||% name
          widget_deps <- c(
            utils::getFromNamespace("getDependency", "htmlwidgets")(name, package),
            x[["props"]][["widget"]][["dependencies"]]
            )
          private$dependencies <- c(private$dependencies, widget_deps)
        }

        return(x)
      }

      if (inherits(x, c("shiny.tag.list", "list"))) {
        components <- lapply(compact(x), private$componentify)
        return(htmlDiv(id = paste0("shiny-tag-list-", new_id()), children = components))
      }

      if (inherits(x, "shiny.tag")) {

        if (length(x[["children"]])) {
          x[["children"]] <- lapply(x[["children"]], private$componentify)
        }

        # obtain the relevant dash-html-component function definiton
        # (e.g. tags$a() -> htmlA())
        components_html <- ls(asNamespace("dashHtmlComponents"))
        is_html <- tolower(sub("^html", "", components_html)) %in% sub("body", "div", x[["name"]])
        component <- components_html[is_html]
        htmlComponent <- tryCatch(
          getFromNamespace(component, "dashHtmlComponents"),
          error = function(e) {
            stop(sprintf("Couldn't find a mapping for '%s' tags", x[["name"]]), call. = FALSE)
          }
        )

        # translate tag attributes to props (i.e., build the function arguments)
        args <- x[["attribs"]] %||% list()

        # class attribute -> className prop
        args[["className"]] <- args[["class"]]
        args[["class"]] <- NULL

        # style attribute (string) -> style prop (list)
        if (length(args[["style"]])) {
          assertthat::assert_that(is.character(args[["style"]]))
          assertthat::assert_that(length(args[["style"]]) == 1)
          styles <- strsplit(strsplit(args[["style"]], ";")[[1]], ":")
          if (!unique(lengths(styles)) == 2) stop("Malformed style attribute")
          name <- str_trim(sapply(styles, `[[`, 1))
          value <- str_trim(sapply(styles, `[[`, 2))
          args[["style"]] <- setNames(as.list(value), name)
        }

        if (length(x[["children"]])) args[["children"]] <- x[["children"]]

        return(do.call(htmlComponent, args))
      }

      # translate htmltools::HTML() to dashDangerouslySetInnerHtml::DangerouslySetInnerHTML()
      if (inherits(x, "html") && isTRUE(attr(x, "html"))) {
        try_library("dashDangerouslySetInnerHtml", "HTML")
        return(getFromNamespace("DangerouslySetInnerHTML", "dashDangerouslySetInnerHtml")(x))
      }

      x
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
      callback_ids <- unlist(c(
        output$id,
        sapply(wrapper$inputs, "[[", "id"),
        sapply(wrapper$state, "[[", "id")
      ))
      illegal_ids <- setdiff(callback_ids, private$layout_ids)
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

    # Create resource route(s) pointing to (local) HTML dependencies
    register_dependencies = function(dependencies) {

      # filter out non-local dependencies
      dependencies <- compact(lapply(dependencies, function(dep) {
        assertthat::assert_that(inherits(dep, "html_dependency"))
        if (is.null(dep[["src"]][["file"]])) NULL else dep
      }))

      # Basic dash endpoints should already be registered at this point,
      # so we query that RouteStack and add routes for each dependency
      # TODO: does make more sense to have different RouteStack(s)?
      routrs <- self$server$plugins
      if (!"request_routr" %in% names(routrs)) stop("Couldn't find dashR endpoints.")
      dash_router <- routrs[["request_routr"]]

      # Register a resource route for each dependency -- unless one already exists
      for (i in seq_along(dependencies)) {
        dep <- dependencies[[i]]
        dep_key <- paste(dep[["name"]], dep[["version"]], sep = "@")
        if (dash_router$has_route(dep_key)) next

        # create/attach the resource mapping
        local_path <- dep[["src"]][["file"]]
        resource_map <- setNames(local_path, dep_key)
        rroute <- do.call(routr::ressource_route, as.list(resource_map))
        dash_router$add_route(rroute, dep_key)
        self$server$attach(dash_router, force = TRUE)

        # make the dependency's local path relative for downstream rendering
        dependencies[[i]][["src"]][["file"]] <- dep_key
      }

      dependencies
    },

    # akin to https://github.com/plotly/dash-renderer/blob/master/dash_renderer/__init__.py
    react_version = "15.4.2",
    react_deps = function() deps[grepl("^react", names(deps))],
    react_versions = function() vapply(private$react_deps(), "[[", character(1), "version"),

    # akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L338
    # note discussion here https://github.com/plotly/dash/blob/d2ebc837/dash/dash.py#L279-L284
    .index = NULL,
    index = function() {

      # collect and resolve dependencies
      depsAll <- compact(c(
        private$react_deps()[private$react_versions() %in% private$react_version],
        private$dependencies,
        private$dependencies_user,
        deps["dash-renderer"]
      ))

      # normalizes local paths and keeps newer versions of duplicates
      depsAll <- resolve_dependencies(depsAll)

      # register a resource route for dependencies (if necessary)
      depsAll <- private$register_dependencies(depsAll)

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

      private$.index <- sprintf(
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
