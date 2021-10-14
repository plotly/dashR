from selenium.webdriver.support.select import Select
import time, os

app = """
library(dash)

app <- Dash$new()

app$layout(html$div(list(
    dccInput(id='input'),
    html$div(id='output-clientside'),
    html$div(id='output-serverside')
    )
    )
)

app$callback(
  output(id = "output-serverside", property = "children"),
  params = list(
    input(id = "input", property = "value")
  ),
  function(value) {
    sprintf("Server says %s", value)
  }
)

app$callback(
  output('output-clientside', 'children'),
  params=list(input('input', 'value')),
  "
  function (value) {
        return 'Client says \\"' + value + '\\"';
  }"
)

app$run_server()
"""


def test_rscc001_clientside(dashr):
    dashr.start_server(app)
    dashr.wait_for_text_to_equal(
        '#output-clientside',
        'Client says "undefined"'
    )
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Server says NULL"
    )
    input1 = dashr.find_element("#input")
    dashr.clear_input(input1)
    input1.send_keys("Clientside")
    dashr.wait_for_text_to_equal(
        '#output-clientside',
        'Client says "Clientside"'
    )
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Server says Clientside"
    )
    dashr.clear_input(input1)
    input1.send_keys("Callbacks")
    dashr.wait_for_text_to_equal(
        '#output-clientside',
        'Client says "Callbacks"'
    )
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Server says Callbacks"
    )
