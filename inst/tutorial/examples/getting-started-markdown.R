library(dashR)

app <- Dash$new()

md <- coreMarkdown(
  "### DashR and Markdown",
  "DashR apps can be written in Markdown.",
  "",
  "DashR uses the [CommonMark](http://commonmark.org/) specification of Markdown.",
  "",
  "Check out their [60 Second Markdown Tutorial](http://commonmark.org/help/)",
  "if this is your first introduction to Markdown."
)

app$layout_set(md)
app
