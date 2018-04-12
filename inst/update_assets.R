# Grab all CSS files from https://github.com/plotly/dash-app-stylesheets
contents <- gh::gh("/repos/plotly/dash-app-stylesheets/contents")
files <- sapply(contents, "[[", "path")
download.file(
  paste0("https://raw.githubusercontent.com/plotly/dash-app-stylesheets/master/", files),
  paste0("inst/lib/dash-app-stylesheets/", sub("^dash-", "", files))
)


# now, grab js/css dependencies for running dash-renderer
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

#> Name                     Type      Size            Last Modified
#> 1                                 ..                        -         -                        -
#> 2                        __init__.py application/octet-stream   2.56 kB 2018-03-29T02:22:26.000Z
#> 3                          bundle.js   application/javascript 299.67 kB 2018-03-30T16:00:04.000Z
#> 4                      bundle.js.map         application/json   1.27 MB 2018-02-01T20:40:39.000Z
#> 5            react-dom@15.4.2.min.js   application/javascript 123.89 kB 2017-03-08T21:59:34.000Z
#> 6 react-dom@16.2.0.production.min.js   application/javascript   94.5 kB 2018-03-29T02:22:26.000Z
#> 7                react@15.4.2.min.js   application/javascript   21.2 kB 2017-03-08T21:59:10.000Z
#> 8     react@16.2.0.production.min.js   application/javascript   6.62 kB 2018-03-29T02:22:26.000Z
#> 9                         version.py application/octet-stream      23 B 2018-03-29T18:28:16.000Z

# get the relevant versions of react/react-dom
# TODO: for now we're getting the 'production' version, but should
# add support for specifying a supported version -- https://github.com/plotly/dash-renderer/blob/master/CHANGELOG.md#0120---2018-03-28
#react <- sub(".production.min.js", "", grep("^react@.*production.min.js", tblDashRenderer$Name, value = T))
#reactdom <- sub(".production.min.js", "", grep("^react-dom@.*production.min.js", tblDashRenderer$Name, value = T))

# important that we download these separately since component bundles
# need to be inserted between react and the renderer
# https://github.com/plotly/dash/blob/4c19dd18/dash/dash.py#L234-L239
React <- download_files("react@15.4.2", "dist/react.min.js")
ReactDom <- download_files("react-dom@15.4.2", "dist/react-dom.min.js")
# of course, there is a different path to the bundle :face_with_rolling_eyes:
# https://github.com/plotly/dash-renderer/blob/master/dash_renderer/__init__.py#L30
ReactProd <- download_files("react@16.2.0", "umd/react.production.min.js")
ReactDomProd <- download_files("react-dom@16.2.0", "umd/react-dom.production.min.js")
DashRenderer <- download_files("dash-renderer", "dash_renderer/bundle.js")

# collect all the dependencies
depList <- list(
  react = React,
  `react-prod` = ReactProd,
  `react-dom` = ReactDom,
  `react-dom-prod` = ReactDomProd,
  `dash-renderer` = DashRenderer
)

# we don't know the full path yet...
deps <- lapply(depList, function(d) {
  d$package <- "dashR"
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
#         package = "dashR"
#       )
#     } else {
#       htmltools::htmlDependency(
#         name = info[[1]],
#         script = htmltools::urlEncodePath(x$name),
#         version = strextract(info[[2]], .standard_regexps()$valid_package_version),
#         src = "lib",
#         package = "dashR"
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
#     package = "dashR"
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
