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
  htmlH1('DashR User Guide'),

  Section(
    "What's DashR?",
    Chapter('Introduction', '/introduction'),
    # TODO: change this to the dashR announcement!
    Chapter('Announcement', 'https://medium.com/@plotlygraphs/introducing-dash-5ecf7191b503'),
    Chapter('DashR App Gallery', '/gallery'),
    Chapter('Winter 2018 Workshops', 'https://plotcon.plot.ly/workshops')
  ),


  Section(
    'DashR Tutorial',
    Chapter(
      'Part 1. Installation',
      '/installation'
    ),
    Chapter(
      'Part 2. The DashR Layout',
      '/getting-started',
      "The DashR `layout` describes what your app will look like and is
      composed of a set of declarative DashR components."
    ),
    Chapter(
      'Part 3. Basic Callbacks',
      '/getting-started-part-2',
      "DashR apps are made interactive through callbacks: R functions that
       are automatically called whenever an input component's property changes.
       Callbacks can be chained, allowing one update in the UI to trigger several
      updates across the app."
    ),
    Chapter(
      'Part 4. Callbacks with State',
      '/state',
      "Callbacks fire when their `input()` argument value(s) change. Use
      `state()` in conjunction with `input()` to pass in extra values whenever
      relevant `input()`s change. `state()` is useful for UIs that contain
      forms or buttons."
    ),
    Chapter(
      'Part 5. Interactive Graphing and Crossfiltering',
      '/interactive-graphing',
      "Bind interactivity to the DashR `coreGraph()` component whenever you hover,
      click, or select points on your chart."
    ),
    Chapter(
      'Part 6. Sharing Data Between Callbacks',
      '/sharing-data-between-callbacks',
      "`global` variables will break your DashR apps. However, there
      are other ways to share data between callbacks. This chapter is
      useful for callbacks that run expensive data processing tasks or
      process large data."
    )
  ),

  Section(
    'Component Libraries',
    Chapter(
      'DashR Core Components',
      '/dash-core-components',
      "The DashR Core Component library contains a set of higher-level components like sliders, graphs, dropdowns, tables, and more."),
    Chapter(
      'DashR HTML Components',
      '/dash-html-components',
      "DashR exposes every HTML tag as an R function. This chapter explains how this works and the few important key differences between standard HTML and DashR's HTML components."
    ),
    Chapter(
      'Build Your Own Components',
      '/plugins',
      "DashR components are built with [React.js](https://reactjs.org/). Learn about the React → Dash/DashR toolchain that allows you leverage any dash-compatible React component in both and Python (Dash) and R (DashR)"
    )
  ),

  Section(
    'Advanced Usage',
    Chapter(
      'Performance',
      '/performance',
      "There are two main ways to speed up your app: caching and using WebGL chart types."
    ),
    Chapter(
      'Live Updates',
      '/live-updates',
      "Update your apps on page load or on a predefined interval (e.g. every 30 seconds)."
    ),
    Chapter(
      'External CSS and JS',
      '/external-resources',
      "Learn how to append your own CSS styleseets or JS scripts to your apps."
    ),
    Chapter(
      'URL Routing and Multiple Apps',
      '/urls',
      "DashR provides two components (`coreLink()` and `coreLocation()`) that allow you to easily make fast multipage apps using its own 'Single Page App (SPA)' design pattern."
    )
  ),

  Section(
    'Production',
    Chapter('Authentication', '/authentication'),
    Chapter('Deployment', '/deployment')
  ),

  Section(
    'Getting Help',
    Chapter('FAQ', 'https://community.plot.ly/c/dashR'),
    Chapter('Support and Contact', href = '/support')
  ),

  Section(
    'Plotly On-Premises',
    description = "Plotly On-Premises is Plotly's commercial offering for hosting and sharing DashR apps.",
    headerStyle = list(color = '#0D76BF'),
    Chapter(
      'About Plotly On-Premises',
      'https://plot.ly/products/on-premise'
    ),
    Chapter(
      'Deploying DashR Apps on Plotly On-Premises',
      '/deployment/on-premise'
    )
  )
)

app <- Dash$new()
app$layout_set(ui)
app
