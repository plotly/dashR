from selenium.webdriver.support.select import Select
import time, os


app = """
library(dash)

app <- Dash$new(meta_tags = list(list(name = "description", content = "some content")))

app$layout(
  html$div(children = "Hello world!",
          id = "hello-div"
  )
)

app$run_server()
"""


def test_rstm001_test_meta(dashr):
    dashr.start_server(app)
    dashr.wait_for_text_to_equal(
        "#hello-div",
        "Hello world!"
    )
    assert dashr.find_element("meta[name='description']").get_attribute("content") == "some content"
    assert dashr.find_element("meta[charset='UTF-8']")
    assert dashr.find_element("meta[http-equiv='X-UA-Compatible']").get_attribute("content") == "IE=edge"


app2 = """
library(dash)

app <- Dash$new(meta_tags = list(list(charset = "ISO-8859-1"),
                                 list(name = "keywords", content = "dash,pleasant,productive"),
                                 list(`http-equiv` = 'content-type', content = 'text/html$')))

app$layout(
  html$div(children = "Hello world!",
          id = "hello-div"
  )
)

app$run_server()
"""


def test_rstm002_test_meta(dashr):
    dashr.start_server(app2)
    dashr.wait_for_text_to_equal(
        "#hello-div",
        "Hello world!"
    )
    assert dashr.find_element("meta[charset='ISO-8859-1']")
    assert dashr.find_element("meta[name='keywords']").get_attribute("content") == "dash,pleasant,productive"
    assert dashr.find_element("meta[http-equiv='content-type']").get_attribute("content") == "text/html$"
