library(dashR)

app <- Dash$new()
app$layout_set(
  coreUpload(
    htmlDiv("Drag and drop or ", htmlA("Select files")),
    id = "upload-data",
    multiple = TRUE,
    style = list(
      width = '100%',
      height = '60px',
      lineHeight = '60px',
      borderWidth = '1px',
      borderStyle = 'dashed',
      borderRadius = '5px',
      textAlign = 'center',
      margin = '10px'
    )
  ),
  htmlDiv(id = "output-data-upload"),
  htmlDiv(
    style = list(display = "none"),
    dashTable::DataTable(rows = list(list()))
  )
)

parse <- function(contents, filename, modified) {

  res <- base64enc::base64decode(
    sub("^data:.*;base64,", "", contents)
  )
  d <- read.csv(text = rawToChar(res))

  htmlDiv(
    htmlH5(filename),
    htmlH6(anytime::anytime(modified)),
    dashTable::DataTable(rows = d),
    htmlHr(),
    htmlDiv('Raw Content'),
    htmlPre(
      paste0(substr(contents, 1, 200), "..."),
      style = list(
        whiteSpace = 'pre-wrap',
        wordBreak = 'break-all'
      )
    )
  )
}

contents <- input("upload-data", "contents")
filename <- input("upload-data", "filename")
modified <- input("upload-data", "last_modified")

app$callback(
  function(contents = contents, filename = filename, modified = modified) {
    Map(parse, contents, filename, modified)
  },
  output("output-data-upload")
)


app$dependencies_set(dash_css())
app
