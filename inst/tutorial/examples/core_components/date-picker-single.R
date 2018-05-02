library(dashR)
library(lubridate)

app <- Dash$new()
app$layout_set(
  coreDatePickerSingle(
    id = 'my-date-picker-single',
    min_date_allowed = ymd("1995-08-05"),
    max_date_allowed = ymd("2017-09-19"),
    initial_visible_month = ymd("2017-08-05"),
    date = ymd("2017-08-25")
  ),
  htmlDiv(id = 'output-container-date-picker-single')
)

# helper function for formatting date input values
# note that dashR uses JSON to pass values from server to client
# and JSON has no native date-time data structure, so the client will
# receive a string, which we convert to a date, then format.
format_date <- function(x) {
  if (is.character(x)) format(ymd(x), "%B %d, %Y") else x
}

app$callback(
  function(date = input('my-date-picker-single', 'date')) {
    if (!length(date)) return("Pick a date")
    paste('You have selected:', format_date(date))
  },
  output("output-container-date-picker-single")
)

app
