from selenium.webdriver.support.select import Select
import time

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
    htmlButton(children = "Select all the colors!",
               id = "multi-selector"
               ),
    htmlDiv(id='message-box',
            children='Please select a color choice from the dropdown menu.'),
    htmlDiv(id='message-box2',
            children=' ')
  )
  )
)

app$callback(output=list(id='message-box2', property='children'),
             params=list(
               input(id='multi-selector', property='n_clicks')),
             function(n_clicks)
             {
               # if button has been clicked, n_clicks is numeric()
               # on first launch of callback at layout initialization,
               # value of n_clicks will be list(NULL), which is not
               # comparable using >, < or =; hence the is.numeric()
               # check
               if (is.numeric(n_clicks) && n_clicks >= 1)
               {
                 # return a vector to ensure that the check for
                 # class(x) == "no_update" isn't made for objects
                 # where length(x) > 1
                 return(c("Multiple color values: ", 
                          "#FF0000, ", 
                          "#00FF00, ", 
                          "#0000FF ", 
                          "returned!")
                        )
               }
             }
)

app$callback(output=list(id='message-box', property='children'),
             params=list(
               input(id='color-selector', property='value')),
             function(color)
             {
               if (color %in% c("#FF0000", "#00FF00", "#0000FF")) {
                 msg <- sprintf("The hexadecimal representation of your last chosen color is %s",
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
    dashr.wait_for_text_to_equal(
        "#message-box",
        "The hexadecimal representation of your last chosen color is #FF0000"
    )
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[3].click()
    time.sleep(1)
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen color is #FF0000"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[1].click()
    dashr.wait_for_text_to_equal(
        "#message-box",
        "The hexadecimal representation of your last chosen color is #00FF00"
    )
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[3].click()
    time.sleep(1)
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen color is #00FF00"
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[2].click()
    dashr.wait_for_text_to_equal(
        "#message-box",
        "The hexadecimal representation of your last chosen color is #0000FF"
    )
    dashr.find_element("#color-selector").click()
    dashr.find_elements("div.VirtualizedSelectOption")[3].click()
    time.sleep(1)
    assert dashr.find_element("#message-box").text == "The hexadecimal representation of your last chosen color is #0000FF"
    dashr.find_element("#multi-selector").click()
    dashr.wait_for_text_to_equal(
        "#message-box2",
        "Multiple color values: #FF0000, #00FF00, #0000FF returned!"
    )
