# R version of second example on https://plot.ly/dash/urls
library(dasher)

app <- Dash$new()
app$layout_set(
  # represents the URL bar, doesn't render anything
  coreLocation('url', refresh = FALSE),
  # content will be rendered in this element
  htmlDiv(id = 'page-content')
)

# The 'home' page with links to other locations
index_page <- htmlDiv(
  htmlH2("Welcome, pick a page!"),
  coreLink('Go to Page 1', href = '/page-1'),
  htmlBr(),
  coreLink('Go to Page 2', href = '/page-2')
)

# ui definition when visiting /page-1
page1 <- htmlDiv(
  htmlH1('Page 1'),
  coreDropdown(
    id = 'page-1-dropdown',
    options = c('LA', 'NYC', 'MTL'),
    value = 'LA'
  ),
  htmlDiv(id = 'page-1-content'),
  htmlBr(),
  coreLink('Go to Page 2', href = '/page-2'),
  htmlBr(),
  coreLink('Go back to home', href = '/')
)

# ui definition when visiting /page-2
page2 <- htmlDiv(
  htmlH1('Page 2'),
  coreRadioItems(
    id = 'page-2-radios',
    options = c('Orange', 'Blue', 'Red'),
    value = 'Orange'
  ),
  htmlDiv(id = 'page-2-content'),
  htmlBr(),
  coreLink('Go to Page 1', href = '/page-1'),
  htmlBr(),
  coreLink('Go back to home', href = '/')
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
    if ('/page-1' == pathname) page1 else if ('/page-2' == pathname) page2 else index_page
  }, output('page-content')
)

app$dependencies_set(dash_css())
app
