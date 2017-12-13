library(dasher)

app <- Dash$new()

options <- list(
  list(label = 'New York City', value = 'NYC'),
  list(label = 'Montréal', value = 'MTL'),
  list(label = 'San Francisco', value = 'SF')
)

app$layout_set(

  htmlDiv(
    style = list(columnCount = 2),

    htmlLabel('Dropdown'),
    coreDropdown(
      options = options,
      value = 'MTL'
    ),

    htmlLabel('Multi-Select Dropdown'),
    coreDropdown(
      options = options,
      value = c('MTL', 'SF'),
      multi = TRUE
    ),

    htmlLabel('Radio Items'),
    coreRadioItems(
      options = options,
      value = 'MTL'
    ),

    htmlLabel('Checkboxes'),
    coreChecklist(
      options = options,
      value = c('MTL', 'SF')
    ),

    htmlLabel('Text Input'),
    coreInput(value = 'MTL', type = 'text'),

    htmlLabel('Slider'),
    coreSlider(
      min = 0,
      max = 9,
      marks = setNames(as.list(1:6), 1:6),
      value = 5
    )

  )
)

app$dependencies_set(dash_css())
app$run_server(showcase = TRUE)
