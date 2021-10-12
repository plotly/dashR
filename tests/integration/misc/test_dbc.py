app_with_theme = """
library(dash)

controls <- dbcCard(list(
  div(
    dbcLabel("Dataset"),
    dbcInput(id="dbc-input", type="text", value="DBC Test")
  )
), body=T)

dash_app() %>%
  add_stylesheet(dbcThemes$BOOTSTRAP) %>%
  set_layout(
    dbcContainer(list(
      dbcRow(list(
        h1("Dash Bootstrap Components"),
        dbcCol(controls, md=4)
      ), align="right")
    ), fluid=T)
  ) %>%
  run_app()
"""


def test_rdbc001_bootstrap_theme(dashr):
    dashr.start_server(app_with_theme)
    dashr.wait_for_text_to_equal(
        "#dbcInput", "DBC Test", timeout=2
    )
    dashr.percy_snapshot("rdbc001 - bootstrap components")
