library(dashR)

styles <- list(
  pre = list(
    border = 'thin lightgrey solid',
    overflowX = 'scroll'
  )
)

graph <- coreGraph(
  id = 'basic-interactions',
  figure = list(
    data = list(
      list(
        x = c(1, 2, 3, 4),
        y = c(4, 1, 3, 5),
        text = c('a', 'b', 'c', 'd'),
        customdata = c('c.a', 'c.b', 'c.c', 'c.d'),
        name = 'Trace 1',
        mode = 'markers',
        marker = list(size = 12)
      ),
      list(
        x = c(1, 2, 3, 4),
        y = c(9, 4, 1, 4),
        text = c('w', 'x', 'y', 'z'),
        customdata = c('c.w', 'c.x', 'c.y', 'c.z'),
        name = 'Trace 2',
        mode = 'markers',
        marker = list(size = 12)
      )
    )
  )
)

hover <- htmlDiv(
  className = 'row',
  htmlDiv(
    className = 'three columns',
    coreMarkdown(
      "**Hover Data**",
      "",
      "Mouse over values in the graph."
    )
  ),
  htmlPre(id = 'hover-data', style = styles$pre)
)

click <- htmlDiv(
  className = 'three columns',
  coreMarkdown(
    "**Click Data**",
    "",
    "Click on points in the graph."
  ),
  htmlPre(id = 'click-data', style = styles$pre)
)

selected <- htmlDiv(
  className = 'three columns',
  coreMarkdown(
    "**Selection Data**",
    "",
    "Choose the lasso or rectangle tool in the graph's menu bar and then select points in the graph."
  ),
  htmlPre(id = 'selected-data', style = styles$pre)
)

relayout <- htmlDiv(
  className = 'three columns',
  coreMarkdown(
    "**Zoom and Relayout Data**",
    "",
    "Click and drag on the graph to zoom or click on the zoom buttons in the",
    "graph's menu bar. Clicking on legend items will also fire this event."
  ),
  htmlPre(id = 'relayout-data', style = styles$pre)
)


app <- Dash$new()

app$layout_set(graph, hover, click, selected, relayout)

app$callback_print(
  function(hoverData = input('basic-interactions', 'hoverData')) {
    hoverData
  }, output('hover-data')
)

app$callback_print(
  function(clickData = input('basic-interactions', 'clickData')) {
    clickData
  }, output('click-data')
)

app$callback_print(
  function(selectedData = input('basic-interactions', 'selectedData')) {
    selectedData
  }, output('selected-data')
)

app$callback_print(
  function(relayoutData = input('basic-interactions', 'relayoutData')) {
    relayoutData
  }, output('relayout-data')
)

app
