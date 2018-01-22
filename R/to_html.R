# the R version of https://github.com/plotly/dash-html-components/blob/a4901feb/dash_html_components/_to_html5.py

.VOID_ELEMENTS <- function() {
  c('area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'keygen',
  'link', 'meta', 'param', 'source', 'track', 'wbr')
}

.CAMELCASE_REGEX = function() '([a-z0-9])([A-Z])'

.camel_case_to_css_case <- function(name) {
  tolower(gsub(.CAMELCASE_REGEX(), "\\1-\\2", name))
}

.attribute <- function(name, value) {
  if (identical('className', name))
    return(c('class', value))

  # Dash CSS is camelCased but CSS is hyphenated
  # convert e.g. fontColor to font-color
  if (identical('style', name)) {
    value <- .camel_case_to_css_case(value)
    inline_style <- paste(paste0(name, ": ", value), collapse = "; ")
    return(c(name, inline_style))
  }

  c(name, value)
}

.to_html5 <- function(component) {
  if (!is.component(component)) {
    return(as.character(component))
  }

  component_type <- tolower(component[["type"]])

  if (!component_type %in% .VOID_ELEMENTS()) {
    children <- component[["props"]][["children"]] %||% ""
    lapply(children, .to_html5)
  }

  # TODO: do the rest!
}

