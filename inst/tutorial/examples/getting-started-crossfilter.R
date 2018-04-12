library(dashR)

dat <- read.csv(
  'https://gist.githubusercontent.com/chriddyp/cb5392c35661370d95f300086accea51/raw/8e0768211f6b747c0db42a9ce9a0937dafcbd8b2/indicators.csv'
)

indicators <- unique(dat$Indicator.Name)

xControls <- htmlDiv(
  style = list(width = '49%', display = 'inline-block'),
  coreDropdown(
    id = 'crossfilter-xaxis-column',
    options = indicators,
    value = 'Fertility rate, total (births per woman)'
  ),
  coreRadioItems(
    id = 'crossfilter-xaxis-type',
    options = c('Linear' = 'linear', 'Log' = 'log'),
    value = 'Linear',
    labelStyle = list(display = 'inline-block')
  )
)

yControls <- htmlDiv(
  style = list(width = '49%', float = 'right', display = 'inline-block'),
  coreDropdown(
    id = 'crossfilter-yaxis-column',
    options = indicators,
    value = 'Life expectancy at birth, total (years)'
  ),
  coreRadioItems(
    id = 'crossfilter-yaxis-type',
    options = c('Linear' = 'linear', 'Log' = 'log'),
    value = 'Linear',
    labelStyle = list(display = 'inline-block')
  )
)

controls <- htmlDiv(
  style = list(
    borderBottom = 'thin lightgrey solid',
    backgroundColor = 'rgb(250, 250, 250)',
    padding = '10px 5px'
  ),
  xControls,
  yControls
)

ui <- htmlDiv(
  controls,

  htmlDiv(
    style = list(width = '49%', display = 'inline-block', padding = '0 20'),
    coreGraph(
      id = 'crossfilter-indicator-scatter',
      hoverData = list(points = list(list(text = 'Japan')))
    )
  ),
  htmlDiv(
    style = list(width = '49%', display = 'inline-block'),
    coreGraph(id = 'x-time-series'),
    coreGraph(id = 'y-time-series')
  ),

  htmlDiv(
    style = list(width = '49%', padding = '0px 20px 20px 20px'),
    coreSlider(
      id = 'crossfilter-year--slider',
      min = min(dat$Year),
      max = max(dat$Year),
      value = max(dat$Year),
      step = NA,
      marks = unique(dat$Year)
    )
  )
)

app <- Dash$new()
app$layout_set(ui)

# input values (re-used in callbacks)
xVar <- input('crossfilter-xaxis-column')
yVar <- input('crossfilter-yaxis-column')
xType <- input('crossfilter-xaxis-type')
yType <- input('crossfilter-yaxis-type')
year <- input('crossfilter-year--slider')
hoverData <- input('crossfilter-indicator-scatter', 'hoverData')


# update the scatterplot
app$callback(
  function(xVar = xVar, yVar = yVar, xType = xType, yType = yType, year = year) {

    d <- dat[dat[["Year"]] %in% year, ]
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
        xaxis = list(title = xVar, type = xType),
        yaxis = list(title = yVar, type = yType),
        margin = list(l = 40, b = 40, t = 10, r = 0),
        hovermode = 'closest'
      )
    )
  }, output('crossfilter-indicator-scatter', 'figure')
)

create_time_series <- function(dat, type, title) {
  list(
    data = list(list(
      x = dat$Year,
      y = dat$Value,
      mode = "lines+markers"
    )),
    layout = list(
      height = 225,
      margin = list(l = 20, b = 30, r = 10, t = 10),
      xaxis = list(showgrid = FALSE),
      yaxis = list(type = type),
      annotations = list(list(
        x = 0,
        y = 0.85,
        xanxhor = "left",
        yanchor = "bottom",
        xref = "paper",
        yref = "paper",
        showarrow = FALSE,
        align = "left",
        bgcolor = "rgba(255, 255, 255, 0.5)",
        text = title
      ))
    )
  )
}

# update the x variable time series
app$callback(
  function(hoverData = hoverData, xVar = xVar, xType = xType) {

    country <- hoverData$points$text

    idx <- dat$Country.Name %in% country  &
      dat$Indicator.Name %in% xVar

    title <- sprintf("  <b>%s</b> <br> %s", country, xVar)

    create_time_series(dat[idx, ], xType, title)

  }, output('x-time-series', 'figure')
)


# update the x variable time series
app$callback(
  function(hoverData = hoverData, yVar = yVar, yType = yType) {

    country <- hoverData$points$text

    idx <- dat$Country.Name %in% country &
      dat$Indicator.Name %in% yVar

    create_time_series(dat[idx, ], yType, yVar)

  }, output('y-time-series', 'figure')
)

app
