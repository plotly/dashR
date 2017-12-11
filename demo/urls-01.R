# first example of https://plot.ly/dash/urls
library(dasher)

app <- Dash$new()
app$layout_set(
  # represents the URL bar, doesn't render anything
  core_location('url', refresh = FALSE),

  core_link('Navigate to "/"', href = '/'),
  html_br(),
  core_link('Navigate to "/page-2"', href = '/page-2'),

  # content will be rendered in this element
  html_div(id = 'page-content')
)

app$callback(
  function(pathname = input("url", "pathname")) {
    html_h3(paste("You are on page", pathname))
  },
  output("page-content")
)

app$dependencies_set(dash_css())

app$run_server(showcase = TRUE)
