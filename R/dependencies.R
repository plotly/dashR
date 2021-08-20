# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

# Helper functions for handling dependency ids or props
setWildcardId <- function(id) {
  # Sort the keys of a wildcard id
  id <- id[order(names(id))]
  all_selectors <- vapply(id, function(x) {is.symbol(x)}, logical(1))
  id[all_selectors] <- as.character(id[all_selectors])
  id[!all_selectors] <- lapply(id[!all_selectors], function(x) {jsonlite::unbox(x)})
  return(as.character(jsonlite::toJSON(id, auto_unbox = FALSE)))
}

#' Input/Output/State definitions
#'
#' Use in conjunction with the `callback()` method from the [dash::Dash] class
#' to define the update logic in your application.
#'
#' The `dashNoUpdate()` function permits application developers to prevent a
#' single output from updating the layout. It has no formal arguments.
#'
#' @name dependencies
#' @param id a component id
#' @param property the component property to use

#' @rdname dependencies
#' @export

output <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
input <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
state <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(id = NULL, property = NULL) {
  if (is.null(id)) stop("Must specify an id", call. = FALSE)
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  list(
    id = id,
    property = property
  )
}

#' @rdname dependencies
#' @export
dashNoUpdate <- function() {
  x <- list(NULL)
  class(x) <- "no_update"
  return(x)
}

#' Pattern-Matching Callback Selectors
#' @description
#' Symbols which reference pattern-matching callback selectors with the same names
#' @details
#' `ALL`, `ALLSMALLER` and `MATCH` are symbols corresponding to the
#' pattern-matching callback selectors with the same names. These allow you
#' to write callbacks that respond to or update an arbitrary or dynamic
#' number of components. Because they are symbols (see \link{name}) rather than
#' functions, each has no arguments. For more information, see the `callback`
#' section in \link{Dash}.
#'
#' For pattern-matching callbacks, the `id` field of a component is written
#' in JSON-like syntax. The resulting `id` is then transformed into a dictionary
#' object when serialized for use by the Dash renderer within the web browser.
#' The fields are arbitrary keys, which describe the targets of the callback.
#'
#' For example, when we write `input(id=list("foo" = ALL, "bar" = "dropdown")`,
#' Dash interprets this as "match any input that has an ID list where 'foo'
#' is 'ALL' and 'bar' is anything." If any of the dropdown
#' `value` properties change, all of their values are returned to the callback.
#'
#' However, for readability, we recommend using keys like type, index, or id.
#' `type` can be used to refer to the class or set of dynamic components and
#' `index` or `id` could be used to refer to the component you are matching
#' within that set. While your application may have a single set of dynamic
#' components, it's possible to specify multiple sets of dynamic components
#' in more complex apps or if you are using `MATCH`.
#'
#' Like `ALL`, `MATCH` will fire the callback when any of the component's properties
#' change. However, instead of passing all of the values into the callback, `MATCH`
#' will pass just a single value into the callback. Instead of updating a single
#' output, it will update the dynamic output that is "matched" with.
#'
#' `ALLSMALLER` is used to pass in the values of all of the targeted components
#' on the page that have an index smaller than the index corresponding to the div.
#' For example, `ALLSMALLER` makes it possible to filter results that are
#' increasingly specific as the user applies each additional selection.
#'
#' `ALLSMALLER` can only be used in `input` and `state` items, and must be used
#' on a key that has `MATCH` in the `output` item(s). `ALLSMALLER` it isn't always
#' necessary (you can usually use `ALL` and filter out the indices in your callback),
#' but it will make your logic simpler.
#' @name selectors
#' @rdname selectors
#' @export
#' @examples
#' if (interactive() ) {
#'   library(dash)
#'
#'   # Simple example illustrating use of ALL selector
#'   app <- Dash$new()
#'
#'   app$layout(htmlDiv(list(
#'     htmlButton("Add Filter", id="add-filter", n_clicks=0),
#'     htmlDiv(id="dropdown-container", children=list()),
#'     htmlDiv(id="dropdown-container-output")
#'   )))
#'
#'
#'   app$callback(
#'     output(id="dropdown-container", property = "children"),
#'     params = list(
#'       input(id = "add-filter", property = "n_clicks"),
#'       state(id = "dropdown-container", property = "children")
#'     ),
#'     display_dropdowns <- function(n_clicks, children){
#'       new_dropdown = dccDropdown(
#'         id=list(
#'           "index" = n_clicks,
#'           "type" = "filter-dropdown"
#'         ),
#'         options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
#'           list("label" = x, "value" = x)
#'         })
#'       )
#'       children[[n_clicks + 1]] <- new_dropdown
#'       return(children)
#'     }
#'   )
#'
#'   app$callback(
#'     output(id="dropdown-container-output", property="children"),
#'     params = list(
#'       input(id=list("index" = ALL, "type" = "filter-dropdown"), property= "value")
#'     ),
#'     display_output <- function(test){
#'       ctx <- app$callback_context()
#'       return(htmlDiv(
#'         lapply(seq_along(test), function(x){
#'           return(htmlDiv(sprintf("Dropdown %s = %s", x, test[[x]])))
#'         })
#'       ))
#'     }
#'   )
#'
#'   app$run_server()
#'
#'   # Simple example illustrating use of ALLSMALLER selector
#'   library(dash)
#'
#'   df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv',
#'                  stringsAsFactors = FALSE)
#'
#'   app <- Dash$new()
#'
#'   app$layout(htmlDiv(list(
#'     htmlButton("Add Filter", id = "add-filter-ex3", n_clicks = 0),
#'     htmlDiv(id = "container-ex3", children = list())
#'   )))
#'
#'   app$callback(
#'     output('container-ex3', 'children'),
#'     params = list(
#'       input('add-filter-ex3', 'n_clicks'),
#'       state('container-ex3', 'children')
#'     ),
#'     display_dropdowns <- function(n_clicks, existing_children){
#'       new_children <- htmlDiv(list(
#'         dccDropdown(
#'           id = list("index" = n_clicks, "type" = "filter-dropdown-ex3"),
#'           options = lapply(unique(df$country), function(x){
#'             list("label" = x, "value" = x)
#'           }),
#'           value = unique(df$country)[n_clicks + 1]
#'         ),
#'         htmlDiv(id = list("index" = n_clicks, "type" = "output-ex3"),
#'                 children = list(unique(df$country)[n_clicks + 1]))
#'       ))
#'
#'       existing_children <- c(existing_children, list(new_children))
#'     }
#'   )
#'
#'   app$callback(
#'     output(id = list("type" = "output-ex3", "index" = MATCH), property = "children"),
#'     params = list(
#'       input(id = list("type" = "filter-dropdown-ex3", "index" = MATCH), property = "value"),
#'       input(id = list("type" = "filter-dropdown-ex3", "index" = ALLSMALLER), property = "value")
#'     ),
#'     display_output <- function(matching_value, previous_values){
#'       previous_values_in_reversed_order = rev(previous_values)
#'       all_values = c(matching_value, previous_values_in_reversed_order)
#'       all_values = unlist(all_values)
#'
#'       dff = df[df$country %in% all_values,]
#'       avgLifeExp = round(mean(dff$lifeExp), digits = 2)
#'
#'       if (length(all_values) == 1) {
#'         return(
#'           htmlDiv(sprintf("%s is the life expectancy of %s.",
#'                   avgLifeExp,
#'                   matching_value))
#'         )
#'       } else if (length(all_values) == 2) {
#'         return(
#'           htmlDiv(sprintf("%s is the life expectancy of %s.",
#'                           avgLifeExp,
#'                           paste(all_values, collapse = " and ")))
#'         )
#'       } else {
#'         return(
#'           htmlDiv(sprintf("%s is the life expectancy of %s, and %s.",
#'                   avgLifeExp,
#'                   paste(all_values[-length(all_values)], collapse = " , "),
#'                   paste(all_values[length(all_values)])))
#'         )
#'       }
#'     }
#'   )
#'
#'   app$run_server()
#'
#'   # Simple example illustrating use of MATCH selector
#'   library(dash)
#'
#'   app <- Dash$new()
#'
#'   app$layout(htmlDiv(list(
#'     htmlButton("Add Filter", id="dynamic-add-filter", n_clicks=0),
#'     htmlDiv(id="dynamic-dropdown-container", children = list())
#'   )))
#'
#'   app$callback(
#'     output(id="dynamic-dropdown-container", "children"),
#'     params = list(
#'       input("dynamic-add-filter", "n_clicks"),
#'       state("dynamic-dropdown-container", "children")
#'     ),
#'     display_dropdown <- function(n_clicks, children){
#'       new_element = htmlDiv(list(
#'         dccDropdown(
#'           id = list("index" = n_clicks, "type" = "dynamic-dropdown"),
#'           options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
#'             list("label" = x, "value" = x)
#'           })
#'         ),
#'         htmlDiv(
#'           id = list("index" = n_clicks, "type" = "dynamic-output"),
#'           children = list()
#'         )
#'       ))
#'
#'       children <- c(children, list(new_element))
#'       return(children)
#'     }
#'   )
#'
#'   app$callback(
#'     output(id = list("index" = MATCH, "type" = "dynamic-output"), property= "children"),
#'     params = list(
#'       input(id=list("index" = MATCH, "type" = "dynamic-dropdown"), property= "value"),
#'       state(id=list("index" = MATCH, "type" = "dynamic-dropdown"), property= "id")
#'     ),
#'     display_output <- function(value, id){
#'       return(htmlDiv(sprintf("Dropdown %s = %s", id$index, value)))
#'     }
#'   )
#'
#'   app$run_server()
#'}
ALL <- as.symbol("ALL")

#' @rdname selectors
#' @export
ALLSMALLER <- as.symbol("ALLSMALLER")

#' @rdname selectors
#' @export
MATCH <- as.symbol("MATCH")


# Dash 2 Syntax Functions

#' Create a Dash application
#'
#' This is a convenience function that returns a [`dash::Dash`] R6 object.
#' For advanced usage, you can use the object as an R6 object directly instead
#' of the functions provided by the `{dash2}` package.
#'
#' @param title _(character)_ The browser window title.
#' @param update_title _(character)_ The browser window title while a callback
#' is being processed. Set to `NULL` or `”"` if you don't want Dash to
#' automatically update the window title.
#' @param assets_folder _(character)_ Path (relative to the current working
#' directory) containing extra files to be served by the browser. All files
#' with ".js" or ".css" extensions will automatically be included on the page,
#' unless excluded with `assets_ignore`. Any other files, such as images, will
#' only be served if explicitly requested.
#' @param assets_url_path _(character)_ URL path for serving assets. For
#' example, a value of "www" means that any request path that begins with
#' "/www" will be mapped to the `assets_folder`. If your assets are hosted
#' online, you can provide a CDN URL, such as "http://your-assets-website".
#' @param assets_ignore _(character)_ Regular expression for ".js" and ".css"
#' files that should not be automatically included. Ignored files will still
#' be served if explicitly requested. Note that you cannot use this to
#' prevent access to sensitive files since ignored files are accessible
#' by users.
#' @param eager_loading _(logical)_ Whether asynchronous resources are
#' prefetched (`TRUE`) or loaded on-demand (`FALSE`).
#' @param serve_locally _(logical)_ Whether to serve HTML dependencies locally
#' or remotely (via URL).
#' @param pathname_url_base _(character)_ Local URL prefix to use app-wide.
#' @param pathname_routes_prefix _(character)_ Prefix applied to the backend
#' routes. Defaults to `pathname_url_base`.
#' @param pathname_requests_prefix _(character)_ Prefix applied to request
#' endpoints made by Dash's front-end. Defaults to `pathname_url_base`.
#' @param compress _(logical)_ Whether to try to compress files and data. If
#' `TRUE`, then `brotli` compression is attempted first, then `gzip`, then the
#' `deflate` algorithm, before falling back to identity.
#' @param suppress_callback_exceptions _(logical)_ Whether to relay warnings
#' about possible layout mis-specifications when registering a callback.
#' @param show_undo_redo _(logical)_ If `TRUE`, the app will have undo and redo
#' buttons for stepping through the history of the app state.
#' @seealso [`run_app()`]
#' @export
dash_app <- function(title = NULL,
                     update_title = "Updating...",
                     assets_folder = "assets",
                     assets_url_path = "/assets",
                     assets_ignore = NULL,
                     eager_loading = FALSE,
                     serve_locally = TRUE,
                     pathname_url_base = "/",
                     pathname_routes_prefix = NULL,
                     pathname_requests_prefix = NULL,
                     compress = TRUE,
                     suppress_callback_exceptions = FALSE,
                     show_undo_redo = FALSE) {

  if (is.null(assets_ignore)) {
    assets_ignore <- ""
  }

  app <- dash::Dash$new(
    assets_folder = assets_folder,
    assets_url_path = assets_url_path,
    assets_ignore = assets_ignore,
    eager_loading = eager_loading,
    serve_locally = serve_locally,
    url_base_pathname = pathname_url_base,
    routes_pathname_prefix = pathname_routes_prefix,
    requests_pathname_prefix = pathname_requests_prefix,
    compress = compress,
    suppress_callback_exceptions = suppress_callback_exceptions,
    show_undo_redo = show_undo_redo,
    update_title = update_title
  )

  if (!is.null(title)) {
    app$title(title)
  }

  invisible(app)
}


#' Add `<meta>` tags to a Dash app
#'
#' @param app A dash application created with [`dash_app()`].
#' @param meta A single meta tag or a list of meta tags. Each meta tag is a
#' named list with two elements representing a meta tag. See examples below.
#' @examples
#' app <- dash_app()
#'
#' # Add a single meta tag
#' app %>% add_meta(list(name = "description", content = "My App"))
#'
#' # Add multiple meta tags
#' app %>% add_meta(list(
#'   list(name = "keywords", content = "dash, analysis, graphs"),
#'   list(name = "viewport", content = "width=device-width, initial-scale=1.0")
#' ))
#' @export
add_meta <- function(app, meta) {
  assert_dash(app)
  if (!is.list(meta[[1]])) {
    meta <- list(meta)
  }
  app$.__enclos_env__$private$meta_tags <- c(app$.__enclos_env__$private$meta_tags, meta)
  invisible(app)
}


#' Add external (CSS) stylesheets to a Dash app
#'
#' @param app A dash application created with [`dash_app()`].
#' @param stylesheet A single stylesheet or a list of stylesheets. Each
#' stylesheet is either a string (the URL), or a named list with `href` (the
#' URL) and any other valid `<link>` tag attributes. See examples below.
#' Note that this is only used to add **external** stylesheets, not local.
#' @examples
#' app <- dash_app()
#'
#' # Add a single stylesheet with URL
#' app %>% add_stylesheet("https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css")
#'
#' # Add multiple stylesheets with URL
#' app %>% add_stylesheet(list(
#'   "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css",
#'   "https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
#' ))
#'
#' # Add a single stylesheet with a list
#' app %>% add_stylesheet(
#'   list(
#'     href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css",
#'     integrity = "sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
#'   )
#' )
#'
#' # Add multiple stylesheets with both URL and list
#' app %>% add_stylesheet(
#'   list(
#'     "https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css",
#'     "https://fonts.googleapis.com/css?family=Lora",
#'     list(
#'       href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css",
#'       integrity = "sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
#'     )
#'   )
#' )
#' @export
add_stylesheet <- function(app, stylesheet) {
  assert_dash(app)
  if (!is.list(stylesheet) || !is.null(names(stylesheet))) {
    stylesheet <- list(stylesheet)
  }
  app$.__enclos_env__$self$config$external_stylesheets <- c(app$.__enclos_env__$self$config$external_stylesheets, stylesheet)
  invisible(app)
}


#' Add external (JavaScript) scripts to a Dash app
#'
#' @param app A dash application created with [`dash_app()`]
#' @param script A single script or a list of scripts. Each script is either
#' a string (the URL), or a named list with `src` (the URL) and any other valid
#' `<script>` tag attributes. See examples below.
#' Note that this is only used to add **external** scripts, not local.
#' @examples
#' app <- dash_app()
#'
#' # Add a single script with URL
#' app %>% add_script("https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js")
#'
#' # Add multiple scripts with URL
#' app %>% add_script(list(
#'   "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js",
#'   "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
#' ))
#'
#' # Add a single script with a list
#' app %>% add_script(
#'   list(
#'     href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js",
#'     integrity = "sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
#'   )
#' )
#'
#' # Add multiple scripts with both URL and list
#' app %>% add_script(
#'   list(
#'     "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js",
#'     "https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js",
#'     list(
#'       href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js",
#'       integrity = "sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
#'     )
#'   )
#' )
#' @export
add_script <- function(app, script) {
  assert_dash(app)
  if (!is.list(script) || !is.null(names(script))) {
    script <- list(script)
  }
  app$.__enclos_env__$self$config$external_scripts <- c(app$.__enclos_env__$self$config$external_scripts, script)
  invisible(app)
}

#' Set the layout of a Dash app
#' @param app A dash application created with [`dash_app()`]
#' @param ... Dash components to create the user interface, provided either as
#' comma-separated components or a list of components. You can also provide a
#' function returning a Dash component if you want the layout to re-render on
#' every page load.
#'
#' @examples
#' app <- dash_app()
#'
#' app %>% set_layout("hello", "Dash")
#' app %>% set_layout(htmlDiv("hello"), "Dash")
#' app %>% set_layout(list(htmlDiv("hello"), "Dash"))
#' app %>% set_layout(htmlDiv(children = list(htmlDiv("hello"), "Dash")))
#' app %>% set_layout(function() { htmlDiv(children = list(htmlDiv("hello"), "Dash")) })
#' @export
set_layout <- function(app, ...) {
  assert_dash(app)

  tags <- list(...)
  if (length(tags) > 0 && !is.null(names(tags))) {
    stop("dash2: layout cannot have any named parameters")
  }
  if (length(tags) == 1) {
    if (is.function(tags[[1]])) {
      layout <- tags[[1]]
    } else {
      layout <- componentify(tags[[1]])
    }
  } else {
    layout <- componentify(tags)
  }

  app$layout(layout)
  invisible(app)
}

#' Run a Dash app
#' @param app A dash application created with [`dash_app()`]
#' @param host Hostname to run the app.
#' @param port Port number to run the app.
#' @param browser Whether or not to launch a browser to the app's URL.
#' @export
run_app <- function(app,
                    host = Sys.getenv("DASH_HOST", Sys.getenv("HOST", "127.0.0.1")),
                    port = Sys.getenv("DASH_PORT", Sys.getenv("PORT", 8050)),
                    browser = interactive()) {
  assert_dash(app)
  if (browser) {
    url <- paste0(host, ":", port)
    if (!grepl("^(http|https)://", host)) {
      url <- paste0("http://", url)
    }
    utils::browseURL(url)
  }
  app$run_server(host = host, port = port)
}
