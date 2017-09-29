library(dasher)
library(ggplot2)
library(MASS)

app <- Dash$new()

app$layout_set(
  core_slider(id = 'n', min = 10, max = 1e6, value = 100),
  html_div(id = 'plot')
)

random_plot <- function(n = input("n")) {
  xy <- mvrnorm(n, c(0, 0), matrix(c(10,3,3,2), 2, 2))
  d <- data.frame(x = xy[, 1], y = xy[, 2])
  base <- ggplot(d, aes(x, y))
  if (n >= 1000) return(base + geom_hex())
  base + geom_point(alpha = min(1, 100 / n))
}
# TODO: why is the response header html???
app$callback(
  wrap_png(random_plot),
  output(id = 'plot')
)

app$run_server(showcase = TRUE)
