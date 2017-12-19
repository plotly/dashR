library(dasher)

app <- Dash$new()

md <- coreMarkdown("
### Dash and Markdown

Dash apps can be written in Markdown.

Dash uses the [CommonMark](http://commonmark.org/)
specification of Markdown.

Check out their [60 Second Markdown Tutorial](http://commonmark.org/help/)
if this is your first introduction to Markdown
")

app$layout_set(md)

app$run_server(showcase = TRUE)
