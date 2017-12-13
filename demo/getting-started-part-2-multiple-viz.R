library(dasher)

dat <- read.csv(
  'https://gist.githubusercontent.com/chriddyp/cb5392c35661370d95f300086accea51/raw/8e0768211f6b747c0db42a9ce9a0937dafcbd8b2/indicators.csv',
  stringsAsFactors = FALSE
)

years <- unique(dat$Year)
indicators <- unique(dat$Indicator.Name)
options_indicators <- lapply(indicators, function(i) {
  list(label = i, value = i)
})
options_scale <- list(
  list(label = "Linear", value = "linear"),
  list(label = "Log", value = "log")
)

app <- Dash$new()
app$layout_set(

  htmlDiv(
    style = list(width = '48%', display = 'inline-block'),
    coreDropdown(
      id = 'xaxis-column',
      options = options_indicators,
      value = 'Fertility rate, total (births per woman)'
    ),
    coreRadioItems(
      id = 'xaxis-type',
      options = options_scale,
      value = 'linear',
      labelStyle = list(display = 'inline-block')
    )
  ),

  htmlDiv(
    style = list(width = '48%', float = "right", display = 'inline-block'),
    coreDropdown(
      id = 'yaxis-column',
      options = options_indicators,
      value = 'Life expectancy at birth, total (years)'
    ),
    coreRadioItems(
      id = 'yaxis-type',
      options = options_scale,
      value = 'linear',
      labelStyle = list(display = 'inline-block')
    )
  ),

  coreGraph(id = 'indicator-graphic'),

  coreSlider(
    id = 'year-slider',
    min = min(years),
    max = max(years),
    value = max(years),
    step = NA,
    marks = setNames(as.list(years), years)
  )
)

app$callback(
  function(xVar = input('xaxis-column'), yVar = input('yaxis-column'),
           xScale = input('xaxis-type'), yScale = input('yaxis-type'),
           year = input("year-slider")) {

    d <- dat[dat$Year %in% year, ]

    list(
      data = list(
        list(
          x = d[d$Indicator.Name %in% xVar, "Value", drop = TRUE],
          y = d[d$Indicator.Name %in% yVar, "Value", drop = TRUE],
          text = d[d$Indicator.Name %in% yVar, "Country.Name", drop = TRUE],
          mode = "markers",
          marker = list(
            size = 15,
            opacity = 0.5,
            line = list(width = 0.5, color = "white")
          )
        )
      ),
      layout = list(
        xaxis = list(title = xVar, type = xScale),
        yaxis = list(title = yVar, type = yScale),
        margin = list(l = 40, b = 40, t = 10, r = 0),
        hovermode = 'closest'
      )
    )

  }, output("indicator-graphic", "figure")
)

app$run_server(showcase = TRUE)
