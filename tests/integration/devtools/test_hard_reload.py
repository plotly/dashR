from selenium.webdriver.support.select import Select
import time, os


app = os.path.join(os.path.dirname(__file__), "hard_reload/app.R")
changed_app = """
library(dash)
library(dashHtmlComponents)
library(dashCoreComponents)
app <- Dash$new()

app$layout(htmlDiv(list(
htmlH3("Test hard reloading (when modifying any non-CSS resources)"),
dccInput(id='input'),
htmlDiv(id='output-serverside')
),
id="hot-reload-content"
)
)

app$callback(
  output(id = "output-serverside", property = "children"),
  params = list(
    input(id = "input", property = "value")
  ),
  function(value) {
    sprintf("Post-reloading test output should be %s", value)
  }
)

app$run_server(dev_tools_hot_reload=TRUE, dev_tools_hot_reload_interval=0.1, dev_tools_silence_routes_logging=TRUE)
"""


def test_rsdv002_hard_reload(dashr):
    dashr.start_server(app)
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Pre-reloading test output should be NULL"
    )
    input1 = dashr.find_element("#input")
    dashr.clear_input(input1)
    input1.send_keys("unchanged")
    with open(app, "r+") as fp:
        time.sleep(1)  # ensure a new mod time
        old_content = fp.read()
        fp.truncate(0)
        fp.seek(0)
        fp.write(changed_app)
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Post-reloading test output should be NULL"
    )
    input1 = dashr.find_element("#input")
    dashr.clear_input(input1)
    input1.send_keys("different")
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Post-reloading test output should be different"
    )
    with open(app, "w") as f:
        f.write(old_content)
        time.sleep(1)
    dashr.wait_for_text_to_equal(
        "#output-serverside",
        "Pre-reloading test output should be NULL"
    )
