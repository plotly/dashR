library(dasher)

# import Syntax() and Example()
source("components.R")
source("tools.R")
source("styles.R")

exfiles <- c(
  'getting-started-layout-1.R',
  'getting-started-layout-2.R',
  'getting-started-table.R',
  'getting-started-viz.R',
  'getting-started-markdown.R',
  'getting-started-core-components.R'
)
examples <- lapply(file.path("examples", exfiles), load_example)


ui <- htmlDiv(

  coreMarkdown(sprintf(
    "
# Dash Tutorial - Part 1: App Layout

This tutorial will walk you through the fundamentals of creating Dash apps through %s self-contained apps.
", length(examples))),

  htmlHr(),

  coreMarkdown(
    "
1. [Installation](#installation)
2. [Dash App Layout](#dash-app-layout)
  - Generating HTML with Dash
  - Data Visualization in Dash
  - Markdown
  - Core Components
  - Calling `help`
3. [Interactivity](/dasher/getting-started-part-2)
  - Fundamentals
  - Multiple Inputs
  - Multiple Outputs
  - Graph Crossfiltering
"),

  htmlHr(),

  htmlH2("Dash App Layout", id = 'dash-app-layout'),

  coreMarkdown("
#### Generating HTML with Dash

Dasher apps are composed of two parts. The first part is the '`layout`' of
the app and it describes what the application looks like.
The second part describes the interactivity of the application.

Dasher provides R functions for all of the visual components of
the application. We maintain a set of components in
[dash-core-components](https://github.com/plotly/dash-core-components)
and the [dash-html-components](https://github.com/plotly/dash-html-components),
but you can also [build your own](https://github.com/plotly/dash-components-archetype)
with JavaScript and React.js.
"),

  Syntax(
    examples[[1]]$source,
    "To get started, copy/paste this code into your R session:"
  ),

  coreMarkdown(
    "
Then, launch the application with:

```
app$run_server(showcase = TRUE)
```

and visit [http://127.0.0.1:8080/](http://127.0.0.1:8080/) in your web browser.
You should see an app that looks like this."
  ),

  Example(examples[[1]]$layout),

  coreMarkdown(
    "
Note:
1. The `layout` is composed of a tree of 'components' like `htmlDiv`
and `coreGraph`.
2. There is a component for every HTML tag.
The `htmlH1('Hello Dash')` component generates
a `<h1>Hello Dash</h1>` HTML element in your application.
3. Not all components are pure HTML. The `core*()` components describe
higher-level components that are interactive and are generated with
JavaScript, HTML, and CSS through the React.js library.
4. Each component is described entirely through keyword attributes.
Dasher is _declarative_: you will primarily describe your application
through these attributes.
5. Unnamed arguments are interpreted as `children` of the component, which may
any be collection of string(s), number(s), and/or other components.
Sometimes, it can be useful to supply a list of things to `children`, for instance:

  `htmlH1('Hello Dash')` is the same as `htmlH1(children = list('Hello Dash'))`.

6. The fonts/styles in your application may look different than
what is displayed here. This application is using a
custom CSS stylesheet to modify the default styles of the elements.
You can learn more in the [css tutorial](/dasher/external-resources),
but for now you can add

```
app$dependencies_set(dash_css())
```

to get the same look and feel of these examples.

#### More about HTML
"
  ),

  Syntax(
    examples[[2]]$source,
    "Let's customize the text in our app by modifying the inline styles of the components:"
  ),

  Example(
    examples[[2]]$layout,
    style = list(
      `padding-right` = '35px',
      `padding-bottom` = '30px'
    )),

  coreMarkdown(
    "
In this example, we modified the inline styles of the `htmlDiv()` and `htmlH1()`
components with the `style` property.

`htmlH1('Hello Dash', style = list(textAlign = 'center', color = '#7FDFF'))` is
rendered in the Dash application as `<h1 style='text-align: center; color: #7FDFF'>Hello Dash</h1>`.

There are a few important differences between the R components and the HTML attributes:

1. The `style` property in HTML is a semicolon-separated string. In Dasher, you can supply a named list.
2. The keys in the `style` dictionary are [camelCased](https://en.wikipedia.org/wiki/Camel_case). So, instead of `text-align`, it's `textAlign`.
3. The HTML `class` attribute is `className` in Dasher.
4. The children of the HTML tag is specified through the `children` keyword argument.
By convention, this is always the _first_ argument and so it is often omitted.

Besides that, all of the available HTML attributes and tags are available to you from R.

***

#### Reusable Components

By writing our markup in R, we can create complex resuable components like
tables without switching contexts or languages.
"),

  Syntax(
    examples[[3]]$source,
    "Here's a quick example that generates a `Table` from a data frame."
  ),

  Example(examples[[3]]$layout),

  coreMarkdown(
    "
               #### More about Visualization

               The `dash_core_components` library includes a component called `Graph`.

               `Graph` renders interactive data visualizations using the open source
               [plotly.js](https://github.com/plotly/plotly.js) JavaScript graphing
               library. Plotly.js supports over 35 chart types and renders charts in
               both vector-quality SVG and high-performance WebGL.

               The `figure` argument in the `dash_core_components.Graph` component is
               the same `figure` argument that is used by `plotly.py`, Plotly's
                 open source Python graphing library.
                 Check out the [plotly.py documentation and gallery](https://plot.ly/python)
                 to learn more.
"),

  Syntax(
    examples[[4]]$source,
    "Here's an example that creates a scatter plot from a dataframe."
  ),

  Example(examples[[4]]$layout),

  coreMarkdown(
    "
*These graphs are interactive and responsive.
**Hover** over points to see their values,
**click** on legend items to toggle traces,
**click and drag** to zoom,
**hold down shift, and click and drag** to pan.*

#### Markdown

While Dash exposes HTML through the `dash_html_components` library,
it can be tedious to write your copy in html
For writing blocks of text, you can use the `Markdown` component in the
`dash_core_components` library."
  ),

  Syntax(examples[[5]]$source),

  Example(examples[[5]]$layout),

  coreMarkdown(
    "
#### Core Components

In constrast to the `html*()` components, `core*()` components include a set a
higher-level components like dropdowns, graphs, markdown blocks, and more.

Like all Dasher components, they are described declaratively.
Every option that is configurable is available as a keyword argument
of the component.
"
  ),

  htmlP(
    "We'll see many of these components throughout the tutorial.
You can view all of the available components in the",
    coreLink('Core Components Gallery', href = '/dasher/dash-core-components')
  ),

  Syntax(
    examples[[6]]$source,
    "Here are a few of the available components:"
  ),

  Example(examples[[6]]$layout),

  coreMarkdown(
    "
#### Calling `help`

Dash components are declarative: every configurable aspect of these
components is set during instantiation as a keyword argument.
Call `help` in your Python console on any of the components to
learn more about a component and its available arguments."
  ),

  coreMarkdown(
    "
### Summary

The `layout` of a Dash app describes what the app looks like.
The `layout` is a hierarchical tree of components.
The `dash_html_components` library provides classes for all of the HTML
tags and the keyword arguments describe the HTML attributes like `style`,
`className`, and `id`.
The `dash_core_components` library generates higher-level
components like controls and graphs.

For reference, see:
"),

  htmlUl(
    htmlLi(
      coreLink('Core components gallery', href = '/dasher/dash-core-components')
    ),
    htmlLi(
      coreLink('HTML components gallery', href = '/dasher/dash-core-components')
    )
  ),

  htmlP(
    "The next part of the Dash tutorial covers how to make these apps interactive."
  ),

  coreLink(
    'Dash Tutorial - Part 2: Basic Callbacks',
    href = "/dasher/getting-started-part-2"
  )

)


app <- Dash$new()
app$layout_set(ui)
app
