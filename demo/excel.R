library(dasher)

app <- Dash$new()

ui <- html_div(
  html_label('Hours per Day'),
  core_slider(id = 'hours', value = 5, min = 0, max = 24, step = 1),

  html_label('Rate'),
  core_input(id = 'rate', value = 2, type = 'number'),

  html_label('Amount per Day'),
  html_div(id = 'amount'),

  html_label('Amount per Week'),
  html_div(id = 'amount-per-week'),

  style = list(
    padding = 60,
    width = 180,
    border = 'thin lightgrey solid',
    backgroundColor = 'white',
    marginRight = 'auto',
    marginLeft = 'auto',
    borderRadius = 5,
    marginTop = 40
  )
)

app$layout_set(ui)

app$callback(
  function(hours = input("hours"), rate = input("rate")) {
    as.numeric(hours) * as.numeric(rate)
  },
  output("amount")
)

app$callback(
  function(amount = input("amount", "children")) {
    as.numeric(amount) * 7
  },
  output("amount-per-week")
)

app$dependencies_set(dash_css(c('bWLwgP', 'LLYbXR')))
app$run_server(showcase = TRUE)
