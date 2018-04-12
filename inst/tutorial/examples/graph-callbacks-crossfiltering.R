library(dashR)

dat <- read.csv(
  'https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv'
)

years <- unique(dat$year)

ui <- htmlDiv(
  className = 'row',
  htmlDiv(
    className = 'six columns',
    coreGraph(id = 'graph-left', selectedData = list(points = list()))
  ),
  htmlDiv(
    className = 'six columns',
    coreGraph(id = 'graph-right', selectedData = list(points = list()))
  ),
  coreSlider(
    id = 'year-slider',
    marks = years,
    value = 1952,
    min = min(years),
    max = max(years)
  )
)

# Common figure generation function shared by both callbacks
create_figure <- function(year, selectedData, yaxis_column) {

  d <- dat[dat$year == year, ]

  countries <- selectedData$points$customdata
  opacities <- if (length(countries)) ifelse(d$country %in% countries, 1, 0.3) else 1

  traces <- d %>%
    split(.$continent) %>%
    lapply(function(d) {
      list(
        x = d$gdpPercap,
        y = d[[yaxis_column]],
        text = d$country,
        customdata = d$country,
        type = "scatter",
        mode = "markers",
        opacity = 0.7,
        marker = list(
          size = 10,
          opacity = opacities,
          line = list(width = 0.5, color = "lightgrey")
        ),
        name = unique(d$continent)
      )
    }) %>%
    setNames(NULL)

  layout <- list(
    title = "Click and drag on scatterplot to highlight countries",
    xaxis = list(
      title = 'GDP per Capita',
      type = 'log',
      range = c(log10(10), log10(120*1000)),
      autorange = FALSE
    ),
    annotations = list(list(
      x = 0, xref = 'paper', xanchor = 'left',
      y = 1, yref = 'paper', yancor = 'bottom',
      text = year,
      font = list(size = 16),
      showarrow = FALSE
    )),
    legend = list(
      x = 1, xanchor = 'right',
      y = 0, yanchor = 'bottom',
      bgcolor = 'rgba(255, 255, 255, 0.5)'
    ),
    margin = list(l = 40, r = 0, t = 40, b = 40),
    hovermode = 'closest',
    dragmode = 'lasso'
  )

  list(data = traces, layout = layout)
}

app <- Dash$new()
app$layout_set(ui)

app$callback(
  function(year = input('year-slider'),
           selectedData = input('graph-right', 'selectedData')) {

    fig <- create_figure(year, selectedData, 'lifeExp')
    fig$layout$yaxis <- list(
      title = 'Life Expectancy',
      range = c(10, 90),
      autorange = FALSE
    )
    fig
  }, output('graph-left', 'figure')
)

app$callback(
  function(year = input('year-slider'),
           selectedData = input('graph-left', 'selectedData')) {

    fig <- create_figure(year, selectedData, 'pop')
    fig$layout$yaxis <- list(
      title = 'Population',
      type = "log",
      range = c(log10(100), log10(10*1000*1000*1000)),
      autorange = FALSE
    )
    fig
  }, output('graph-right', 'figure')
)


app
