from selenium.webdriver.support.select import Select

app = """
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccInput(id='input-1-state', type='text', value='Montreal'),
      dccInput(id='input-2-state', type='text', value='Canada'),
      htmlButton(id='submit-button', n_clicks=0, children='Submit'),
      dccChecklist(id='count-inputs',
                   options=list(
                     list(label = 'Update state', value = 'states'),
                     list(label = 'Update clicks', value = 'clicks')
                   ),
                   value=list('states', 'clicks')
                   ),
      htmlDiv(id='output-state'),
      htmlDiv(id='output-clicks')
    )
  )
)

app$callback(output=
               list(
                 output(id = 'output-state', property = 'children'),
                 output(id = 'output-clicks', property = 'children')
                 ),
             list(input(id = 'submit-button', property = 'n_clicks'),
                  input(id = 'count-inputs', property = 'value'),
                  state(id = 'input-1-state', property = 'value'),
                  state(id = 'input-2-state', property = 'value')),
             function(n_clicks, count, input1, input2) {
               states <- sprintf("Input 1 is %s, and Input 2 is %s", input1, input2)
               clicks <- sprintf("The Button has been pressed %s times.", n_clicks)

               if (all(list("states", "clicks") %in% count)) {
                 return(list(states,
                             clicks
                             )
                        )
               } else if ("states" %in% count) {
                 return(list(states,
                             dashNoUpdate()
                 )
                 )
               } else if ("clicks" %in% count) {
                 return(list(dashNoUpdate(),
                             clicks
                 )
                 )
               } else {
                 return(list(dashNoUpdate(),
                             dashNoUpdate()))
               }
             }
)

app$run_server(debug=TRUE)
"""


def test_rsnu002_no_update_multiple(dashr):
    dashr.start_server(app)
    input1 = dashr.find_element("#input-1-state")
    dashr.clear_input(input1)
    input1.send_keys("Quebec")
    dashr.find_element("#submit-button").click()
    dashr.wait_for_text_to_equal(
        "#output-state",
        'Input 1 is Quebec, and Input 2 is Canada'
    )
    dashr.wait_for_text_to_equal(
        "#output-clicks",
        'The Button has been pressed 1 times.'
    )
    # Now only the Update clicks checkbox is active, so
    # state should not update
    dashr.find_elements("input[type='checkbox']")[0].click()
    dashr.clear_input(input1)
    input1.send_keys("Montreal")
    dashr.find_element("#submit-button").click()
    dashr.wait_for_text_to_equal(
        "#output-state",
        'Input 1 is Quebec, and Input 2 is Canada'
    )
    dashr.wait_for_text_to_equal(
        "#output-clicks",
        'The Button has been pressed 2 times.'
    )
    # Neither checkbox is selected, so neither output should update
    dashr.find_elements("input[type='checkbox']")[1].click()
    dashr.find_element("#submit-button").click()
    dashr.wait_for_text_to_equal(
        "#output-state",
        'Input 1 is Quebec, and Input 2 is Canada'
    )
    dashr.wait_for_text_to_equal(
        "#output-clicks",
        'The Button has been pressed 2 times.'
    )
    # Now both are selected, so both state and clicks should update
    dashr.find_elements("input[type='checkbox']")[0].click()
    dashr.find_elements("input[type='checkbox']")[1].click()
    dashr.wait_for_text_to_equal(
        "#output-state",
        'Input 1 is Montreal, and Input 2 is Canada'
    )
    dashr.wait_for_text_to_equal(
        "#output-clicks",
        'The Button has been pressed 3 times.'
    )
