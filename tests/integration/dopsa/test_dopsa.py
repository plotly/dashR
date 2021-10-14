app = """
library(dash)

app <- Dash$new()

app$layout(
  html$div(
    list(
      dccInput(id='input-1-state', type='text', value='Montreal'),
      dccInput(id='input-2-state', type='text', value='Canada'),
      html$button(id='submit-button', n_clicks=0, children='Submit'),
      html$div(id='output-state'),
      dccGraph(id='graph',
        figure=list(
          data=list(
            list(
              x=list(1, 2, 3),
              y=list(4, 1, 2),
              type='bar',
              name='SF'
            ),
            list(
              x=list(1, 2, 3),
              y=list(2, 4, 5),
              type='bar',
              name='Montreal'
            )
          ),
          layout = list(title='Dash Data Visualization')
        )
      )
    )
  )
)


app$callback(output(id = 'output-state', property = 'children'),
             list(input(id = 'submit-button', property = 'n_clicks'),
                  state(id = 'input-1-state', property = 'value'),
                  state(id = 'input-2-state', property = 'value')),
             function(n_clicks, input1, input2) {
               sprintf('The Button has been pressed \\'%s\\' times, Input 1 is \\'%s\\', and Input 2 is \\'%s\\'', n_clicks, input1, input2)  # noqa:E501
             })

app$run_server()
"""


# pylint: disable=c0301
def test_rsdp001_dopsa(dashr):
    dashr.start_server(app)
    dashr.wait_for_text_to_equal(
        "#output-state", "The Button has been pressed '0' times, Input 1 is 'Montreal', and Input 2 is 'Canada'", timeout=1  # noqa:E501
    )
    input1 = dashr.find_element("#input-2-state")
    dashr.clear_input(input1)
    input1.send_keys("Quebec")
    dashr.wait_for_text_to_equal(
        "#input-2-state", "Quebec", timeout=1
        )
    dashr.find_element("#submit-button").click()
    dashr.wait_for_text_to_equal(
        "#output-state", "The Button has been pressed '1' times, Input 1 is 'Montreal', and Input 2 is 'Quebec'", timeout=1  # noqa:E501
    )
    dashr.percy_snapshot("rsdp001 - dopsa")
