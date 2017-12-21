library(dasher)

layout <- htmlDiv(
  htmlH3('App 2'),
  coreDropdown(
    id = 'app-2-dropdown',
    options = paste('App 2 -', c('NYC', 'MTL', 'LA'))
  ),
  htmlDiv(id = 'app-2-display-value'),
  coreLink('Go to App 1', href = '/apps/app1')
)

# Use modules to get a python-like import `from app import app`
# devtools::install_github('klmr/modules')
modules::import("app", attach = "app")

app$callback(
  function(value = input('app-2-dropdown')) {
    paste('You have selected', value)
  }, output('app-2-display-value')
)
