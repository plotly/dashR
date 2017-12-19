# R version of first example on https://plot.ly/dash/urls
library(dasher)

app <- Dash$new()
app$layout_set(
  # represents the URL bar, doesn't render anything
  coreLocation('url', refresh = FALSE),

  coreLink('Navigate to "/"', href = '/'),
  htmlBr(),
  coreLink('Navigate to "/page-2"', href = '/page-2'),

  # content will be rendered in this element
  htmlDiv(id = 'page-content')
)

app$callback(
  function(pathname = input("url", "pathname")) {
    htmlH3(paste("You are on page", pathname))
  },
  output("page-content")
)

app$dependencies_set(dash_css())
app
