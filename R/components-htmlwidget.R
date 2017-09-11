#' Htmlwidget component
#'
#'
#'
#' @param id a string used for the react container (around the htmlwidget container).
#' @param name the name of the htmlwidget
#' @param package the htmlwidget's package name
#'
#' @export
#' @author Carson Sievert
#'
htmlwidget <- function(id = NULL, name = NULL, package = name) {

  if (is.null(id)) {
    stop("`id` is required", call. = FALSE)
  }

  component <- list(
    # TODO: do we need style/className?
    props = list(
      id = id
    ),
    type = "Htmlwidget",
    namespace = "dash_html_components",
    # should help throw an informative error for us (if the package/widget doesn't exist)
    htmlwidgetInfo = list(name = name, package = package)
  )

  structure(component, class = c('dash_component', 'dash_htmlwidget'))
}



