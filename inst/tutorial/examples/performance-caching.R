library(dashR)
library(memoise)

app <- Dash$new()

app$layout_set(
  htmlDiv(id = 'cache-memoized-children'),
  coreRadioItems(
    id = 'cache-memoized-dropdown',
    options = paste("Option", 1:4),
    value = 'Option 1'
  ),
  htmlDiv(sprintf('Results are cached for %s seconds', 10))
)

f <- function(val = input("cache-memoized-dropdown")) {
  Sys.sleep(3)
  sprintf("Selected %s at %s", val, Sys.time())
}

# TODO: how does memoise::timeout() work???
app$callback(
  memoise(f, cache = cache_redis()),
  output("cache-memoized-children")
)

app
