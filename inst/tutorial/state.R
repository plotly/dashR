library(dashR)

# import Syntax() and Example()
source("components.R")
source("tools.R")
source("styles.R")

exfiles <- c(
  "basic-input.R",
  "basic-state.R"
)
examples <- lapply(file.path("examples", exfiles), load_example)

ui <- htmlDiv(
  htmlH1('Dash State'),

  coreMarkdown(
    "In the previous chapter on [basic dash callbacks](/dash/getting-started-part-2),",
    "our callbacks looked something like:"
  ),
  Syntax(examples[[1]]$source),
  Example(examples[[1]]$layout),

  coreMarkdown(
    "In this example, the callback is fired whenever any of the `input()`",
    "arguments change. Try it for yourself by entering data in the inputs above.",
    "",
    "`state()` allows you to pass along extra values without firing the callbacks.",
    "Here's the same example as above but with the `coreInput()` as `state()`",
    "and a button as `input()`."
  ),
  Syntax(examples[[2]]$source),
  Example(examples[[2]]$layout),

  coreMarkdown(
    "In this example, changing text in the `coreInput()` boxes won't fire",
    "the callback but clicking on the button will. The current values of",
    "the `coreInput()` values are still passed into the callback even though",
    "they don't trigger the callback function itself.",
    "",
    "Note that we're triggering the callback by listening to the",
    "`n_clicks` property of the `htmlButton` component. `n_clicks` is a",
    "property that gets incremented every time the component has been",
    "clicked on. It is available in every `html*()` component.",
  )
)

app <- Dash$new()
app$layout_set(ui)
app
