library(dasher)

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

# see download-csv.R for an example of parsing upload content
app
