named_app = """
library(dash)
app <- Dash$new()

app$title("Testing")

app$layout(html$Div(list(html$Div(id='container',children='Hello Dash for R testing'))))
app$run_server()
"""

app_with_template = """
library(dash)
app <- Dash$new()

string <-
  "<!DOCTYPE html>
        <html>
          <head>
            {%meta_tags%}
            <title>Testing Again</title>
            {%favicon%}
            {%css_tags%}
          </head>
          <body>
            {%app_entry%}
            <footer>
              {%config%}
              {%scripts%}
            </footer>
          </body>
        </html>"

app$index_string(string)

app$layout(html$Div(list(html$Div(id='container',children='Hello Dash for R testing'))))
app$run_server()
"""


def test_rapp001r_with_appname(dashr):
    dashr.start_server(named_app)
    dashr.wait_for_text_to_equal(
        "#container", "Hello Dash for R testing", timeout=1
    )
    assert dashr.find_element("title").get_attribute("text") == "Testing"


def test_rapp002_r_with_template(dashr):
    dashr.start_server(app_with_template)
    dashr.wait_for_text_to_equal(
        "#container", "Hello Dash for R testing", timeout=1
    )
    assert dashr.find_element("title").get_attribute("text") == "Testing Again"
