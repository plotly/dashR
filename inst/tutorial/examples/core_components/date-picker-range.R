library(dasher)
library(lubridate)

app <- Dash$new()
app$layout_set(
  coreDatePickerRange(
    id = 'my-date-picker-range',
    min_date_allowed = ymd("1995-08-05"),
    max_date_allowed = ymd("2017-09-19"),
    initial_visible_month = ymd("2017-08-05"),
    end_date = ymd("2017-08-25")
  ),
  htmlDiv(id = 'output-container-date-picker-range')
)

# helper function for formatting start/end input values
# note that dasher uses JSON to pass values from server to client
# and JSON has no native date-time data structure, so the client will
# receive a string, which we convert to a date, then format.
format_date <- function(x) {
  if (is.character(x)) format(ymd(x), "%B %d, %Y") else x
}

# define callback inputs
start <- input('my-date-picker-range', 'start_date')
end <- input('my-date-picker-range', 'end_date')

app$callback(
  function(start = start, end = end) {
    msg <- 'You have selected: '
    if (length(start)) {
      msg <- paste(msg, 'Start date: ', format_date(start), ' | ')
    }
    if (length(end)) {
      msg <- paste(msg, 'End date: ', format_date(end))
    }
    if (msg != 'You have selected: ') msg else 'Select a date'
  },
  output("output-container-date-picker-range")
)

app
