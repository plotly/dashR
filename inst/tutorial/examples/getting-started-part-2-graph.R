library(dashR)
library(magrittr)

dat <- read.csv(
  'https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv'
)
years <- unique(dat$year)

app <- Dash$new()

app$layout_set(
  coreGraph(id = 'graph-with-slider'),
  coreSlider(
    id = 'year-slider',
    min = min(years),
    max = max(years),
    value = min(years),
    step = NA,
    marks = years
  )
)

app$callback(
  function(year = input('year-slider')) {

    d <- dat[dat$year %in% year, ]

    traces <- d %>%
      split(.$continent) %>%
      lapply(function(d) {
        list(
          x = d$gdpPercap,
          y = d$lifeExp,
          text = d$country,
          type = "scatter",
          mode = "markers",
          opacity = 0.7,
          marker = list(
            size = 15,
            line = list(width = 0.5, color = "white")
          ),
          name = unique(d$continent)
        )
      })

    list(
      data = setNames(traces, NULL),
      layout = list(
        xaxis = list(type = 'log', title = 'GDP Per Capita'),
        yaxis = list(title = 'Life Expectancy'),
        margin = list(l = 40, b = 40, t = 10, r = 10),
        legend = list(x = 0, y = 1),
        hovermode = 'closest'
      )
    )

  }, output("graph-with-slider", "figure")
)

app
