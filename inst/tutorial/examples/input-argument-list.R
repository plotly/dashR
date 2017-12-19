# Programmatically creating callback inputs

library(dasher)

app <- Dash$new()

# generate 10 random ids
ids <- sapply(1:10, function(x) basename(tempfile("")))
options <- lapply(letters, function(x) list(value = x, label = x))

app$layout_set(
  htmlDiv(id = "all-ids"),
  htmlDiv(
    children = lapply(ids, function(x) {
      coreDropdown(id = x, options = options, value = sample(letters, 1))
    })
  )
)

inputs <- lapply(ids, function(x) input(x))
inputs <- setNames(inputs, LETTERS[1:10])

app$callback(
  function() {
    sprintf("The value of input A is '%s' & the value of input G is '%s'", A, G)
  },
  output("all-ids"),
  .dots = inputs
)


app



