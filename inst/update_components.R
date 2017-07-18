# This script dynamically generates exported functions (and documentation)
# from dash's component metadata

library(jsonlite)
library(glue)

core <- fromJSON(
  "https://raw.githubusercontent.com/plotly/dash-core-components/master/dash_core_components/metadata.json"
)

html <- fromJSON(
  "https://raw.githubusercontent.com/plotly/dash-html-components/master/lib/metadata.json"
)


# remove line-breaks from strings
rm_linebreaks <- function(x) gsub("\n", " ", x, fixed = TRUE)
core <- rapply(core, rm_linebreaks, classes = "character", how = "replace")
html <- rapply(html, rm_linebreaks, classes = "character", how = "replace")

# helper to get the actual name of the component from a component's filename
component_name <- function(x) {
  tolower(strsplit(basename(x), "\\.")[[1]][1])
}

# delete the current component definitions
unlink("R/components.R")

# auto-generate roxygen documentation and exported function for each *core* component
for (i in seq_along(core)) {
  component <- core[[i]]
  componentName <- component_name(names(core)[[i]])
  props <- component$props
  header <- glue(
    "#' {title} component {linebreak}#' {description} {linebreak}#' {linebreak}#' @export",
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

    *{name}* <- function(*{params}* = NULL) {
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

  cat(header, file = "R/components.R", append = TRUE)
  cat(body, file = "R/components.R", append = TRUE)
  cat(func, file = "R/components.R", append = TRUE)
}

