library(dashR)
library(dashRwidgets)
library(flexdashboard)
library(shiny)
library(plotly)

# TODO: perhaps if we were to place shinydashboard js in the head (like shiny does) this would work?
ui <- htmlDiv(
  valueBox("foo", icon = "fa-pencil"),
  htmlwidget(name = "plotly")
)


app <- Dash$new()
app$layout_set(ui)
app$callback(
  function(x = input("x")) {
    plot_ly(x = mtcars[[x]])
  },
  output(id = 'plotID', property = "widget")
)

# If you aren't supplying a plotly object directly to the `widget` property of
# the `htmlwidget()` component, you need to register 'run-time' dependencies
# like so (other htmlwidgets may not have 'run-time' dependencies, in which case,
# this won't be necessary):
app$dependencies_set(plot_ly()$dependencies)
app$run_server()


