library(dasher)
library(fiery)
library(routr)

# TODO:
# (1) use routr::ressource_route() to add this static path?
#   https://github.com/plotly/dash-docs/blob/317a9a9/tutorial/server.py#L11
# (2) What is the fiery equivalent of Flask's secret_key field?
#   https://github.com/plotly/dash-docs/blob/317a9a9/tutorial/server.py#L12

server <- Fire$new()
app <- Dash$new(
  name = "Dasher user guide",
  server = server,
  url_base_pathname = '/dasher/'
)
app
