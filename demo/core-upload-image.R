library(dasher)

app <- Dash$new()

app$layout_set(
  coreUpload(
    'Drag and Drop or ',
    htmlA('Select Files'),
    id = 'upload-image',
    style = list(
      width = '100%',
      height = '60px',
      lineHeight = '60px',
      borderWidth = '1px',
      borderStyle = 'dashed',
      borderRadius = '5px',
      textAlign = 'center',
      margin = '10px'
    ),
    # Allow multiple files to be uploaded
    multiple = TRUE
  ),
  htmlDiv(id = 'output-image-upload')
)

parse_image <- function(contents, filename, time) {
  browser()
  htmlDiv(
    htmlH5(filename),
    htmlH6(anytime::anytime(time)),
    htmlImg(src = contents),
    htmlHr(),
    htmlDiv('Raw Content'),
    htmlPre(contents[0:200])
  )
}

contents <- input("upload-image", "contents")
filename <- input("upload-image", "filename")
time <- input("upload-image", "last_modified")

app$callback(
  function(contents = contents, filename = filename, time = time) {

    Map(parse_image, contents, filename, time)

  }, output("output-image-upload")
)

app$run_server(showcase = TRUE)
