from selenium.webdriver.support.select import Select
import time, os


app = """
library(dash)
library(dashHtmlComponents)
library(dashGeneratorTestComponentNested)
library(dashGeneratorTestComponentStandard)

app <- Dash$new()
app$layout(htmlDiv(list(
    dgtc_standardMyStandardComponent(id="standard", value="Standard"),
    dgtc_nestedMyNestedComponent(id="nested", value="Nested")
)))

app$run_server()
"""

styled_app = """
library(dash)
library(dashHtmlComponents)
library(dashGeneratorTestComponentStandard)

app <- Dash$new()
app$layout(htmlDiv(list(
    dgtc_standardMyStandardComponent(id="standard", value="Standard", style=list("font-family": "godfather")),
)))

app$run_server()
"""


def test_gene001_simple_callback(dashr):
    dashr.start_server(app)

    assert dashr.wait_for_element("#standard").text == "Standard"
    assert dashr.wait_for_element("#nested").text == "Nested"

    dashr.percy_snapshot("gene001-simple-callback")


def test_gene002_arbitrary_resources(dashr):
    dashr.start_server(app)

    assert dashr.wait_for_element("#standard").text == "Standard"

    dashr.percy_snapshot("gene002-arbitrary-resource")