# Dash 1.0 Layout Wrapper Functions (adapted from https://github.com/daattali/dash2)

#' Create a Dash application
#'
#' This is a convenience function that returns a [`Dash`] R6 object.
#' For advanced usage, you can use the object as an R6 object directly instead
#' of the functions provided by the `{dash}` package.
#'
#' @param title _(character)_ The browser window title.
#' @param update_title _(character)_ The browser window title while a callback
#' is being processed. Set to `NULL` or `""` if you don't want Dash to
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

  app <- Dash$new(
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
#' app %>% set_layout(div("hello"), "Dash")
#' app %>% set_layout(list(div("hello"), "Dash"))
#' app %>% set_layout("Conditional UI using an if statement: ",
#'                    if (TRUE) "rendered",
#'                    if (FALSE) "not rendered")
#' app %>% set_layout(function() { div("Current time: ", Sys.time()) })
#' @export
set_layout <- function(app, ...) {
  assert_dash(app)

  tags <- list(...)
  if (length(tags) > 0 && !is.null(names(tags))) {
    stop("Dash: layout cannot have any named parameters")
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

#' Run a Dash app when explicitly printed to the console
#' @export
#' @keywords internal
print.Dash <- function(x, ...) {
  run_app(x)
}
