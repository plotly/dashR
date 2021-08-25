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

dash_simplified_app = '''
library(dash)

app <- dash_app("My app")

app %>% set_layout(
  h1('Hello Dash', id = "test-div"),
  div("Dash: ", "A web application framework for R."),
  button("Click Me", id="test-button", n_clicks = 0),
  dccGraph(
    figure=list(
      data=list(
        list(
          x=list(1, 2, 3),
          y=list(4, 1, 2),
          type='bar',
          name='SF'
        ),
        list(
          x=list(1, 2, 3),
          y=list(2, 4, 5),
          type='bar',
          name='Montreal'
        )
      ),
      layout = list(title='Dash Data Visualization')
    )
  )
)

app$callback(
  output(id = "test-div", property = "children"),
  params = list(
    input(id = "test-button", property = "n_clicks")
  ),
  function(n_clicks) {
    if (n_clicks > 0) {
      return("Hello Dash2")
    }
    else {
      return("Hello Dash")
    }
  }
)

app %>%
  add_meta(list(name = 'description', content = 'My App')) %>%
  run_app()
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


def test_rstr002r_render_dash_simplified_layout(dashr):
    dashr.start_server(dash_simplified_app)
    dashr.wait_for_element_by_id("test-button", timeout=2)
    dashr.find_element("#test-button").click()
    dashr.wait_for_text_to_equal("#test-div", "Hello Dash2")
    dashr.percy_snapshot(name="dash-simplified-layout")

    assert dashr.find_element("meta[name='description']").get_attribute("content") == "My App"
