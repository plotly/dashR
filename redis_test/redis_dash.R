library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(redux)
library(rworker)
library(magrittr)
library(reticulate)


use_python("/home/hammadtheone/PycharmProjects/TestProject/venv/bin/python3")

r <- redux::hiredis()

app <- Dash$new()

app$layout(htmlDiv(list(
  htmlP("Click the button below to start the Celery workflow."),
  dccInput(
    id = 'number-1',
    placeholder = "Number 1",
    type = "number",
    value = 0
  ),
  dccInput(
    id = 'number-2',
    placeholder = "Number 2",
    type = "number",
    value = 0
  ),
  htmlButton(
    id = 'start-button',
    n_clicks = 0,
    children = 'Start Task A'
  ),
  dccInput(
    id = 'range',
    placeholder = 'Enter a number',
    type = 'number',
    value = 0
  ),
  htmlButton(
    id = 'second-button',
    n_clicks = 0,
    children = 'Start Task B'
  ),
  htmlDiv(id = 'output-div'),
  htmlDiv(id = 'output-div2')
)))

app$callback(
  output(id = 'output-div', property = 'children'),
  params = list(
    input(id = 'start-button', property = 'n_clicks'),
    state(id = 'number-1', property = 'value'),
    state(id = 'number-2', property = 'value')
  ),
  celery_workflow <- function(n_clicks, x, y) {
    if (n_clicks > 0) {
      import("celery")
      source_python("tasks.py")
      add$delay(x,y)
      n <- add$delay(x,y)
      return(n$children)
    }
  }
)

app$callback(
  output(id = 'output-div2', property = 'children'),
  params = list(
    input(id = 'second-button', property = 'n_clicks'),
    state(id = 'range', property = 'value')
    ),
  celery_workflow <- function(n_clicks, x) {
    if (n_clicks > 0) {
      import("celery")
      source_python("tasks.py")
      squared$delay(x)
      m <- squared$delay(x)
      return(m$children)
    }
  }
)


app$run_server(showcase = TRUE)
