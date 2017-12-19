# Assets from dash-docs (for rendering tutorial site)
docsCSS  <- c(
  "inst/css/base.css",
  "inst/css/custom.css"
)
download.file(
  paste0("https://raw.githubusercontent.com/plotly/dash-docs/master/css/", basename(docsCSS)), docsCSS
)


# The Dash stylesheet (not on npm)
# note: if this updates, update dash_css() as well
dashCSS <- c(
  "inst/lib/dash-css/bWLwgP.css",
  "inst/lib/dash-css/LLYbXR.css"
)
download.file(
  paste0("https://codepen.io/chriddyp/pen/", basename(dashCSS)), dashCSS
)




# devtools::install_github('cpsievert/runpkg')
library(runpkg)
options(
  runpkg.path = here::here("inst", "lib"),
  htmltools.dir.version = FALSE
)

# ------------------------------------------------------------------------
# dash-renderer (harder, react/react-dom is an extra?)
# ------------------------------------------------------------------------

# dash-renderer bundles react/react-dom, but I want to keep it separate so
# we have more control over dependency ordering
(tblDashRenderer <- ls_("dash-renderer", "dash_renderer"))

# get the relevant versions of react/react-dom
react <- sub(".js|.min.js", "", grep("^react@", tblDashRenderer$Name, value = T))
reactdom <- sub(".js|.min.js", "", grep("^react-dom@", tblDashRenderer$Name, value = T))

# important that we download these separately since component bundles
# need to be inserted between react and the renderer
# https://github.com/plotly/dash/blob/4c19dd18/dash/dash.py#L234-L239
React <- download_files(react, "dist/react.min.js")
ReactDom <- download_files(reactdom, "dist/react-dom.min.js")
DashRenderer <- download_files("dash-renderer", "dash_renderer/bundle.js")

# collect all the dependencies
depList <- list(
  react = React,
  `react-dom` = ReactDom,
  `dash-renderer` = DashRenderer
)

# we don't know the full path yet...
deps <- lapply(depList, function(d) {
  d$package <- "dasher"
  d$src$file <- htmltools:::relativeTo(here::here("inst"), d$src$file)
  d
})

devtools::use_data(deps, overwrite = T, internal = T)



# ------------------------------------------------------------------------
# old code
# ------------------------------------------------------------------------

#
# # This script dynamically generates dependencies that all dash apps depend on
# library(gh)
#
# # ------------------------------------------------------------------------
# # download dependencies for the core components
# # ------------------------------------------------------------------------
#
# core_contents <- gh(
#   "/repos/plotly/dash-core-components/contents/dash_core_components"
# )
#
# # reusable function to filter "folder contents" down to the dependencies of interest
# #
# # for now, it seems reasonable to assume that, if a '@' appears in the filename,
# # it is a dependencies we want to include (I don't think we need plotly.js)
# filter_contents <- function(contents) {
#   paths <- sapply(contents, `[[`, "path")
#   idx <- lengths(strsplit(paths, "@")) > 1
#   contents[idx]
# }
#
# # reusable function to download contents
# download_contents <- function(contents) {
#   res <- Map(
#     download.file,
#     sapply(contents, `[[`, "download_url"),
#     file.path("inst", "lib", "dash-cor" sapply(contents, `[[`, "name"))
#   )
#   invisible(res)
# }
#
# core_deps <- filter_contents(core_contents)
# download_contents(core_deps)
#
#
# # These repos don't currently currently host a `dist/` folder with the official bundle,
# # but we can get the latest version from package.json, then download from https://unpkg.com
# #
# # TODO: leverage official release process? https://github.com/plotly/dash-renderer/issues/15
#
# # grab package.json for a plotly repo
# config_npm <- function(repo) {
#   jsonlite::fromJSON(
#     sprintf("https://raw.githubusercontent.com/plotly/%s/master/package.json", repo)
#   )
# }
#
# # download file(s) from npm via https://unpkg.com
# # format is https://unpkg.com/package@version/file
# download_npm <- function(config, filename) {
#   url <- sprintf(
#     'https://unpkg.com/%s@%s/%s',
#     config$name, config$version, filename
#   )
#   # attach a path to the config allowing us to find the bundle location at a later point
#   config$bundle <- file.path("lib", config$name, paste0(config$name, "@", basename(filename)))
#   download.file(url, file.path("inst", config$bundle))
#   invisible(config)
# }
#
# core_config <- config_npm("dash-core-components")
# core_config <- download_npm(core_config, "dash_core_components/bundle.js")
#
# # ------------------------------------------------------------------------
# # html components
# # ------------------------------------------------------------------------
#
# html_config <- config_npm("dash-html-components")
# html_config <- download_npm(html_config, "dash_html_components/bundle.js")
#
#
# # ------------------------------------------------------------------------
# # "dash front end"
# # ------------------------------------------------------------------------
#
# renderer_contents <- gh("/repos/plotly/dash-renderer/contents/dash_renderer")
# renderer_deps <- filter_contents(renderer_contents)
# download_contents(renderer_deps)
#
# # and the actual dash renderer
# renderer_config <- config_npm("dash-renderer")
# renderer_config <- download_npm(renderer_config, "dash_renderer/bundle.js")
#
#
# # ------------------------------------------------------------------------
# # finally, create & store HTML dependencies for easy access inside package
# # ------------------------------------------------------------------------
#
# # reusable function to create html dependencies from file contents
# htmlify_contents <- function(contents) {
#   lapply(contents, function(x) {
#     info <- strsplit(x$name, "@")[[1]]
#     is_css <- grepl("css$", info[[2]])
#     if (is_css) {
#       htmltools::htmlDependency(
#         name = info[[1]],
#         # NOTE that '@' in filenames messes with htmltools::copyDependencyToDir
#         stylesheet = htmltools::urlEncodePath(x$name),
#         version = strextract(info[[2]], .standard_regexps()$valid_package_version),
#         src = "lib",
#         package = "dasher"
#       )
#     } else {
#       htmltools::htmlDependency(
#         name = info[[1]],
#         script = htmltools::urlEncodePath(x$name),
#         version = strextract(info[[2]], .standard_regexps()$valid_package_version),
#         src = "lib",
#         package = "dasher"
#       )
#     }
#   })
# }
#
# htmlify_config <- function(config) {
#   htmltools::htmlDependency(
#     name = config$name,
#     script = htmltools::urlEncodePath(basename(config$bundle)),
#     version = config$version,
#     src = "lib",
#     package = "dasher"
#   )
# }
#
#
# content_deps <- htmlify_contents(c(
#   core_deps,
#   renderer_deps
# ))
#
# config_deps <- lapply(
#   list(core_config, html_config, renderer_config), htmlify_config
# )
#
# deps <- c(content_deps, config_deps)
# # use names for easy querying
# deps <- setNames(deps, sapply(deps, "[[", "name"))
# devtools::use_data(deps, overwrite = T, internal = T)
#
