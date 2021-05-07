def click_undo(self):
    undo_selector = "._dash-undo-redo span:first-child div:last-child"
    undo = self.wait_for_element_by_css_selector(undo_selector)
    self.wait_for_text_to_equal(undo_selector, "undo")
    undo.click()


def click_redo(self):
    redo_selector = "._dash-undo-redo span:last-child div:last-child"
    self.wait_for_text_to_equal(redo_selector, "redo")
    redo = self.wait_for_element_by_css_selector(redo_selector)
    redo.click()


app = ''' 
library(dash)
app <- Dash$new(show_undo_redo=TRUE)

app$layout(htmlDiv(list(dccInput(id="a"), htmlDiv(id="b"))))

app$callback(
  output("b", "children"),
  list(input("a", "value")),
  function(a) {
    return(a)
  }
)

app$run_server()
'''


def test_rstr001r_undo_redo(dashr):
    dashr.start_server(app)
    dashr.wait_for_element_by_css_selector(
        "#a"
    )   
    input1 = dashr.find_element("#a")
    input1.send_keys("xyz")
    dashr.wait_for_text_to_equal(
        "#b", "xyz", timeout=1
    )
    click_undo(dashr)
    dashr.wait_for_text_to_equal(
        "#b", "xy", timeout=1
    )
    click_undo(dashr)
    dashr.wait_for_text_to_equal(
        "#b", "x", timeout=1
    )
    click_redo(dashr)
    dashr.wait_for_text_to_equal(
        "#b", "xy", timeout=1
    )
    dashr.percy_snapshot(name="undo-redo")
    click_undo(dashr)
    click_undo(dashr)
    dashr.wait_for_text_to_equal(
        "#b", "", timeout=1
    )
