library(dashR)

layout <- htmlDiv(
  htmlH3('App 1'),
  coreDropdown(
    id = 'app-1-dropdown',
    options = paste('App 1 -', c('NYC', 'MTL', 'LA'))
  ),
  htmlDiv(id = 'app-1-display-value'),
  coreLink('Go to App 2', href = '/apps/app2')
)

# Use modules to get a python-like import `from app import app`
# devtools::install_github('klmr/modules')
modules::import("app", attach = "app")

app$callback(
  function(value = input('app-1-dropdown')) {
    paste('You have selected', value)
  }, output('app-1-display-value')
)
