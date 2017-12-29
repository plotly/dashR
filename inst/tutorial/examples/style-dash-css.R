library(dasher)

app <- Dash$new()

app$layout_set(
  coreInput(id = 'inputID', value = 'initial value', type = "text"),
  htmlDiv(id = 'outputID')
)

app$dependencies_set(dash_css())
app
