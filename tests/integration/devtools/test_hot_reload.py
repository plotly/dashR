from selenium.webdriver.support.select import Select
import os


RED_BG = """
#hot-reload-content {
    background-color: red;
}
"""


app = """
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
app <- Dash$new(assets_folder="hr_assets")

app$layout(htmlDiv(list(
htmlH3("Hot reload")
),
id="hot-reload-content"
)
)
app$run_server(dev_tools_hot_reload=TRUE, dev_tools_hot_reload_interval=0.1, dev_tools_silence_routes_logging=TRUE)
"""


def test_rsdv001_hot_reload(dashr):
    os.chdir(os.path.dirname(__file__))
    dashr.start_server(app)
    dashr.wait_for_style_to_equal(
      "#hot-reload-content", 
      "background-color", 
      "rgba(0, 0, 255, 1)"
      )
    hot_reload_file = os.path.join(
      os.path.dirname(__file__), "hr_assets", "hot_reload.css"
      )
    with open(hot_reload_file, "r+") as fp:
      sleep(1)  # ensure a new mod time
      old_content = fp.read()
      fp.truncate(0)
      fp.seek(0)
      fp.write(RED_BG)
    dashr.wait_for_style_to_equal(
      "#hot-reload-content", 
      "background-color", 
      "rgba(255, 0, 0, 1)"
      )
    with open(hot_reload_file, "w") as f:
      f.write(old_content)
    dashr.wait_for_style_to_equal(
      "#hot-reload-content", 
      "background-color", 
      "rgba(0, 0, 255, 1)"
      )