library(dashR)

styles <- list(
  underline = list(
    `border-bottom` = 'thin lightgrey solid',
    `margin-top` = '50px'
  )
)

Chapter <- function(name, href = NULL, caption = NULL) {
  linkComponent <- if (startsWith(href, 'http')) htmlA else coreLink
  htmlDiv(
    #TODO: what is up with htmlLi()?
    linkComponent(name, href = href, style = list(paddingLeft = 0)),
    if (!is.null(caption)) {
      htmlSmall(
        style = list(display = 'block', marginTop = '-10px'),
        coreMarkdown(caption)
      )
    }
  )
}

Section <- function(title, ..., description = NULL, headerStyle = list()) {
  htmlDiv(
    htmlH2(
      title, style = modifyList(headerStyle, styles['underline'])
    ),
    if (!is.null(description)) htmlDiv(description),
    htmlUl(children = list(...))
  )
}


ui <- htmlDiv(
  className = 'toc',
  htmlH1('Dash User Guide'),

  Section(
    "What's Dash?",
    Chapter('Introduction', '/dashR/introduction'),
    # TODO: change this to the dashR announcement!
    Chapter('Announcement', 'https://medium.com/@plotlygraphs/introducing-dash-5ecf7191b503'),
    Chapter('Dash App Gallery', '/dashR/gallery'),
    Chapter('Winter 2018 Workshops', 'https://plotcon.plot.ly/workshops')
  ),


  Section(
    'Dash Tutorial',
    Chapter(
      'Part 1. Installation',
      '/dashR/installation'
    ),
    Chapter(
      'Part 2. The Dash Layout',
      '/dashR/getting-started',
      "The Dash `layout` describes what your app will look like and is
      composed of a set of declarative Dash components."
    ),
    Chapter(
      'Part 3. Basic Callbacks',
      '/dashR/getting-started-part-2',
      "Dash apps are made interactive through Dash Callbacks: R functions that
       are automatically called whenever an input component's property changes.
       Callbacks can be chained, allowing one update in the UI to trigger several
      updates across the app."
    ),
    Chapter(
      'Part 4. Callbacks With State',
      '/dashR/state',
      "Callbacks fire when their `input()` argument value(s) change. Use
      `state()` in conjunction with `input()` to isolate
      the `Inputs` change. `State` is useful for UIs that contain
      forms or buttons."
    ),
    Chapter(
      'Part 5. Interactive Graphing and Crossfiltering',
      '/dashR/interactive-graphing',
      "Bind interactivity to the Dash `Graph` component whenever you hover,
      click, or select points on your chart."
    ),
    Chapter(
      'Part 6. Sharing Data Between Callbacks',
      '/dashR/sharing-data-between-callbacks',
      "`global` variables will break your Dash apps. However, there
      are other ways to share data between callbacks. This chapter is
      useful for callbacks that run expensive data processing tasks or
      process large data."
    )
  ),

  Section(
    'Component Libraries',
    Chapter(
      'Dash Core Components',
      '/dashR/dash-core-components',
      "The Dash Core Component library contains a set of higher-level components like sliders, graphs, dropdowns, tables, and more."),
    Chapter(
      'Dash HTML Components',
      '/dashR/dash-html-components',
      "Dasher provides every HTML tag as R functions. This chapter explains how this works and the few important key differences between Dash HTML components and standard HTML."
    ),
    Chapter(
      'Build Your Own Components',
      '/dashR/plugins',
      "Dasher components are built with [React.js](https://reactjs.org/). Dasher provides a React → Dasher toolchain that generates a Dash-compatible interface to these components in R."
    )
  ),

  Section(
    'Advanced Usage',
    Chapter(
      'Performance',
      '/dashR/performance',
      "There are two main ways to speed up dash apps: caching and using WebGL chart types."
    ),
    Chapter(
      'Live Updates',
      '/dashR/live-updates',
      "Update your apps on page load or on a predefined interval (e.g. every 30 seconds)."
    ),
    Chapter(
      'External CSS and JS',
      '/dashR/external-resources',
      "Learn how to append your own CSS styleseets or JS scripts to your apps."
    ),
    Chapter(
      'URL Routing and Multiple Apps',
      '/dashR/urls',
      "Dasher provides two components (`coreLink()` and `coreLocation()`) that allow you to easily make fast multipage apps using its own 'Single Page App (SPA)' design pattern."
    )
  ),

  Section(
    'Production',
    Chapter('Authentication', '/dashR/authentication'),
    Chapter('Deployment', '/dashR/deployment')
  ),

  Section(
    'Getting Help',
    Chapter('FAQ', 'https://community.plot.ly/c/dash'),
    Chapter('Support and Contact', href = '/dashR/support')
  ),

  Section(
    'Plotly On-Premises',
    description = "Plotly On-Premises is Plotly's commercial offering for hosting and sharing Dash apps.",
    headerStyle = list(color = '#0D76BF'),
    Chapter(
      'About Plotly On-Premises',
      'https://plot.ly/products/on-premise'
    ),
    Chapter(
      'Deploying Dash Apps on Plotly On-Premises',
      '/dashR/deployment/on-premise'
    )
  )
)

app <- Dash$new()
app$layout_set(ui)
app
