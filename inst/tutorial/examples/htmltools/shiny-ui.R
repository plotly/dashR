library(dashR)
library(dashRwidgets)
library(shiny)
library(plotly)

nms <- names(mtcars)
ui <- fluidPage(
  fluidRow(
    column(3,
      coreDropdown(id = "x", options = nms, value = nms[1], clearable = FALSE),
      coreDropdown(id = "y", options = nms, value = nms[2], clearable = FALSE)
    ),
    column(6, htmlwidget(id = 'plotID', name = "plotly"))
  )
)

app <- Dash$new()
app$layout_set(ui)
app$callback(
  function(x = input("x"), y = input("y")) {
    plot_ly(mtcars, x = as.formula(paste0("~", x)), y = as.formula(paste0("~", y))) %>%
      layout(title = paste(x, "vs", y))
  },
  output(id = 'plotID', property = "widget")
)

# If you aren't supplying a plotly object directly to the `widget` property of
# the `htmlwidget()` component, you need to register 'run-time' dependencies
# like so (other htmlwidgets may not have 'run-time' dependencies, in which case,
# this won't be necessary):
app$dependencies_set(plot_ly()$dependencies)
app$run_server()
