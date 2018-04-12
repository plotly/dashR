# adapted from  https://github.com/rstudio/ggvis/blob/master/demo/tourr.r
library(dashR)
library(tourr)

mat <- rescale(as.matrix(flea[1:6]))
tour <- new_tour(mat, grand_tour(), NULL)

app <- Dash$new()

app$layout_set(
  coreGraph(
    id = 'live-update-graph',
    animate = TRUE,
    animation_options = list(
      frame = list(redraw = FALSE),
      mode = "afterall"
    )
  ),
  coreInterval(
    id = 'interval-component',
    interval = 30
  )
)

app$callback(
  function(n_intervals = input("interval-component", "n_intervals")) {

    step <- tour(2 / 30)
    d <- data.frame(center(mat %*% step$proj), species = flea$species)
    print(n_intervals)
    browser()

    list(
      data = list(list(
        x = d[, 1],
        y = d[, 2],
        mode = "markers",
        type = "scatter"
      )),
      layout = list(
        title = paste("A grand tour of flea data", n_intervals),
        xaxis = list(scaleanchor = "y"),
        height = 600
      )
    )

  }, output("live-update-graph", "figure")
)

app
