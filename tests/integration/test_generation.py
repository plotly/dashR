from selenium.webdriver.support.select import Select
import time, os


app = """
library(dash)
library(dashHtmlComponents)
library(dashGeneratorTestComponentNested)
library(dashGeneratorTestComponentStandard)

app <- Dash$new()
app$layout(htmlDiv(list(
    dgtc_standardMyComponent(id="standard", value="standard"),
    dgtc_nestedMyComponent(id="nested", value="nested")
)))

app$run_server()
"""


def test_gene001_simple_callback(dashr):
    dashr.start_server(app)

    assert dash_duo.wait_for_element("#standard").text == "Standard"
    assert dash_duo.wait_for_element("#nested").text == "Nested"