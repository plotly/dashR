# By providing a function to layout_set
# https://plot.ly/dash/live-updates

library(dashR)

ui <- function() {
  htmlH1(paste("The time is:", Sys.time()))
}

app <- Dash$new()
app$layout_set(ui)
app
