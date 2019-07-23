app = """
library(dash)
library(dashHtmlComponents)
app <- Dash$new()

app$layout(htmlDiv(list(htmlDiv(id='container',children='Hello Dash for R testing'))))
app$run_server()
"""


def test_rstr001_r_with_string(dashr):
    dashr.start_server(app)
    assert dashr.find_element("#container").text == "Hello Dash for R testing"
    dashr.percy_snapshot("rstr001 - hello dash")
