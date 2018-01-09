library(dasher)

app <- Dash$new('auth')

# keep username/passwords out of source code repository - save in a file or a database
app <- auth_basic(app, c("hello" = "world"))

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
