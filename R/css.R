#' Dash app stylesheets
#'
#' Use the 'official' Dash stylesheet in your dasher applications
#' <https://github.com/plotly/dash-app-stylesheets>.
#'
#' @param filenames css filenames to use
#' @export
#' @example inst/tutorial/examples/style-dash-css.R
#' @md
#'


# For better performance, consider placing CSS in the <head> of the HTML
# document (via app$dependencies_set(), which automatically places css in <head>)
dash_css <- function(filenames = "docs-base") {

  cssDir <- system.file("lib", "dash-app-stylesheets", package = "dasher")
  cssNames <- sub("\\.css$", "", list.files(cssDir))
  missingFiles <- setdiff(filenames, cssNames)
  if (length(missingFiles)) {
    stop(
      sprint(
        "Couldn't find the css file(s) named: '%s' \n\n",
        paste(missingFiles, collapse = "', '")
      ),
      "Valid file names are: '%s'",
      paste(cssNames, collapse = "', '"),
      call. = FALSE
    )
  }

  htmltools::htmlDependency(
    name = "dash-app-stylesheets",
    version = "1.0.0",
    package = "dasher",
    src = c(
      href = "https://cdn.rawgit.com/plotly/dash-app-stylesheets/master/",
      file = "lib/dash-app-stylesheets"
    ),
    stylesheet = paste0(filenames, ".css"),
    all_files = FALSE
  )
}
