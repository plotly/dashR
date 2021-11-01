[![CircleCI](https://circleci.com/gh/plotly/dashR/tree/master.svg?style=svg)](https://app.circleci.com/pipelines/github/plotly/dashR?branch=master)
[![GitHub](https://img.shields.io/github/license/plotly/dashR.svg?color=dark-green)](https://github.com/plotly/dashR/blob/master/LICENSE)
[![CRAN status](https://www.r-pkg.org/badges/version-ago/dash)](https://CRAN.R-project.org/package=dash)
[![](http://cranlogs.r-pkg.org/badges/grand-total/dash)](https://CRAN.R-project.org/package=dash)
[![](https://cranlogs.r-pkg.org/badges/dash)](https://CRAN.R-project.org/package=dash)

# Dash for R

#### Create beautiful, analytic web applications in R.

[Documentation](https://dash.plotly.com/r/) | [Gallery](https://dash.gallery/Portal/)

## Installation

<https://dash.plotly.com/r/installation>

> 🛑 Make sure you're on at least version `3.0.2` of R. You can see what version of R you have by entering `version` in the R CLI. [CRAN](https://cran.r-project.org/bin/) is the easiest place to download the latest R version.

As of 2020-06-04, **dash** and the currently released versions of all core component libraries are _available for download via CRAN!_ Installing `dash` and its dependencies is as simple as

```r
install.packages("dash")
```

Users who wish to install (stable) development versions of the package as well as Dash components from GitHub may instead use `install_github` and specify the development branch:

```r
install.packages(c("fiery", "routr", "reqres", "htmltools", "base64enc", "plotly", "mime", "crayon", "devtools"))

# installs dash, which includes dashHtmlComponents, dashCoreComponents, and dashTable
# and will update the component libraries when a new package is released
devtools::install_github("plotly/dashR", ref="dev", upgrade = TRUE)
```

Then, to load the packages in R:

```r
library(dash)
```

That's it!

## Getting Started

<https://dash.plotly.com/r/layout>

The R package **dash** makes it easy to create reactive web applications powered by R. It provides an [R6](https://CRAN.R-project.org/package=R6) class, named `Dash`, which may be initialized via the `new()` method.

```r
library(dash)

app <- Dash$new()
```

Similar to [Dash for Python](https://github.com/plotly/dash) and [Dash for Julia](https://github.com/plotly/Dash.jl), every Dash for R application needs a layout (i.e., user interface) and a collection of callback functions which define the updating logic to perform when input value(s) change. Take, for instance, this basic example of formatting a string:

```r
library(dash)

dash_app() %>%
  set_layout(
    dccInput(id = "text", "sample"),
    div("CAPS: ", span(id = "out1")),
    div("small: ", span(id = "out2"))
  ) %>%
  add_callback(
    list(
      output("out1", "children"),
      output("out2", "children")
    ),
    input("text", "value"),
    function(text) {
      list(
        toupper(text),
        tolower(text)
      )
    }
  ) %>%
  run_app()
```

Here the `showcase = TRUE` argument opens a browser window and automatically loads the Dash app for you.

## Hello world example using `dccGraph`

```r
library(dash)

# Create a Dash app
app <- dash_app()

# Set the layout of the app
app %>% set_layout(
  h1('Hello Dash'),
  div("Dash: A web application framework for your data."),
  dccGraph(
    figure = list(
      data = list(
        list(
          x = list(1, 2, 3),
          y = list(4, 1, 2),
          type = 'bar',
          name = 'SF'
        ),
        list(
          x = list(1, 2, 3),
          y = list(2, 4, 5),
          type = 'bar',
          name = 'Montr\U{00E9}al'
        )
      ),
      layout = list(title = 'Dash Data Visualization')
    )
  )
)

# Run the app
app %>% run_app()
```

---

## Screenshot of "Hello World" app

![hello_dcc](https://user-images.githubusercontent.com/9809798/55428329-df18be80-5556-11e9-8d21-c55250621cd6.gif)
