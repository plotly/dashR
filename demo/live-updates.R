library(dasher)

app <- Dash$new()

app$layout_set(
  coreGraph(id = 'live-update-graph'),
  coreInterval(
    id = 'interval-component',
    interval = 5000
  )
)

x <- seq(1, 10, length.out = 100)

app$callback(
  function(n = input("interval-component", "n_intervals")) {

    # TODO: what???
    print(n)

    list(
      data = list(list(
        x = x + n / 10,
        y = sin(x + n / 10),
        mode = "lines",
        type = "scatter"
      )),
      layout = list(
        title = paste("Number of updates", n)
      )
    )

  }, output("live-update-graph", "figure")
)

app$run_server(showcase = TRUE)
