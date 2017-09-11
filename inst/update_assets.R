# devtools::install_github('cpsievert/runpkg')
library(runpkg)
options(runpkg.path = here::here("inst", "lib"))

# ------------------------------------------------------------------------
# dash-html-components (easy, no extras!)
# ------------------------------------------------------------------------

(tblHTML <- ls_("dash-html-components", "dash_html_components"))
DashHTML <- download_files("dash-html-components", "dash_html_components/bundle.js")

# ------------------------------------------------------------------------
# dash-renderer (harder, react/react-dom is an extra?)
# ------------------------------------------------------------------------

# dash-renderer bundles react/react-dom, but I want to keep it separate so
# we have more control over dependency ordering
(tblDashRenderer <- ls_("dash-renderer", "dash_renderer"))

# get the relevant versions of react/react-dom
react <- sub(".js|.min.js", "", grep("^react@", tblDashRenderer$Name, value = T))
reactdom <- sub(".js|.min.js", "", grep("^react-dom@", tblDashRenderer$Name, value = T))

# download
React <- download_files(react, "dist/react.min.js")
ReactDom <- download_files(reactdom, "dist/react-dom.min.js")
DashRenderer <- download_files("dash-renderer", "dash_renderer/bundle.js")

# ------------------------------------------------------------------------
# dash-core-components (many extras)
# ------------------------------------------------------------------------

(tblCore <- ls_("dash-core-components", "dash_core_components"))

RCSlider <- download_files("dash-core-components", "dash_core_components/rc-slider@6.1.2.css")
ReactDates <- download_files("dash-core-components", "dash_core_components/rc-slider@6.1.2.css")
ReactSelect <- download_files("dash-core-components", "dash_core_components/react-select@1.0.0-rc.3.min.css")
ReactVSelect <- download_files("dash-core-components", "dash_core_components/react-virtualized-select@3.1.0.css")
ReactV <- download_files("dash-core-components", "dash_core_components/react-virtualized@9.9.0.css")

# since these are different dependencies over-ride the default 'dash-core-components'
RCSlider$name <- "RCSlider"
ReactDates$name <- "ReactDates"
ReactSelect$name <- "ReactSelect"
ReactVSelect$name <- "ReactVSelect"
ReactV$name <- "ReactV"


# TODO: download these from repos or just provide a helper to create dependencies from the included files?
DashCore <- download_files("dash-core-components", "dash_core_components/bundle.js")

# collect all the dependencies
depList <- list(
  react = React,
  `react-dom` = ReactDom,
  `dash-html-components` = DashHTML,
  `dash-core-components` = RCSlider,
  `dash-core-components` = ReactDates,
  `dash-core-components` = ReactSelect,
  `dash-core-components` = ReactVSelect,
  `dash-core-components` = ReactV,
  `dash-core-components` = DashCore,
  `dash-htmlwidget-components` = htmltools::htmlDependency(
    name = "htmlwidgets-react",
    version = packageVersion("dasher"),
    package = "dasher",
    src = c(file = here::here("inst", "lib")),
    script = "htmlwidgets-react.js"
  ),
  `dash-renderer` = DashRenderer
)

# we don't know the full path yet...
depList <- lapply(depList, function(d) {
  d$package <- "dasher"
  d$src$file <- htmltools:::relativeTo(here::here("inst"), d$src$file)
  d
})

deps <- dasher:::dependency_tbl(
  depList, section = "footer",
  priority = seq(9001, 9000 + length(depList))
)

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
