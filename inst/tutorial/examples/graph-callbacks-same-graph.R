library(dasher)

dat <- read.csv(
  'https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv'
)
years <- unique(dat$year)

app <- Dash$new()
app$layout_set(
  coreGraph(id = 'graph-with-history'),
  coreSlider(
    id = 'year-slider-id',
    marks = years,
    value = 1952,
    min = min(years),
    max = max(years)
  )
)


app$callback(
  function(year = input('year-slider-id'),
           clickData = input('graph-with-history', 'clickData')) {

    d <- dat[dat$year == year, ]

    traces <- d %>%
      split(.$continent) %>%
      lapply(function(d) {
        list(
          x = d$gdpPercap,
          y = d$lifeExp,
          text = d$country,
          customdata = d$country,
          type = "scatter",
          mode = "markers",
          opacity = 0.7,
          marker = list(
            size = 10,
            opacity = 0.5,
            line = list(width = 0.5, color = "lightgrey")
          ),
          name = unique(d$continent)
        )
      }) %>%
      setNames(NULL)


    country <- clickData$points$customdata
    if (length(country)) {
      dcountry <- dat[dat$country %in% country, ]
      traces[[length(traces) + 1]] <- list(
        x = dcountry$gdpPercap,
        y = dcountry$lifeExp,
        hoverinfo = 'skip',
        mode = 'lines',
        line = list(width = 1, color = 'grey'),
        name = country
      )
    }


    layout <- list(
      title = "Click on a country to see it's path over time",
      xaxis = list(
        title = 'GDP per Capita',
        type = 'log',
        range = c(log10(10), log10(100*1000)),
        autorange = FALSE
      ),
      yaxis = list(
        title = 'Life Expectancy',
        range = c(20, 90),
        autorange = FALSE
      ),
      legend = list(
        x = 0, xanchor = 'left',
        y = 1, yanchor = 'top',
        bgcolor = 'rgba(255, 255, 255, 0.5)'
      ),
      margin = list(l = 40, r = 0, t = 40, b = 40),
      hovermode = 'closest',
      dragmode = 'select'
    )

    list(data = traces, layout = layout)

  }, output('graph-with-history', 'figure')
)

app$run_server(showcase = TRUE)
