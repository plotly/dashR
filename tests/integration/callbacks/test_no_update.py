from selenium.webdriver.support.select import Select

app = """
library(dash)
library(dashHtmlComponents)
library(dashCoreComponents)

app <- Dash$new()

app$layout(
  htmlDiv(list(
    dccDropdown(options = list(
      list(label = "Red", value = "#FF0000"),
      list(label = "Green", value = "#00FF00"),      
      list(label = "Blue", value = "#0000FF"),
      list(label = "Do nothing", value = "nothing")
    ),
    id = "color-selector"),
    htmlDiv(id='message-box',
            children='Please select a colour choice from the dropdown menu.')
  )
  )
)

app$callback(output=list(id='message-box', property='children'),
             params=list(
               input(id='color-selector', property='value')),
             function(color)
             {
               if (color %in% c("#FF0000", "#00FF00", "#0000FF")) {
                 msg <- sprintf("The hexadecimal representation of your last chosen colour is %s",
                                color)
                 return(msg)
               } else {
                 return(dashNoUpdate())
               }
             }
)

app$run_server()
"""


def test_rsnu001_no_update(dashr):
    dashr.start_server(app)
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[0].click()
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen colour is #FF0000"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[3].click()
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen colour is #FF0000"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[1].click()
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen colour is #00FF00"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[3].click()
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen colour is #00FF00"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[2].click()
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen colour is #0000FF"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[3].click()
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen colour is #0000FF"
