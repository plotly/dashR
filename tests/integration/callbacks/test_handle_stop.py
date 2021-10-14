from selenium.webdriver.support.select import Select

app = """
library(dash)

app <- Dash$new()

app$layout(
  html$div(
    list(
      dccDropdown(options = list(
        list(label = "Red", value = "#FF0000"),
        list(label = "Throw error", value = "error")
      ),
      id = "input-choice",
      value = "error"),
      html$div(id="div-choice")
    )
  )
)

app$callback(output(id = 'div-choice', property = 'children'),
             list(input(id = 'input-choice', property = 'value')),
             function(choice) {
               if (choice == "error") {
                 stop(simpleError("Throwing an error by request"))
                 }
               if (!is.null(unlist(choice))) {
                 return(sprintf("Choice was %s", choice))
                 } else {
                   return(sprintf("Make a choice"))
                   }
               })

app$run_server(debug=TRUE)
"""


def test_rshs001_handle_stop(dashr):
    dashr.start_server(app)
    dashr.wait_for_text_to_equal(
        ".dash-fe-error__title",
        "Callback error updating div-choice.children"
    )
