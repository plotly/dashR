library(dashR)

source("styles.R")
source("tools.R")
source("components.R")

exfiles <- "live-updates.R"
examples <- lapply(file.path("examples", exfiles), load_example)

ui <- htmlDiv(

  coreMarkdown(
    "# Live Updating Components",
    "",
    "## The `coreInterval()` component",
    "",
    "Components in dashR usually update through user interaction (e.g.,",
    "selecting a dropdown, dragging a slider, hovering over points, etc).",
    "",
    "If you're building an app for monitoring, you may want to update",
    "components in your application every few seconds or minutes.",
    "",
    "The `coreInterval()` component allows you to update other components",
    "on a predefined interval. The `n_intervals` property of the `coreInterval()`",
    "component is an integer that is automatically incremented every time",
    "`interval` millseconds pass. You can listen to this variable inside a",
    "`callback()` method to fire it on a predefined interval."
  ),

  Syntax(examples[[1]]$source),

  htmlHr(),

  coreMarkdown(
    "## Updates on Page Load",
    "",
    "By default, DashR stores the layout in memory. This ensures that the layout",
    "is only computed once, when the app starts.",
    "",
    "If you provide `app$layout_set()` to a function, then you can render a different",
    "layout on every page load.",
    "",
    "For example, if your `app$layout_set()` looked like this:",
    "",
    "```",
    "library(dashR)",
    "",
    "app <- Dash$new()",
    "app$layout_set(",
    "  htmlH1('The time is: ' + Sys.time())",
    ")",
    "app$run_server()",
    "```",
    "",
    "then your app would display the time when the app was started.",
    "",
    "If you change this to a function, then a new `datetime` will get computed",
    "everytime you refresh the page. Give it a try:"
  ),

  Syntax(readLines("examples/layout-dynamic.R")),

  coreMarkdown(
    "You can combine this with [time-expiring caching](/performance) and serve",
    "a unique layout every hour or every day and serve the computed layout",
    "from memory in between."
  )
)


app <- Dash$new()
app$layout_set(ui)
app
