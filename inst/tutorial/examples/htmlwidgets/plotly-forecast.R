library(dashR)
library(dashRwidgets)
library(plotly)
library(forecast)

colorway <- c(
  "#8DD3C7", "#BC80BD", "#B3DE69", "#FDB462", "#FFFFB3", "#BEBADA",
  "#FB8072", "#80B1D3", "#FCCDE5", "#D9D9D9", "#CCEBC5", "#FFED6F"
)

# time series of the raw data
base <- txhousing %>%
  group_by(city) %>%
  plot_ly(x = ~date, y = ~median, key = ~city, hoverinfo = "x+y") %>%
  add_lines(alpha = 0.3) %>%
  add_annotations(
    text = "Each line is a city in Texas.\n Click to start a local analysis.",
    x = 2005, y = 200000,
    ax = -30, ay = -60
  ) %>%
  layout(colorway = colorway)

# fit an ets model
fit_model <- function(city = NULL) {
  idx <- txhousing$city %in% city
  y <- if (any(idx)) {
    txhousing$median[idx]
  } else {
    txhousing$median
  }
  series <- ts(y, frequency = 12, start = c(2000, 1), end = c(2015, 7))
  ets(series)
}

full_model <- fit_model()

cities <- unique(txhousing$city)

# fit every possible model ahead of time
models <- setNames(lapply(cities, fit_model), cities)

# To cache this result to disk
#if (!file.exists("models.rds")) {
#  models <- setNames(lapply(cities, fit_model), cities)
#  saveRDS(models, "models.rds")
#} else {
#  models <- readRDS("models.rds")
#}


# reusable function for adding forecast bands to a plotly plot
add_forecast <- function(plot, m, h = 48, levels = c(80, 95), fit_color = I("blue"), ...) {
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
      x = time(fore$mean), y = fore$mean, color = fit_color, name = "prediction",
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
  htmlDiv(id = "currentCity", `data-current-city` = NULL),
  htmlwidget(id = 'mainPlot', widget = base),
  htmlDiv(
    className = "three columns",
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
    className = "four columns",
    style = list(`margin-left` = "30px"),
    "Choose cities",
    coreDropdown(
      id = "city",
      options = unique(txhousing$city),
      value = NULL,
      multi = TRUE
    )
  )
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
  function(h = input("h"), levels = input("levels"), city = input("currentCity", "data-current-city")) {
    p <- add_forecast(base, full_model, h = h, levels = levels, fit_color = I(colorway[[1]]))
    if (!length(city)) return(p)

    p  <- style(p, opacity = 0.2, hoverinfo = "none")

    for (i in seq_along(city)) {
      d <- txhousing[txhousing$city %in% city[[i]], ]

      p <- p %>%
        add_lines(data = d, x = ~date, y = ~median, color = I(colorway[[i+1]]), opacity = 1) %>%
        add_forecast(models[[city[[i]]]], h = h, levels = levels, fit_color = I(colorway[[i+1]]))
    }
    p
  },
  output(id = 'mainPlot', property = "widget")
)


app$callback(
  function(click = input("mainPlot", "input_plotly_click"), city = input("city"), currentCity = state("currentCity", "data-current-city")) {
    unique(c(click[["key"]], city, currentCity))
  }, output("currentCity", "data-current-city")
)

app$callback(
  function(click = input("mainPlot", "input_plotly_click"), city = state("city")) {
    unique(c(click[["key"]], city))
  }, output("city", "value")
)



css <- dash_css(c("docs-base", "loading-state"))
pdeps <- plot_ly()[["dependencies"]]
app$dependencies_set(c(list(css), pdeps))
app
