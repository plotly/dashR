# This script dynamically generates exported functions (and documentation)
# from dash's component metadata

library(jsonlite)
library(glue)

# -----------------------------------------------------------------------------
# First, handle the core components
# -----------------------------------------------------------------------------

core <- fromJSON(
  "https://raw.githubusercontent.com/plotly/dash-core-components/master/dash_core_components/metadata.json"
)

# remove line-breaks from strings
rm_linebreaks <- function(x) gsub("\n", " ", x, fixed = TRUE)
core <- rapply(core, rm_linebreaks, classes = "character", how = "replace")

# helper to get the actual name of the component from a component's filename
component_name <- function(x) {
  tolower(strsplit(basename(x), "\\.")[[1]][1])
}

# delete the current component definitions
unlink("R/core_components.R")

# auto-generate roxygen documentation and exported function for each *core* component
for (i in seq_along(core)) {
  component <- core[[i]]
  componentName <- component_name(names(core)[[i]])
  props <- component$props
  header <- glue(
    "#' {title} component {linebreak}#' @description {description} {linebreak}#' {linebreak}#' @export",
    title = componentName,
    description = component$description,
    linebreak = "\n"
  )
  body <- glue(
    "{linebreak}#' @param {name} {description} {required}",
    name = names(props),
    description = lapply(props, "[[", "description"),
    required = ifelse(sapply(props, "[[", "required"), "(required)", ""),
    linebreak = "\n"
  )
  # TODO: automatic argument value checking?
  func <- glue(
    "

    core_*{name}* <- function(*{params}* = NULL) {
       structure(
         list(*{params2}*),
         class = c('component', 'core', '*{name}*')
       )
    }

    ",
    name = componentName,
    params = paste(names(props), collapse = " = NULL, "),
    params2 = paste(names(props), names(props), sep = "=", collapse = ", "),
    .open = "*{", .close = "}*"
  )

  cat(header, file = "R/core_components.R", append = TRUE)
  cat(body, file = "R/core_components.R", append = TRUE)
  cat(func, file = "R/core_components.R", append = TRUE)
}


# -----------------------------------------------------------------------------
# Now the HTML components
# -----------------------------------------------------------------------------

html <- fromJSON(
  "https://raw.githubusercontent.com/plotly/dash-html-components/master/lib/metadata.json"
)

html <- rapply(html, rm_linebreaks, classes = "character", how = "replace")

# delete the current component definitions
unlink("R/html_components.R")


# auto-generate roxygen documentation and exported function for each *core* component
for (i in seq_along(html)) {
  component <- html[[i]]
  componentName <- component_name(names(html)[[i]])
  props <- component$props
  header <- glue(
    "#' {title} component {linebreak}#' @description {description} {linebreak}#' {linebreak}#' @export",
    title = componentName,
    description = component$description,
    linebreak = "\n"
  )
  body <- glue(
    "{linebreak}#' @param {name} {description} {required}",
    name = names(props),
    description = lapply(props, "[[", "description"),
    required = ifelse(sapply(props, "[[", "required"), "(required)", ""),
    linebreak = "\n"
  )
  # TODO: automatic argument value checking?
  func <- glue(
    "

    html_*{name}* <- function(*{params}* = NULL) {
    structure(
    list(*{params2}*),
    class = c('component', 'html', '*{name}*')
    )
    }

    ",
    name = componentName,
    params = paste(names(props), collapse = " = NULL, "),
    params2 = paste(names(props), names(props), sep = "=", collapse = ", "),
    .open = "*{", .close = "}*"
  )

  cat(header, file = "R/html_components.R", append = TRUE)
  cat(body, file = "R/html_components.R", append = TRUE)
  cat(func, file = "R/html_components.R", append = TRUE)
}
