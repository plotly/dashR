app = """
library(dash)
app <- Dash$new()

app$layout(html$div(list(html$div(id='container', 'Hello Dash for R testing'))))
app$run_server()
"""


def test_rstr001_r_with_string(dashr):
    dashr.start_server(app)
    dashr.wait_for_text_to_equal(
        "#container", "Hello Dash for R testing", timeout=1
    )
    dashr.percy_snapshot("rstr001 - hello dash")
