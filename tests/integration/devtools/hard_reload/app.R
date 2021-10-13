
library(dash)
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
    sprintf("Pre-reloading test output should be %s", value)
  }
)

app$run_server(dev_tools_hot_reload=TRUE, dev_tools_hot_reload_interval=0.1, dev_tools_silence_routes_logging=TRUE)
