from selenium.webdriver.support.select import Select
from selenium.webdriver.support.ui import WebDriverWait

app = """
library(dash)
library(dashGeneratorTestComponentNested)
library(dashGeneratorTestComponentStandard)

app <- Dash$new()
app$layout(html$Div(list(
    dgtc_standardMyStandardComponent(id="standard", value="Standard"),
    dgtc_nestedMyNestedComponent(id="nested", value="Nested")
)))

app$run_server()
"""

styled_app = """
library(dash)
library(dashGeneratorTestComponentStandard)

app <- Dash$new()
app$layout(html$Div(list(
    html$Button(id='btn', list('Click')),
    html$Div(id='container')
)))

app$callback(output(id = 'container', property = 'children'),
    list(input(id = 'btn', property = 'n_clicks')),
    function(n_clicks) {
        if (is.null(unlist(n_clicks))) {
            return(dashNoUpdate())
        } else {
            return(list(dgtc_standardMyStandardComponent(id="standard", value="Standard", style=list(fontFamily="godfather"))))
        }
    })

app$run_server()
"""


def test_gene001_simple_callback(dashr):
    dashr.start_server(app)

    assert dashr.wait_for_element("#standard").text == "Standard"
    assert dashr.wait_for_element("#nested").text == "Nested"

    dashr.percy_snapshot("gene001-simple-callback")


def test_gene002_arbitrary_resources(dashr):
    dashr.start_server(styled_app)

    assert (
        dashr.driver.execute_script("return document.fonts.check('1em godfather')")
        is False
    )

    dashr.wait_for_element("#btn").click()
    assert dashr.wait_for_element("#standard").text == "Standard"

    WebDriverWait(dashr.driver, 10).until(
        lambda _: dashr.driver.execute_script("return document.fonts.check('1em godfather')") is True,
    )

    dashr.percy_snapshot("gene002-arbitrary-resource")
