# Three ways to show/hide content via https://community.plot.ly/t/collapsible-div-in-dash/6634/4

library(dashR)

app <- Dash$new()

app$layout_set(
  coreRadioItems(
    id = 'toggle',
    options = c("Show", "Hide"),
    value = 'Hide'
  ),
  htmlDiv(
    id = 'radio_container', style = list(display = "none"),
    htmlImg(src = "https://www.r-project.org/logo/Rlogo.png", width = "100")
  ),
  htmlButton('Show', id = 'button'),
  htmlDiv(
    id = 'button_container', style = list(display = "none"),
    htmlImg(src = "https://www.r-project.org/logo/Rlogo.png", width = "100")
  ),
  htmlDetails(
    htmlSummary('Show / Hide'),
    htmlImg(src = "https://www.r-project.org/logo/Rlogo.png", width = "100")
  )
)

# show/hide R logo on radio button toggle
app$callback(
  function(toggle = input("toggle")) {
    display <- if (identical("Show", toggle)) "block" else "none"
    list(display = display)
  },
  output("radio_container", "style")
)

# show/hide R logo upon button click
app$callback(
  function(n = input("button", "n_clicks")) {
    display <- if (isTRUE(n %% 2 == 1)) "block" else "none"
    list(display = display)
  },
  output("button_container", "style")
)

# update button label sensibly upon button click
app$callback(
  function(n = input("button", "n_clicks")) {
    if (isTRUE(n %% 2 == 1)) "Hide" else "Show"
  },
  output("button")
)

app



