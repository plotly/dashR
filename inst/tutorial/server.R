library(dasher)
library(fiery)
library(routr)

# TODO:
# (1) What is the fiery equivalent of Flask's secret_key field?
#   https://github.com/plotly/dash-docs/blob/317a9a9/tutorial/server.py#L12

server <- Fire$new()
app <- Dash$new(
  name = "Dasher user guide",
  server = server,
  static_folder = c('/dash/static' = './static'),
  routes_pathname_prefix = '/dasher/'
)
app
