library(dasher)

app <- Dash$new()

ui <- htmlDiv(
  htmlLabel('Hours per Day'),
  coreSlider(id = 'hours', value = 5, min = 0, max = 24, step = 1),

  htmlLabel('Rate'),
  coreInput(id = 'rate', value = 2, type = 'number'),

  htmlLabel('Amount per Day'),
  htmlDiv(id = 'amount'),

  htmlLabel('Amount per Week'),
  htmlDiv(id = 'amount-per-week'),

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

app$dependencies_set(dash_css(c("docs-base", "docs-custom")))
app
