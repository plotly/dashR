library(dasher)
library(htmltools)

# make sure we're using the tutorial directory as the working directory
setwd(here::here("inst", "tutorial"))

# import layout_get(), etc.
source("tools.R")

chapters <- list(
  `/dasher/` = layout_get("home.R"),
  `/dasher/introduction` = layout_get("introduction.R"),
  `/dasher/installation` = layout_get("installation.R"),
  `/dasher/getting-started` = layout_get("getting-started-part-1.R"),
  `/dasher/getting-started-part-2` = layout_get("getting-started-part-2.R"),
  `/dasher/state` = layout_get("state.R"),
  `/dasher/interactive-graphing` = layout_get("graphing.R"),
  `/dasher/sharing-data-between-callbacks` = layout_get("sharing-state.R"),
  `/dasher/dash-core-components` = layout_get("core-components.R"),
  `/dasher/dash-html-components` = layout_get("html-components.R"),
  `/dasher/external-resources` = layout_get("external-css-and-js.R"),
  #`/dasher/plugins` =
  #`/dasher/gallery` =
  #`/dasher/live-updates` =
  #`/dasher/performance` =
  `/dasher/urls` = layout_get("urls.R")
  #`/dasher/deployment` =
  #`/dasher/deployment/on-premise` =
  #`/dasher/authentication` =
  #`/dasher/support` =
)

coreDir <- here::here("inst", "tutorial", "examples", "core_components")
for (i in dir(coreDir)) {
  nm <- paste0("/dasher/dash-core-components/", i)
  chapters[[nm]] <- layout_get(i, coreDir)
}

logo <- htmlImg(
  src = 'https://cdn.rawgit.com/plotly/dash-docs/b1178b4e/images/dash-logo-stripe.svg',
  className = 'logo'
)

links <- htmlDiv(
  className = 'links',
  htmlA('pricing', className = 'link', href = 'https://plot.ly/products/on-premise'),
  htmlA('workshops', className = 'link', href = 'https://plotcon.plot.ly/workshops'),
  htmlA('user guide', className = 'link active', href = 'https://plot.ly/dash/'),
  htmlA('plotly', className = 'link', href = 'https://plot.ly/')
)

header <- htmlDiv(
  className = 'header',
  htmlDiv(
    className = 'container-width',
    style = list(height = '100%'),
    htmlA(logo, href = 'https://plot.ly/products/dash', className = 'logo-link'),
    links
  )
)

title <- 'Dash User Guide and Documentation - Dash by Plotly'



home <- htmlDiv(
  htmlLink(
    rel = 'stylesheet',
    href = 'https://fonts.googleapis.com/css?family=Dosis'
  ),
  htmlScript(
    type = 'text/javascript',
    src = "https://cdn.rawgit.com/chriddyp/ca0d8f02a1659981a0ea7f013a378bbd/raw/e79f3f789517deec58f41251f7dbb6bee72c44ab/plotly_ga.js"
  ),
  htmlMeta(name = 'viewport', content = 'width=device-width, initial-scale=1.0'),
  htmlMeta(
    name = 'description',
    content = 'Dasher User Guide and Documentation. Dasher is a R framework for building reactive web apps developed by Plotly.'
  ),
  header,
  htmlDiv(
    className = 'background',
    htmlDiv(
      className = 'container-width',
      htmlDiv(
        className = 'content-container',
        htmlDiv(
          className = 'content',
          id = 'chapter'
        )
      )
    )
  ),
  coreLocation(id = 'location', refresh = FALSE)#,
  # TODO: what is this for???
  #htmlDiv(DataTable(), style = list(display = 'none'))
)

# TODO: `url_base_pathname` doesn't seem to be working?
app <- Dash$new(url_base_pathname = "/dasher/")
app$layout_set(home)


app$callback(
  function(pathname = input('location', 'pathname')) {
    if (!length(pathname)) return('')
    # remove trailing slash from pathname
    if (!identical(pathname, '/')) pathname <- sub("/$", "", pathname)

    # if the pathname matches a chapter, display it, otherwise homepage
    if (isTRUE(pathname %in% names(chapters))) {
      return(htmlDiv(
        htmlDiv(chapters[[pathname]]),
        htmlHr(),
        coreLink(htmlA('Back to the Table of Contents'), href = '/dasher/')
      ))
    }

    # the home page
    chapters[[1]]

  }, output('chapter', 'children')
)

app$dependencies_set(dash_css(c("docs-base", "docs-custom")))
app$run_server(showcase = TRUE)
