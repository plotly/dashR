# download any dataset (shipped in the datasets package) as a csv
# solution based on https://community.plot.ly/t/download-raw-data/4700/8

library(dasher)

# grab name/description for every dataset that ships with R
dat <- data(package = "datasets")[["results"]]
d <- dat[!duplicated(dat[, "Title"]), ]

app <- Dash$new()

app$layout_set(
  coreDropdown(
    id = "dataset",
    options = setNames(d[, "Item"], d[, "Title"]),
    value = "iris"
  ),
  htmlA(
    "Download", id = "download-link", href = "", target = "_blank"
  ),
  htmlDiv(id = "preview")
)

# update the name of the csv to be downloaded
app$callback(
  function(dataset = input("dataset")) {
    paste0(dataset, ".csv")
  }, output("download-link", "download")
)

# re-usable function to query data
# TODO: could memoise/cache this...
retrieve <- function(dataset = "iris") {
  d <- get(dataset, asNamespace("datasets"))
  as.data.frame(d)
}

# relay R console output
# TODO: provide a wrap_print() shortcut for this?
app$callback(
  function(dataset = input("dataset")) {
    d <- retrieve(dataset)
    htmlPre(paste(utils::capture.output(d), collapse = "\n"))
  }, output("preview")
)

app$callback(
  function(dataset = input("dataset")) {
    # note: this could be faster by avoiding writing to disk
    tmp <- tempfile()
    readr::write_csv(retrieve(dataset), tmp)
    content <- curl::curl_escape(paste(readLines(tmp), collapse = "\n"))
    paste0("data:text/csv;charset=utf-8,", content)
  }, output("download-link", "href")
)

app
