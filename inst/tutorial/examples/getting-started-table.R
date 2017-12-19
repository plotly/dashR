library(dasher)

app <- Dash$new()

d <- read.csv(
  'https://gist.githubusercontent.com/chriddyp/c78bf172206ce24f77d6363a2d754b59/raw/c353e8ef842413cae56ae3920b8fd78468aa4cb2/usa-agricultural-exports-2011.csv'
)

# note: there are much better alternatives, like dashTable or DT, but the
# point is you can roll up your own solution if you want
generate_table <- function(d, nrows = 10) {
  n <- min(nrows, nrow(d))
  rows <- lapply(seq(1, n), function(i) {
    htmlTr(children = lapply(as.character(d[i,]), htmlTd))
  })

  header <- htmlTr(children = lapply(names(d), htmlTh))

  htmlTable(
    children = c(list(header), rows)
  )
}


app$layout_set(
  htmlH4("US Agriculture Exports (2011)"),
  generate_table(d)
)


app$dependencies_set(dash_css())
app$run_server(showcase = TRUE)
