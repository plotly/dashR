app = '''
library(dash)
library(dashHtmlComponents)
app <- Dash$new()

app$layout(htmlDiv(list(htmlDiv(id='test',children='hello test'))))
app$run_server()
'''

def test_r001_r_with_string(dashr):
    dashr.start_server(app)
