# dasher

An R implementation of the [dash](https://github.com/plotly/dash-renderer) protocol for authoring reactive web applications

## Installation

**dasher** isn't yet available on CRAN, but you may install the development version with:

```r
devtools::install_github("plotly/dasher")
```

## Getting Started

The R package **dasher** makes it easy to create reactive web applications powered by R. It provides an [R6](https://cran.r-project.org/web/packages/R6/index.html) class, named `Dash`, which may be initialized via the `new()` method.


```r
library(dasher)
app <- Dash$new()
```

Similar to [dash](https://github.com/plotly/dash), every **dasher** application needs a layout (i.e., user interface) and a collection of callback functions which define the updating logic to perform when input value(s) change. Take, for instance, this basic example of formatting a string 

```r
app$layout_set(
  core_input(id = 'inputID', value = 'initial value', type = "text"),
  html_div(id = 'outputID')
)
 
app$callback(
  function(x) paste("You've entered:", x),
  output("outputID"),
  input("inputID")
)

app$run_server(showcase = TRUE)
```

TODO: get into components, react, etc.

