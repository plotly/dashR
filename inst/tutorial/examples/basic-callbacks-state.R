library(dashR)
library(quantmod)

# download ticker (only once!)
stocks <- c("Coke" = "COKE", "Tesla" = "TSLA", "Apple" = "AAPL")
getSymbols(stocks)

app <- Dash$new()

app$layout_set(
  coreDropdown(
    id = 'ticker-id',
    options = stocks,
    value = 'COKE'
  ),
  coreDropdown(
    id = 'column-id',
    options = c('Open', 'High', 'Low', 'Close', 'High - Low'),
    value = 'Open'
  ),
  htmlButton('Update Graph', id = 'button-id'),
  coreGraph(id = 'graph-id')
)

# When the value of a state object changes, it doesn't trigger the callback
# function to re-execute (similar to using isolate() in shiny)
app$callback(
  function(ticker = input("ticker-id"), column = input("column-id"),
           n_clicks = input("button-id", "n_clicks")) {

    d <- switch(ticker, AAPL = AAPL, TSLA = TSLA, COKE = COKE)

    y <- if (identical(column, 'High - Low')) {
      d[, paste(ticker, "High", sep = ".")] - d[, paste(ticker, "Low", sep = ".")]
    } else {
      d[, paste(ticker, column, sep = ".")]
    }

    list(
      data = list(
        list(x = index(d), y = as.numeric(y))
      ),
      layout = list(title = ticker)
    )

  },
  output("graph-id", "figure")
)

app
