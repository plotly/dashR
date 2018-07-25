library(dashR)
library(memoise)

app <- Dash$new()

htmlDiv(
  htmlDiv(id = 'cache-memoized-children'),
  coreRadioItems(
    id = 'cache-memoized-dropdown',
    options = paste("Option", 1:4),
    value = 'Option 1'
  ),
  htmlDiv(sprintf('Results are cached for %s seconds', timeout))
)


app$layout_set(ui)

f <- function(val = input("cache-memoized-dropdown")) {
  sprintf("Selected %s at %s", val, Sys.time())
}

app$callback(
  memoise(f, timeout(10), cache_redis()),
  output("cache-memoized-children")
)
