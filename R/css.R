#' Dash stylesheets
#'
#' Use the 'official' Dash stylesheet in your dasher applications
#' \url{https://codepen.io/chriddyp/pen/bWLwgP}.
#'
#' @param external whether or not to use a local file.
#' @export
#' @example demo/intro-style.R


# For better performance, consider placing CSS in the <head> of the HTML
# document (via app$dependencies_set(), which automatically places css in <head>)
dash_css <- function(name = "bWLwgP") {
  htmltools::htmlDependency(
    name = "dash-css",
    version = "1.0.0",
    package = "dasher",
    src = c(
      href = "https://codepen.io/chriddyp/pen",
      file = "lib/dash-css"
    ),
    stylesheet = paste0(name, ".css"),
    all_files = FALSE
  )
}
