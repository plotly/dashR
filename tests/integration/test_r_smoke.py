app = '''
library(dash)
library(dashHtmlComponents)
app <- Dash$new()
app$layout(htmlDiv(list(htmlDiv(id='container',children='Hello Dash for R testing'))))
app$run_server()
'''

def test_r001_r_with_string(dashr):
    dashr.start_server(app)
    dashr.percy_snapshot("r001 - hello dash bis")