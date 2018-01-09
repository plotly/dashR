library(dasher)

app <- Dash$new('auth')

# Modify these argument with your own info
auth <- auth_plotly(
  app,
  'Dash Authentication Sample App',
  'private',
  'https://my-dash-app.herokuapps.com'
)

app$layout_set(
  htmlDiv(
    className = 'container',
    htmlH1('Welcome to the app'),
    htmlH3('You are successfully authorized'),
    coreDropdown(
      id = 'dropdown',
      options = c('A', 'B'),
      value = 'A'
    ),
    coreGraph(id = 'graph')
  )
)

app$callback(
  function(value = input("dropdown")) {
    list(
      data = list(
        list(x = c(1, 2, 3), y = c(4, 1, 2))
      ),
      layout = list(
        title = paste('Graph of ', value),
        margin = list(l = 20, b = 20, r = 10, t = 60)
      )
    )
  }, output("graph", "figure")
)

app$dependencies_set(dash_css())

app


