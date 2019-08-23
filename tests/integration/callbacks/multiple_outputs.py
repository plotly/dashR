from selenium.webdriver.support.select import Select
import time

app = """
library(dash)
library(dashHtmlComponents)
library(dashCoreComponents)
library(plotly)
library(dashTable)

app <- Dash$new()       

app$layout(
  htmlDiv(list(
    htmlDiv(list(
      htmlH1('Multi output example'),
      dccDropdown(id='data-dropdown',
                  options = list(
                    list(label = 'Movies',
                         value = 'movies'),
                    list(label = 'Series',
                         value = 'series')
                    ),
                  value = 'movies')
    ),
    id = 'container',
    style = list(
      backgroundColor = '#ff998a'
      )
    ),
    htmlDiv(list(
      htmlH2('Make a selection from the dropdown menu.',
             id = 'text-box')
    )
    )
    )
    )
)

app$callback(output=list(
  output(id='text-box', property='children'),
  output(id='container', property='style')
),
params=list(
  input(id='data-dropdown', property='value')
),
function(value) {
  if (is.null(value)) {
    return(dashNoUpdate())
  }
  
  if (value == "series") {
    style <- list(
      backgroundColor = '#ff998a'
    )
  } else {
    style <- list(
      backgroundColor = '#fff289'
    )
  }
  
  return(list(sprintf("You have chosen %s.", value),
              style))
}
)

app$run_server(debug=TRUE)
"""


def test_rsnu001_multiple_outputs(dashr):
    dashr.start_server(app)
    dashr.find_element("#data-dropdown").click()
    dashr.find_elements("div.VirtualizedSelectOption")[1].click()
    dashr.wait_for_text_to_equal(
        "#text-box",
        "You have chosen series."
    )
    backgroundColor = dashr.find_element('#container').value_of_css_property("background-color")
    assert backgroundColor == "rgba(255, 153, 138, 1)"
    dashr.find_element("#data-dropdown").click()
    dashr.find_elements("div.VirtualizedSelectOption")[0].click()
    dashr.wait_for_text_to_equal(
        "#text-box",
        "You have chosen movies."
    )
    backgroundColor = dashr.find_element('#container').value_of_css_property("background-color")
    assert backgroundColor == "rgba(255, 242, 137, 1)"
