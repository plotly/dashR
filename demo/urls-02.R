# R version of second example on https://plot.ly/dash/urls
library(dasher)

app <- Dash$new()
app$layout_set(
  # represents the URL bar, doesn't render anything
  core_location('url', refresh = FALSE),
  # content will be rendered in this element
  html_div(id = 'page-content')
)

# The 'home' page with links to other locations
index_page <- html_div(
  html_h2("Welcome, pick a page!"),
  core_link('Go to Page 1', href = '/page-1'),
  html_br(),
  core_link('Go to Page 2', href = '/page-2')
)

# ui definition when visiting /page-1
page_1_layout <- html_div(
  html_h1('Page 1'),
  core_dropdown(
    id = 'page-1-dropdown',
    options = lapply(c('LA', 'NYC', 'MTL'), function(i) list(label = i, value = i)),
    value = 'LA'
  ),
  html_div(id = 'page-1-content'),
  html_br(),
  core_link('Go to Page 2', href = '/page-2'),
  html_br(),
  core_link('Go back to home', href = '/')
)

# ui definition when visiting /page-2
page_2_layout <- html_div(
  html_h1('Page 2'),
  core_radioitems(
    id = 'page-2-radios',
    options = lapply(c('Orange', 'Blue', 'Red'), function(i) list(label = i, value = i)),
    value = 'Orange'
  ),
  html_div(id = 'page-2-content'),
  html_br(),
  core_link('Go to Page 1', href = '/page-1'),
  html_br(),
  core_link('Go back to home', href = '/')
)

app$callback(
  function(value = input('page-1-dropdown')) {
    sprintf('You have selected "%s"', value)
  }, output('page-1-content')
)

app$callback(
  function(value = input('page-2-radios')) {
    sprintf('You have selected "%s"', value)
  }, output('page-2-content')
)

app$callback(
  function(pathname = input('url', 'pathname')) {
    if ('/page-1' == pathname) page_1_layout else if ('/page-2' == pathname) page_2_layout else index_page
  }, output('page-content')
)

app$dependencies_set(dash_css())
app$run_server(showcase = TRUE)
