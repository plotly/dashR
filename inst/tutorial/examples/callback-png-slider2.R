library(dasher)
library(ggplot2)
library(MASS)

app <- Dash$new()

slider <- coreSlider(
  id = 'n', min = 10, max = 1e4, value = 1000, marks = c(10, 5000, 1e4)
)

app$layout_set(
  htmlDiv(id = 'plot'),
  htmlDiv(
    id = "slider",
    "Adjust slider to alter sample size:",
    slider,
    style = list(width = "50%")
  )
)

app$callback_png(
  function(n = input("n")) {
    xy <- mvrnorm(n, c(0, 0), matrix(c(10, 3, 3, 2), 2, 2))
    d <- data.frame(x = xy[, 1], y = xy[, 2])
    base <- ggplot(d, aes(x, y)) +
      ggtitle(paste(n, "samples from a multivariate normal distribution"))
    gg <- if (n >= 5000) base + geom_hex() else base + geom_point(alpha = min(1, 100 / n))
    print(gg)
  }, output(id = 'plot')
)

app
