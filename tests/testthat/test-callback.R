context("callback")

test_that("Callback outputs can be provided with or without output function", {

  app <- Dash$new()

  app$layout(
    htmlDiv(
      list(
        dccInput(id='input-1-state', type='text', value='Montreal'),
        dccInput(id='input-2-state', type='text', value='Canada'),
        htmlButton(id='submit-button', n_clicks=0, children='Submit'),
        htmlDiv(id='output-state')
      )
    )
  )
  
  expect_silent(
    app$callback(output(id = 'output-state', property = 'children'),
                 list(input(id = 'submit-button', property = 'n_clicks'),
                      state(id = 'input-1-state', property = 'value'),
                      state(id = 'input-2-state', property = 'value')),
                 function(n_clicks, input1, input2) {
                   sprintf("The Button has been pressed \"%s\" times, Input 1 is \"%s\", and Input 2 is \"%s\"", n_clicks, input1, input2)
                 })
  )
  
  expect_silent(
    app$callback(output=list(id = 'output-state', property = 'children'),
                 list(input(id = 'submit-button', property = 'n_clicks'),
                      state(id = 'input-1-state', property = 'value'),
                      state(id = 'input-2-state', property = 'value')),
                 function(n_clicks, input1, input2) {
                   sprintf("The Button has been pressed \"%s\" times, Input 1 is \"%s\", and Input 2 is \"%s\"", n_clicks, input1, input2)
                 })
  )
})

test_that("Repeating outputs across callbacks yields an error", {
  
  app <- Dash$new()
  
  app$layout(
    htmlDiv(
      list(
        dccInput(id='input-1-state', type='text', value='Montreal'),
        dccInput(id='input-2-state', type='text', value='Canada'),
        htmlButton(id='submit-button', n_clicks=0, children='Submit'),
        dccInput(id='input-3-state', type='text', value='Quebec'),
        dccInput(id='input-4-state', type='text', value='Canada'),
        htmlButton(id='submit-button2', n_clicks=0, children='Submit'),
        htmlDiv(id='output-state'),
        htmlDiv(id='output-two')
      )
    )
  )
  
  app$callback(list(output(id = 'output-state', property = 'children'),
                    output(id = 'output-two', property = 'children')),
               list(input(id = 'submit-button', property = 'n_clicks'),
                    state(id = 'input-1-state', property = 'value'),
                    state(id = 'input-2-state', property = 'value')),
               function(n_clicks, input1, input2) {
                 sprintf("The Button has been pressed \"%s\" times, Input 1 is \"%s\", and Input 2 is \"%s\"", n_clicks, input1, input2)
               })
    
  expect_error(
    app$callback(list(output(id = 'output-state', property = 'children'),
                      output(id = 'output-three', property = 'children')),
                 list(input(id = 'submit-button2', property = 'n_clicks'),
                      state(id = 'input-3-state', property = 'value'),
                      state(id = 'input-4-state', property = 'value')),
                 function(n_clicks, input1, input2) {
                   sprintf("The Button has been pressed \"%s\" times, Input 1 is \"%s\", and Input 2 is \"%s\"", n_clicks, input3, input4)
                 }),
    "One or more outputs are duplicated across callbacks. Please ensure that all ID and property combinations are unique."
  )
})
