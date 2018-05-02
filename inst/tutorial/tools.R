# helper for obtaining the (dev version) of an app's layout
layout_get <- function(filename, dir = here::here("inst", "tutorial")) {
  withr::with_dir(dir, source(filename, local = TRUE)$value$layout_get())
}

load_example <- function(filename) {
  list(
    source = readLines(filename),
    layout = layout_get(filename)
  )
}
