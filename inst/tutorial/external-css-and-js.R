library(dasher)

source("components.R")

ui <- htmlDiv(

  coreMarkdown(
    "
# External CSS and JavaScript

When a dasher app is launched, it automatically serves the
CSS/JS files required to render the layout. By default, dasher doesn't
make strong assumptions about styling, it's often useful to include additional
stylesheets and/or scripts. The following sections show different ways to
include 'external' CSS/JS file(s) using the application's
`dependencies_set()` method.
"
  ),

  htmlH2("Including pre-packaged dash stylesheets"),

  coreMarkdown(
    "
The `dash_css()` function provides easy access to numerous stylesheets
maintained by plotly for use in dash and dasher applications.
[See here](https://github.com/plotly/dash-app-stylesheets) for a full list
of the available stylesheets.
"
  ),

  Syntax(readLines("examples/style-dash-css.R")),

  htmlH2("Including external CSS/JS via npm (e.g. bootstrap)"),

  coreMarkdown(
    "
The `dependencies_set()` method accepts one or more `htmlDependency()` objects
(from the **htmltools** package). As we'll see shortly, you can create these
objects by hand, but if you're using files that are accessible via
<https://unpkg.com>, it can be a lot quicker, easier, and maintainable to use
the **runpkg** to obtain popular CSS/JS files as `htmlDependency()` object(s).
"
  ),

  Syntax(readLines("examples/style-unpkg.R")),

  htmlH2("Including custom CSS and JavaScript"),

  coreMarkdown(
    "
For complete flexibility, you can manually create `htmlDependency()` object(s)
and give them to `dependencies_set()`. This example shows you how to manually
include CSS for the [Dash Styleguide]() (essential what `dash_css()` does for you).
"
  ),

  Syntax(readLines("examples/style-custom.R")),

  coreMarkdown(
    "
## Local vs remote dependencies

By default, dasher (tries to) include *local* CSS/JS files, but you also have
the option of serving files *remotely* via an online cdn/url. Using remote files
can make it quicker and easier to develop your application (no need to download
and specify a path to the files), but will require an internet connection in
order to view the application.
"),

  Syntax(
    "
library(dasher)

app <- Dash$new()
app$serve_locally <- FALSE
"
  )
)

app <- Dash$new()
app$layout_set(ui)
app
