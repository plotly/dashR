library(dashR)

app <- Dash$new()

options <- c(
  `New York City` = 'NYC',
  `Montréal` = 'MTL',
  `San Francisco` = 'SF'
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
      marks = 1:6,
      value = 5
    )

  )
)

app$dependencies_set(dash_css())
app
