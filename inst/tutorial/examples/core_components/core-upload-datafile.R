library(dasher)
# TODO: create this package from dash_table_experiments
# library(dashTable)
library(rio)

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
  htmlDiv(id = "output-data-upload") #,htmlDiv(DataTable(rows = list(list())), style = list(display = "none"))
)

parse <- function(contents, filename, modified) {

  base64enc::base64decode(contents)
}


contents <- input("upload-data", "contents")
filename <- input("upload-data", "filename")
modified <- input("upload-data", "last_modified")

app$callback(
  function(contents = contents, filename = filename, modified = modified) {
    browser()

  },
  output("output-data-upload")
)


app$dependencies_set(dash_css())
app
