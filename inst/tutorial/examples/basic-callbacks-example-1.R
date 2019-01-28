library(dashR)
library(quantmod)

# download ticker data via quantmod
stocks <- c("Coke" = "COKE", "Tesla" = "TSLA", "Apple" = "AAPL")
getSymbols(stocks)

app <- Dash$new()

app$layout_set(
  coreDropdown(
    id = 'section3-dropdown',
    options = stocks,
    value = 'COKE'
  ),
  coreGraph(id = 'section3-graph')
)

app$callback(
  function(ticker = input("section3-dropdown")) {

    # Retrieve the relevant ticker based on the dropdown value
    d <- switch(ticker, AAPL = AAPL, TSLA = TSLA, COKE = COKE)

    # Construct a figure and return it to dash's front-end
    # This will end up updating the Graph's `figure` property
    # in the front-end of the application.
    list(
      data = list(
        list(x = index(d), y = as.numeric(d[, 4]))
      ),
      layout = list(title = ticker)
    )

  },
  output('section3-graph', 'figure')
)

app
