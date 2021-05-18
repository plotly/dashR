import pdb

app_test_updating = """
library(dash)
app <- Dash$new()

app$layout(htmlDiv(list(htmlH3("Press button see document title updating"),
  htmlDiv(id="output", children="Awaiting output"),
  htmlButton("Update", id="button", n_clicks=0),
  htmlButton("Update Page", id="page", n_clicks=0),
  htmlDiv(id="dummy"))
  )
)

app$callback(output(id = 'output', property = 'children'),
             list(input(id = 'page', property = 'n_clicks')),
             function(n) {
                  Sys.sleep(5)
                  return(paste0("Page ", n)) 
               })

app$run_server()
"""

app_test_no_update_title1 = """
library(dash)
app <- Dash$new(update_title=NULL)

app$layout(htmlDiv(list(htmlH3("Press button see document title updating"),
  htmlDiv(id="output", children="Awaiting output"),
  htmlButton("Update", id="button", n_clicks=0),
  htmlButton("Update Page", id="page", n_clicks=0),
  htmlDiv(id="dummy"))
  )
)

app$run_server()
"""

app_test_no_update_title2 = """
library(dash)
app <- Dash$new(update_title="")

app$layout(htmlDiv(list(htmlH3("Press button see document title updating"),
  htmlDiv(id="output", children="Awaiting output"),
  htmlButton("Update", id="button", n_clicks=0),
  htmlButton("Update Page", id="page", n_clicks=0),
  htmlDiv(id="dummy"))
  )
)

app$run_server()
"""

app_clientside_title1 = """
library(dash)
app <- Dash$new(update_title=NULL)

app$layout(htmlDiv(list(htmlH3("Press button see document title updating"),
  htmlDiv(id="output", children="Awaiting output"),
  htmlButton("Update", id="button", n_clicks=0),
  htmlButton("Update Page", id="page", n_clicks=0),
  htmlDiv(id="dummy"))
  )
)

app$callback(
  output('dummy', 'children'),
  params=list(input('page', 'n_clicks')),
  "
  function(n_clicks) {
    document.title = 'Page ' + n_clicks;
    return 'Page ' + n_clicks;
  }"
)

app$run_server()
"""

app_clientside_title2 = """
library(dash)
app <- Dash$new(update_title="")

app$layout(htmlDiv(list(htmlH3("Press button see document title updating"),
  htmlDiv(id="output", children="Awaiting output"), 
  htmlButton("Update", id="button", n_clicks=0),
  htmlButton("Update Page", id="page", n_clicks=0),
  htmlDiv(id="dummy"))
  )
)

app$callback(
  output('dummy', 'children'),
  params=list(input('page', 'n_clicks')),
  "
  function(n_clicks) {
    document.title = 'Page ' + n_clicks;
    return 'Page ' + n_clicks;
  }"
)

app$run_server()
"""


def test_rstt001_update_title(dashr):
    dashr.start_server(app_test_updating)
    dashr.find_element("#page").click()
    assert dashr.driver.title == "Updating..."

def test_rstt002_update_title(dashr):
    dashr.start_server(app_test_no_update_title1)
    assert dashr.driver.title == "Dash"

def test_rstt003_update_title(dashr):
    dashr.start_server(app_test_no_update_title2)
    assert dashr.driver.title == "Dash"

def test_rstt004_update_title(dashr):
    dashr.start_server(app_clientside_title1)
    dashr.find_element("#page").click()
    dashr.wait_for_text_to_equal("#dummy", "Page 1")
    assert dashr.driver.title == "Page 1"

def test_rstt005_update_title(dashr):
    dashr.start_server(app_clientside_title2)    
    dashr.find_element("#page").click()
    dashr.wait_for_text_to_equal("#dummy", "Page 1")
    assert dashr.driver.title == "Page 1"
