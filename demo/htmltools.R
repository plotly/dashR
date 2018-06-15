# Example of using htmltools::tags in a dasher app -- based on demo/urls.R
library(dashR)
library(htmltools)

app <- Dash$new()
app$layout_set(
  # represents the URL bar, doesn't render anything
  coreLocation('url', refresh = FALSE),

  tags$link('Navigate to "/"', href = '/'),
  tags$br(),
  tags$link('Navigate to "/page-2"', href = '/page-2'),

  # content will be rendered in this element
  htmlDiv(id = "container", "A simple container div", tags$div(id = 'page-content'))
)

app$callback(
  function(pathname = input("url", "pathname")) {
    htmlH3(paste("You are on page", pathname))
  },
  output("page-content")
)

app$dependencies_set(dash_css())
app$run_server(showcase = TRUE)
