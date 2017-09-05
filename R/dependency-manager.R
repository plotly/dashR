# shouldn't be necessary, but might be useful if we want to dynamically insert
# dependencies when re-rendering htmlwidget components


# .dependency_factory <- function() {
#   .d <- NULL
#
#   list(
#     get = function() .d,
#     set = function(x) .d <<- x,
#     append = function(x) .d <<- c(.d, x)
#   )
# }
# .dependencies <- .dependency_factory()
