library(dashR)

# import Syntax() and Example()
source("components.R")
source("tools.R")

examples = list(
  memoization = load_example('examples/performance_memoization.R'),
  performance_flask_caching = load_example('examples/performance_caching.R'),
  performance_flask_caching_dataset = load_example('examples/performance_caching_dataset.R')
)

ui <- list(
  coreMarkdown(
    "# Performance",
    "",
    "This chapter contains several recommendations for improving the performance of your dash apps.",
    "",
    "The main performance limitation of dash apps is likely the callbacks in the application code itself.",
    "If you can speed up your callbacks, your app will feel more responsive.",
    "",
    "### Memoization",
    "",
    "Since dashR's callbacks are functional in nature ",
    "(i.e., the output of a callback is completely determined by it's inputs),",
    "it's easy to add memoization caching. Memoization stores the results of a function ",
    "after it is called and re-uses the result if the function is called with the same arguments.",
    "",
    "To better understand how memoization works, let's start with a simple example. ",
    "Our currently suggested approach to memoization in **dashR** is to use the **memoise** package. ",
    "The package contains a function called `memoise()` which itself takes a function as input ",
    "and outputs a (memosied) function:"
  ),

  Syntax(
    "my_function <- memoise::memoise(
      function(input) {
        Sys.sleep(10)
        paste('Input was', input)
      }
    )"
  ),

  coreMarkdown(
    "Calling `my_function('test')` the first time will take 10 seconds.",
    "Calling it a second time with the same argument will take almost no time",
    "since the previously computed result was saved in memory and reused.",

    "***",

    "By default, the `memoise()` function caches the result in memory, ",
    "but that causes issues when deploying your dashR across multiple processes, ",
    "because those different processes don't share memory.",
    "",
    "Thankfully the **memoise** package offers several different ways to perform",
    "'external' (i.e., out-of-memory) caching as well as time-based expiry of the cache. ",
    "Time-based expiry is helpful if you want to update your data (clear your cache) every hour or every day.",
    "",
    "Here is an example using `cache_redis()`:",
  ),


  Syntax(examples[['performance_caching']]),

  coreMarkdown(
    "***",
    "Here is an example that **caches a dataset** instead of a callback.",
    "It uses the FileSystem cache, saving the cached results to the filesystem.",
    "This approach works well if there is one dataset that is used to update several callbacks."
  ),

  Syntax(examples[['performance_caching_dataset']]),

  coreMarkdown(
    "***",
    "",
    "### Graphs",
    "",
    "[Plotly.js](https://github.com/plotly/plotly.js) is pretty fast out of the box.",
    "",
    "Most plotly charts are rendered with SVG. This provides crisp rendering,",
    "publication-quality image export, and wide browser support.",
    "Unfortunately, rendering graphics in SVG can be slow for large datasets",
    "(like those with more than 15k points).",
    "To overcome this limitation, plotly.js has WebGL alternatives to",
    "some chart types. WebGL uses the GPU to render graphics.",
    "",
    "The high performance, WebGL alternatives include:",
    "- `scattergl`: A webgl implementation of the `scatter` chart type. [Examples](https://plot.ly/python/webgl-vs-svg/), [reference](https://plot.ly/python/reference/#scattergl)",
    "- `pointcloud`: A lightweight version of `scattergl` with limited customizability but even faster rendering. [Reference](https://plot.ly/python/reference/#pointcloud)",
    "- `heatmapgl`: A webgl implementation of the `heatmap` chart type. [Reference](https://plot.ly/python/reference/#heatmapgl)",


    "Currently, dash redraws the entire graph on update using the `plotly.js`",
    "`newPlot` call. The performance of updating a chart could be improved",
    "considerably by introducing `restyle` calls into this logic. If you or",
    "your company would like to sponsor this work,",
    "[get in touch](https://plot.ly/products/consulting-and-oem/).",

    "***",
    "",
    "### Sponsoring Performance Enhance",
    "There are many other ways that we can improve the performance of dash apps,",
    "like caching front-end requests, pre-filling the cache, improving plotly.js's",
    "webgl capabilities, reducing JavaScript bundle sizes, and more.",

    "Historically, many of these performance related features have been funded",
    "through company sponsorship. If you or your company would like to sponsor",
    "these types of enhancements, [please get in touch](https://plot.ly/products/consulting-and-oem/),",
    "we'd love to help."
  )
)




