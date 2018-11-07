# dashR

An interface to the [dash](https://github.com/plotly/dash-renderer) ecosystem for authoring reactive web applications.

## Installation

**dashR** isn't yet available on CRAN, but you may install the development versions of the package as well as Dash components from GitHub.

> 🛑 Make sure you're on at least version `3.5` of R. You can see what version of R you have by entering `version` in the R CLI. [CRAN](https://cran.r-project.org/bin/) is the easiest place to download the latest R version.

First, clone the publicly available Git repositories to the local directory of your choice, checkout the R branch, then install:

```r
git clone https://github.com/plotly/dash-html-components
cd dash-html-components
git checkout R
R CMD INSTALL .
cd ..
git clone https://github.com/plotly/dash-core-components
cd dash-core-components
git checkout R
R CMD INSTALL .
```

Next, clone the private (for now) Git repositories to the local directory of your choice:
```r
git clone git@github.com:plotly/dashR.git
git clone git@github.com:plotly/dashRtranspile.git
```

Now, from within R, install dashR dependencies from CRAN:
```r
install.packages(c("fiery", "routr", "reqres"))
```

Finally, install dashR by supplying your local package path, then load the package:
```r
install.packages("/Users/testuser/plotly/dashR", repos=NULL, type="source")
library(dashR)
```

That's it!

## Getting Started

The R package **dashR** makes it easy to create reactive web applications powered by R. It provides an [R6](https://cran.r-project.org/web/packages/R6/index.html) class, named `Dash`, which may be initialized via the `new()` method.


```r
library(dashR)
app <- Dash$new()
```

Similar to [dash](https://github.com/plotly/dash), every **dashR** application needs a layout (i.e., user interface) and a collection of callback functions which define the updating logic to perform when input value(s) change. Take, for instance, this basic example of formatting a string 

```r
app$layout_set(
  coreInput(id = "inputID", value = "initial value", type = "text"),
  htmlDiv(id = "outputID")
)

app$callback(
  function(x = input("inputID"), y = input("inputID", "type")) {
    sprintf("You've entered: '%s' into a '%s' input control", x, y)
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
```

## Hello world example using `coreGraph`

```r
app <- Dash$new()

app$layout_set(
  coreInput(id = "graphTitle", 
        value = "Let's Dance!", 
        type = "text"),
  htmlDiv(id = "outputID"),
  coreGraph(id = "giraffe",
        figure = list(
            data = list(x = c(1,2,3), y = c(3,2,8), type = 'bar'),
            layout = list(title = "Let's Dance!")
        )
  )
)

app$callback(    
  function(newTitle = input("graphTitle", "value")) {

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
  },
  output("giraffe", "figure")
)

app$callback(
  function(x = input("graphTitle"), y = input("graphTitle", "type")) {
    sprintf("You've entered: '%s' into a '%s' input control", x, y)
  },
  output("outputID")
)

app$run_server(showcase = TRUE)
```

More examples in the [examples folder](https://github.com/plotly/dashR/tree/master/inst/tutorial/examples)

## TODO

Get into components, React, etc.

