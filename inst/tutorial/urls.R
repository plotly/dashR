library(dasher)

source("styles.R")

ui <- htmlDiv(
  coreMarkdown(
    "# Multi-Page Apps and URL Support",
    "",
    "Dash renders web applications as a 'single-page app'. This means that",
    "the application does not completely reload when the user navigates the",
    "application, making browsing very fast.",
    "",
    "There are two new components that aid page navigation:",
    "`coreLocation()` and `coreLink()`.",
    "",
    "`coreLocation()` represents the location bar in your web browser",
    "through the `pathname` property. Here's a simple example:"
  ),

  coreSyntaxHighlighter(
    paste(readLines("examples/urls.R"), collapse = "\n"),
    language = 'r', customStyle = styles$code_container
  ),

  coreMarkdown(
    "In this example, the callback receives the current pathname",
    "(the last part of the URL) of the page. The callback simply displays the",
    "`pathname` on page but it could use the `pathname` to display different",
    "content.",
    "",
    "The `coreLink()` component updates the `pathname` of the browser _without refreshing the",
    "page_. If you used a `htmlA()` component instead, the `pathname` would update but",
    "the page would refresh.",
    "",
    "Here is a GIF of what this example looks like. Note how clicking on the `coreLink()`",
    "doesn't refresh the page even though it updates the URL!",
    "",
    "![Example of a multi-page Dash app using the Location and Link components](https://github.com/plotly/dash-docs/raw/master/images/url-support.gif)",
    "",
    "***",
    "",
    "You can modify the example above to display different pages depending on the URL:"
  ),

  coreSyntaxHighlighter(
    paste(readLines("examples/urls-part-2.R"), collapse = "\n"),
    language = 'r', customStyle = styles$code_container
  ),

  coreMarkdown(
    "![Dash app with multiple pages](https://github.com/plotly/dash-docs/raw/master/images/url-support-pages.gif)",
    "",
    "In this example, we're displaying different layouts through the `display_page`",
    "function. A few notes:",
    "- Each page can have interactive elements even though those elements may not",
    "be in the initial view. Dash handles these 'dynamically generated' components",
    "gracefully: as they are rendered, they will trigger the",
    "callbacks with their initial values.",
    "- Since we're adding callbacks to elements that don't exist in the layout,",
    "Dasher will warn us that we might be doing something wrong.",
    "Since we are adding the appropriate elements through a callback, we can safely",
    "ignore the warning.",
    "- You can modify this example to import the different page's `layout`s in different files.",
    "- This Dasher Userguide that you're looking at is itself a multi-page Dash app, using",
    "rendered with these same principles."
  ),

  htmlHr(),
  coreMarkdown(
    "# Structuring a Multi-Page App",
    "",
    "Here's how to structure a multi-page app, where each app is contained in a separate file.",
    "",
    "File structure:",
    "",
    "```",
    "- app.R",
    "- index.R",
    "- apps",
    "  |-- app1.R",
    "  |-- app2.R",
    "```",
    "",
    "***",
    "",
    "`app.R`"
  ),

  coreSyntaxHighlighter(
    paste(readLines("examples/multi-page-app/app.R"), collapse = "\n"),
    language = 'r', customStyle = styles$code_container
  ),

  htmlHr(),

  coreMarkdown("`apps/app1.R`"),

  coreSyntaxHighlighter(
    paste(readLines("examples/multi-page-app/apps/app1.R"), collapse = "\n"),
    language = 'r', customStyle = styles$code_container
  ),

  coreMarkdown("And similarly for other apps"),

  htmlHr(),

  coreMarkdown("`index.R` loads different apps on different urls like this:"),

  coreSyntaxHighlighter(
    paste(readLines("examples/multi-page-app/index.R"), collapse = "\n"),
    language = 'r', customStyle = styles$code_container
  ),

  coreMarkdown("At this point, you could run the full app from your terminal with `Rscript index.R`.")
)

app <- Dash$new()
app$layout_set(ui)
app
