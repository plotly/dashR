app_returning_component = """
library(dash)

app <- Dash$new()
app$layout(
  html$Div(list(
    html$H1('Multi-outputs with callback returning component'),
    html$Div(children = 'Click button to render or remove component here', id = 'inner-container'),
    html$Button('Render/Unrender', id='submit-val', n_clicks=0),
    html$Div(children = 'Button clicked 0 times.', id = 'clicks-count')
    ),
    id = 'container'
  )
)

app$callback(output=list(
  output(id='clicks-count', property='children'),
  output(id='inner-container', property='children')
),
params=list(
  input(id='submit-val', property='n_clicks')
),
function(value) {
  click_total <- as.numeric(value)
  result <- html$Div('String in container', id = 'string-container')

  if (click_total == 0) {
    return(dashNoUpdate())
  } else if (click_total %% 2 == 1) {
    result <- 'String, no container'
  }

  return(list(sprintf('Button clicked %s times.', click_total),
              result))
}
)
app$run_server(debug=TRUE)
"""


def test_rsnu002_multiple_outputs(dashr):
    dashr.start_server(app_returning_component)
    dashr.wait_for_text_to_equal(
        "#inner-container",
        "Click button to render or remove component here"
    )
    dashr.find_element("#submit-val").click()
    dashr.wait_for_text_to_equal(
         "#clicks-count",
         "Button clicked 1 times."
    )
    assert dashr.find_element("#inner-container").text == "String, no container"
    dashr.find_element("#submit-val").click()
    dashr.wait_for_text_to_equal(
         "#clicks-count",
         "Button clicked 2 times."
    )
    assert dashr.find_element("#string-container").text == "String in container"

