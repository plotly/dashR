library(dasher)
library(quantmod)

# download ticker (only once!)
stocks <- c("Coke" = "COKE", "Tesla" = "TSLA", "Apple" = "AAPL")
getSymbols(stocks)

app <- Dash$new()

app$layout_set(
  coreDropdown(
    id = 'ticker-id',
    options = Map(function(x, y) list(label = x, value = y), names(stocks), stocks, USE.NAMES = FALSE),
    value = 'COKE'
  ),
  coreDropdown(
    id = 'column-id',
    options = lapply(c('Open', 'High', 'Low', 'Close', 'High - Low'), function(x) list(label = x, value = x)),
    value = 'Open'
  ),

  coreGraph(id = 'graph-multiple-dropdowns')
)

app$callback(
  function(ticker = input("ticker-id"), column = input("column-id")) {

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
  output('graph-multiple-dropdowns', 'figure')
)

app$run_server(showcase = TRUE)
