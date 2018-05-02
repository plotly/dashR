library(dashR)

source("styles.R")

ui <- htmlDiv(

  coreMarkdown(
    "# Deploying dashR apps",
    "",
    "By default, dashR apps run on `localhost` - you can only access them on your",
    "own machine. To share a dashR app, you need to deploy it to a server and open",
    "up the server's firewall to the public or to a restricted set of IP addresses.",
    "",
    "### Public apps",
    "",
    "DashR apps can be hosted on a variety of third-party services: Digital Ocean,",
    "Heroku, Google Cloud, Amazon Web Services, Azure, and more.",
    "You can also deploy dashR apps directly on your own infrastructure. For details,",
    "see the deployment tutorial below.",
    "",
    "### Private apps",
    "",
    "You can restrict access to dashR apps with HTTP Basic Auth and through",
    "your [Plotly Cloud account](https://plot.ly/).",
    "[Tutorial on dashR authentication](/dashR/authentication).",
    "",
    "### On-Premise apps",
    "",
    "[Plotly On-Premise](https://plot.ly/products/on-premise) offers an",
    "enterprise-wide dashR app portal, easy git-based deployment, automatic URL",
    "namespacing, built-in SSL support, LDAP authentication, and more.",
    "[Request a dashR on-premise demo](https://plot.ly/products/on-premise).",
    "",
    "For existing customers, view the",
    "[tutorial on deploying Dash Apps on Plotly On-Premise](/dashR/deployment/on-premise).",
    "",
    "### DashR and fiery",
    "",
    "Dash apps are web applications built on top of the fiery framework.",
    "The underlying server is available at `app$server`, that is:"
  ),

  coreSyntaxHighlighter(
    "
    library(dashR)
    app <- Dash$new()
    app$server # the fiery server
    ",
    language = 'r',
    customStyle = styles$code_container
  ),

  coreMarkdown("You can also build a dashR app around a custom fiery server:"),

  coreSyntaxHighlighter(
    "
    library(fiery)
    library(dash)
    server <- Fire$new()
    app <- Dash$new(
      name = 'My custom dashR app',
      server = server
    )
    ",
    language = 'r',
    customStyle = styles$code_container
  ),

  coreMarkdown(
    "By exposing the `server`, you can deploy dashR apps like you would",
    "any other fiery app. The author of fiery posted this nice summary of",
    "[fiery deployment via Heroku](https://www.data-imaginist.com/2017/setting-fire-to-deployment/).",
    "",
    "This workflow for deploying apps on Heroku is very similar to how deployment",
    "works with the [Plotly On-Premise](https://plot.ly/products/on-premise)",
    "dashR deployment server which offers a number of features that Heroku itself",
    "does not."
  )


)


app <- Dash$new()
app$layout_set(ui)
app
