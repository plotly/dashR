library(dashR)
library(plotly)
library(forecast)

# time series of the raw data
base <- txhousing %>%
  group_by(city) %>%
  crosstalk::SharedData$new(~city, "ctCity") %>%
  plot_ly(x = ~date, y = ~median) %>%
  add_lines(alpha = 0.3) %>%
  add_annotations(
    text = "Each line is a city in Texas.\n Click to start a local analysis.",
    x = 2005, y = 200000,
    ax = -30, ay = -60
  )

# fit an ets model
series <- ts(txhousing$median, frequency = 12, start = c(2000, 1), end = c(2015, 7))
m <- ets(series)

# reusable function for adding forecast bands to a plotly plot
add_forecast <- function(plot, m, h = 48, levels = c(80, 95), ...) {
  fore <- forecast(m, h = h, level = levels, ...)
  plot %>%
    add_ribbons(
      x = time(fore$mean), ymin = fore$lower[, 2], ymax = fore$upper[, 2],
      color = I("gray95"), name = paste0(min(levels), "% confidence"),
      inherit = FALSE
    ) %>%
    add_ribbons(
      x = time(fore$mean), ymin = fore$lower[, 1], ymax = fore$upper[, 1],
      color = I("gray80"), name = paste0(max(levels), "% confidence"),
      inherit = FALSE
    ) %>%
    add_lines(
      x = time(fore$mean), y = fore$mean, color = I("blue"), name = "prediction",
      inherit = FALSE
    ) %>%
    layout(
      showlegend = FALSE,
      xaxis = list(title = "")
    )
}


app <- Dash$new()

app$layout_set(
  htmlH2(id = "title"),
  Htmlwidget(id = 'mainPlot', widget = base),
  dashCrosstalkComponent::Crosstalk("ctCity"),
  htmlDiv(
    className = "four columns",
    "Confidence levels (%)",
    coreRangeSlider(
      id = "levels",
      marks = seq(50, 100, by = 5),
      min = 50,
      max = 100,
      value = c(80, 95)
    )
  ),
  htmlDiv(
    className = "four columns",
    style = list(`margin-left` = "30px"),
    "Forecast length (in months)",
    coreSlider(
      id = "h",
      marks = c(1, seq(10, 100, by = 20)),
      min = 1,
      max = 100,
      value = 48
    )
  ),
  htmlDiv(
    id = "cityBanner",
    className = "one row",
    style = list(`margin-top` = "100px")
  ),
  Htmlwidget(id = "cityPlot", widget = plotly_empty()),
  htmlDiv(id = "covariates")
)

app$callback(
  function(h = input("h"), levels = input("levels")) {
    paste0(
      "Forecast of median house prices ", h, " months in advance at ",
      min(levels), "% and ", max(levels), "% confidence"
    )
  },
  output(id = 'title')
)

app$callback(
  function(h = input("h"), levels = input("levels")) {
    add_forecast(base, m, h = h, levels = levels)
  },
  output(id = 'mainPlot', property = "widget")
)

app$callback(
  function(h = input("h"), levels = input("levels"), city = input("ctCity", "selection")) {
    if (!length(city)) return(NULL)

    list(
      htmlDiv(
        className = "four columns",
        htmlH2("Forecast specific to: ")
      ),
      htmlDiv(
        className = "six columns",
        style = list(`margin-top` = "50px"),
        coreDropdown(
          id = "cityWidget",
          options = unique(txhousing$city),
          value = city
        )
      )
    )
  },
  output(id = 'cityBanner')
)

app$callback(
  function(h = input("h"), levels = input("levels"), city = input("ctCity", "selection")) {
    if (!length(city)) return(NULL)

    cityData <- txhousing[txhousing[["city"]] %in% city, ]
    series <- ts(cityData$median, frequency = 12, start = c(2000, 1), end = c(2015, 7))
    m <- ets(series)

    plot_ly(cityData) %>%
      add_lines(x = ~date, y = ~median, alpha = 0.3) %>%
      add_forecast(m, h = h, levels = levels)
  },
  output(id = 'cityPlot', property = "widget")
)

css <- dash_css(c("docs-base", "loading-state"))
app$dependencies_set(css)
app$run_server()
