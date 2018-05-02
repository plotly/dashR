library(dashR)

app <- Dash$new()

app$layout_set(
  coreUpload(htmlButton('Upload File')),

  htmlHr(),

  coreUpload(htmlA('Upload File')),

  htmlHr(),

  coreUpload(
    children = list(
      'Drag and Drop or ',
      htmlA('Select a File')
    ),
    style = list(
      width = '100%',
      height = '60px',
      lineHeight = '60px',
      borderWidth = '1px',
      borderStyle = 'dashed',
      borderRadius = '5px',
      textAlign = 'center'
    )
  )
)

# see upload-datafile.R or upload-image.R for examples of parsing upload content
app
