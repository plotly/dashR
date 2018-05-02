library(dashR)

ui <- htmlDiv(
  htmlH2("Introduction to DashR"),

  coreMarkdown(
    "DashR is an R package for building reactive web applications. It builds upon many",
    "of the same technologies (e.g., [react](https://reactjs.org/)) and ideas as",
    "[Dash](https://plot.ly/dash), but allows one to create/deploy apps entirely in R,",
    "and leverage it's computational resources.",
    "",
    "TODO: link to announcement?",
    "",
    "DashR is an open source library, released under the permissive MIT license.",
    "[Plotly](https://plot.ly) develops DashR and offers a platform for deploying,",
    "orchestrating, and permissioning dash apps in an enterprise environment.",
    "If you're interested, [please get in touch](https://plotly.typeform.com/to/seG7Vb)."
  )
)

app <- Dash$new()
app$layout_set(ui)
app
