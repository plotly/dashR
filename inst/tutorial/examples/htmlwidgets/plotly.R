library(dashR)
library(dashRwidgets)
library(plotly)

app <- Dash$new()

nms <- names(mtcars)

# TODO: could we leverage a sidebarPanel here?
app$layout_set(
  # name of the htmlwidget is required!
  # package name is only required if the widget name differs from the package name
  htmlwidget(id = 'plotID', name = "plotly", width = "50%"),
  htmlLabel(
    "Pick an x",
    htmlDiv(
      coreDropdown(id = "x", options = nms, value = nms[1], clearable = FALSE),
      style = list(width = "100px", margin = "15px")
    )
  ),
  htmlLabel(
    "Pick a y",
    htmlDiv(
      coreDropdown(id = "y", options = nms, value = nms[2], clearable = FALSE),
      style = list(width = "100px", margin = "15px")
    )
  )
)

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
app
