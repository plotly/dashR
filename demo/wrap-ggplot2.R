library(dasher)
library(ggplot2)
library(MASS)

app <- Dash$new()

marks <- seq(0, 1, 0.2)
marks <- setNames(as.list(marks), marks)
slider <- core_slider(
  id = 'n', min = 10, max = 1e4, value = 100, marks = marks
)

app$layout_set(
  html_div(id = 'plot'),
  html_div(
    id = "slider", slider,
    style = list(width = "50%")
  )
)


random_plot <- function(n = input("n")) {
  xy <- mvrnorm(n, c(0, 0), matrix(c(10, 3, 3, 2), 2, 2))
  d <- data.frame(x = xy[, 1], y = xy[, 2])
  base <- ggplot(d, aes(x, y)) +
    ggtitle(paste(n, "samples from a multivariate normal distribution"))
  gg <- if (n >= 1000) base + geom_hex() else base + geom_point(alpha = min(1, 100 / n))
  print(gg)
}

# TODO: why is the response header html???
app$callback(
  wrap_png(random_plot),
  output(id = 'plot')
)

app$run_server(showcase = TRUE)
