library(dasher)

# import Syntax() and Example()
source("components.R")
source("tools.R")
source("styles.R")

exfiles <- c(
  "graph-callbacks-simple.R",
  "getting-started-crossfilter.R",
  "crossfilter-recipe.R"
)
examples <- lapply(file.path("examples", exfiles), load_example)

ui <- htmlDiv(
  coreMarkdown(
    "
# Interactive Visualizations

`coreGraph()` renders interactive data visualizations using the open source
[plotly.js](https://github.com/plotly/plotly.js) JavaScript graphing
library. Plotly.js supports over 35 chart types and renders charts in
both vector-quality SVG and high-performance WebGL.

The `figure` argument in the `coreGraph()` component is
the same `figure` argument that is used by `plotly.py`, Plotly's
open source Python graphing library.
Check out the [plotly.py documentation and gallery](https://plot.ly/python)
to learn more.

Dash components are described declaratively by a set of attributes.
All of these attributes can be updated by callback functions but only
a subset of these attributes are updated through user interaction.
For example, when you click on an option in a `coreDropdown` component, the
`value` property of that component changes.

The `coreGraph()` component has four attributes that can change
through user-interaction: `hoverData`, `clickData`, `selectedData`,
`relayoutData`.
These properties update when you hover over points, click on points, or
select regions of points in a graph."),

  Syntax(
    examples[[1]]$source,
    "Here's an simple example that prints these attributes in the screen."
  ),
  Example(examples[[1]]$layout),

  htmlHr(),

  htmlH3('Update Graphs on Hover'),

  Syntax(
    examples[[2]]$source,
    "Let's update our world indicators example from the previous chapter by
updating time series when we hover over points in our scatter plot."
  ),
  Example(examples[[2]]$layout),

  coreMarkdown(
    "Try mousing over the points in the scatter plot on the left.
Notice how the line graphs on the right update based off of the point that
you are hovering over."
  ),

  htmlHr(),

  htmlH3('Generic Crossfilter Recipe'),

  Syntax(
    examples[[3]]$source,
    "Here's a slightly more generic example for crossfiltering across a six column
 data set. Each scatter plot's selection filters the underlying dataset."
  ),
  Example(examples[[3]]$layout),


  coreMarkdown(
"
Try clicking and dragging in any of the plots to filter different regions.
On every selection, the three graph callbacks are fired with the latest
selected regions of each plot. A pandas dataframe is fitered based off
of the selected points and the graphs are replotted with the selected
points highlighted and the selected region drawn as a dashed rectangle.

> As an aside, if you find yourself filtering and visualizing
highly-dimensional datasets, you should consider checking out the
[parallel coordinates](https://plot.ly/python/parallel-coordinates-plot/)
chart type."
  ),

  coreMarkdown(
    "
### Current Limitations

There are a few limitations in graph interactions right now.
- Clicking points does not accumulate: you cannot accumulate the number
of points that you have clicked on nor is there the concept of
'unselecting' a point. This issue is being worked on in [https://github.com/plotly/plotly.js/issues/1848](https://github.com/plotly/plotly.js/issues/1848).
- It is not currently possible to customize the style of the hover interactions or the select box.
This issue is being worked on in [https://github.com/plotly/plotly.js/issues/1847](https://github.com/plotly/plotly.js/issues/1847).

***

There's a lot that you can do with these interactive plotting features.
If you need help exploring your use case, open up a thread in the [Dash Community Forum](https://community.plot.ly/c/dash).

***

The final chapter of the Dash tutorial explains one last concept of dash:
Callbacks with `state()`. State is useful for UIs that contain forms or buttons."
  ),

  coreLink('Dash Tutorial Part 4. Callbacks With State', href = '/dasher/state')

)


app <- Dash$new()
app$layout_set(ui)
app
