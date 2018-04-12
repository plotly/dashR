library(dashR)
library(magrittr)

app <- Dash$new()

dat <- read.csv(
  'https://gist.githubusercontent.com/chriddyp/5d1ea79569ed194d432e56108a04d188/raw/a9f9e8076b837d541398e999dcbac2b2826a81f8/gdp-life-exp-2007.csv'
)

traces <- dat %>%
  split(.$continent) %>%
  lapply(function(d) {
    list(
      x = d$gdp.per.capita,
      y = d$life.expectancy,
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

app$layout_set(
  coreGraph(
    id = 'life-exp-vs-gdp',
    figure = list(
      data = setNames(traces, NULL),
      layout = list(
        xaxis = list(type = 'log', title = 'GDP Per Capita'),
        yaxis = list(title = 'Life Expectancy'),
        margin = list(l = 40, b = 40, t = 10, r = 10),
        legend = list(x = 0, y = 1),
        hovermode = 'closest'
      )
    )

  )
)

app
