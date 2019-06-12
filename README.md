# Dash for R

#### Create beautiful, analytic applications in R.

🚧 Dash for R is a work-in-progress. Feel free to test the waters and submit issues. Expect the first supported release summer 2019.

Documentation: https://dashr-docs.herokuapp.com/

## Installation

**dash** isn't yet available on CRAN, but you may install the development versions of the package as well as Dash components from GitHub.

> 🛑 Make sure you're on at least version `3.0.2` of R. You can see what version of R you have by entering `version` in the R CLI. [CRAN](https://cran.r-project.org/bin/) is the easiest place to download the latest R version.

First, install `dash` dependencies from CRAN:
```r
install.packages(c("fiery", "routr", "reqres", "htmltools", "base64enc", "plotly", "mime"))
```

Installing the package and component libraries directly from GitHub using the `devtools` package is easy:

```r
install_github("plotly/dashR")
install_github("plotly/dash-html-components")
install_github("plotly/dash-core-components")
```

Now, load the packages in R:

```r
library(dash)
library(dashHtmlComponents)
library(dashCoreComponents)
```

That's it!

## Getting Started

The R package **dash** makes it easy to create reactive web applications powered by R. It provides an [R6](https://cran.r-project.org/web/packages/R6/index.html) class, named `Dash`, which may be initialized via the `new()` method.


```r
library(dash)
app <- Dash$new()
```

Similar to [Dash for Python](https://github.com/plotly/dash), every Dash for R application needs a layout (i.e., user interface) and a collection of callback functions which define the updating logic to perform when input value(s) change. Take, for instance, this basic example of formatting a string:

```r
app$layout(
  dccInput(id = "inputID", value = "initial value", type = "text"),
  htmlDiv(id = "outputID")
)

app$callback(output = list("outputID", "children"), 
             params = list(input("inputID", "value"),
                      state("inputID", "type")), 
  function(x, y) {
    sprintf("You've entered: '%s' into a '%s' input control", x, y)
  }
)

app$run_server(showcase = TRUE)
```

Here the `showcase = TRUE` argument opens a browser window and automatically loads the Dash app for you.

## Hello world example using `dccGraph`

```r
app <- Dash$new()

app$layout(
  dccInput(id = "graphTitle", 
            value = "Let's Dance!", 
            type = "text"),
  htmlDiv(id = "outputID"),
  dccGraph(id = "giraffe",
            figure = list(
              data = list(x = c(1,2,3), y = c(3,2,8), type = 'bar'),
              layout = list(title = "Let's Dance!")
            )
  )
)

app$callback(output = list(id = "giraffe", property = "figure"), 
             params = list(input("graphTitle", "value")),     
             function(newTitle) {
                 
                 rand1 <- sample(1:10, 1)
                 
                 rand2 <- sample(1:10, 1)
                 rand3 <- sample(1:10, 1)
                 rand4 <- sample(1:10, 1)
                 
                 x <- c(1,2,3)
                 y <- c(3,6,rand1)
                 y2 <- c(rand2,rand3,rand4)
                 
                 df = data.frame(x, y, y2)
                 
                 list(
                   data = 
                     list(            
                       list(
                         x = df$x, 
                         y = df$y, 
                         type = 'bar'
                       ),
                       list(
                         x = df$x, 
                         y = df$y2, 
                         type = 'scatter',
                         mode = 'lines+markers',
                         line = list(width = 4)
                       )                
                     ),
                   layout = list(title = newTitle)
                 )
               }
)

app$callback(output = list(id = "outputID", property = "children"), 
             params = list(input("graphTitle", "value"),
                           state("graphTitle", "type")), 
             function(x, y) {
                 sprintf("You've entered: '%s' into a '%s' input control", x, y)
             }
)

app$run_server(showcase = TRUE)
```

---

## Screenshot of "Hello World" app

![hello_dcc](https://user-images.githubusercontent.com/9809798/55428329-df18be80-5556-11e9-8d21-c55250621cd6.gif)
