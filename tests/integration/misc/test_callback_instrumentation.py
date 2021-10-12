import requests


app = """
 library(dash)

 app <- Dash$new()

 app$layout(htmlDiv(
   list(
        htmlDiv(children = "Hello world!",
           id = "messageDiv"
        ),
        htmlDiv(id = "emptyDiv")
    )
   )
 )

 app$callback(output(id="emptyDiv", property="children"),
              params = list(input(id="messageDiv", property="children")),
     function(y) {
       app$callback_context.record_timing("pancakes", 1.23)
       Sys.sleep(0.5)
       return(y)
     }
 )

 app$run_server(debug=TRUE)
"""

def test_rsci001_test_callback_instrumentation(dashr_server):
    dashr_server.start(app)

    response = requests.post(
        "http://127.0.0.1:8050" + "/_dash-update-component",
        json={
            "output": "emptyDiv.children",
            "outputs": {"id": "emptyDiv", "property": "children"},
            "inputs": [{"id": "messageDiv", "property": "children", "value": 9}],
            "changedPropIds": ["messageDiv.children"],
        },
    )
    # eg 'Server-Timing': '__dash_server;dur=505, pancakes;dur=1230'
    assert "Server-Timing" in response.headers

    st = response.headers["Server-Timing"]
    times = {k: int(float(v)) for k, v in [p.split(";dur=") for p in st.split(", ")]}
    assert "pancakes" in times
    assert times["pancakes"] == 1230
    assert "__dash_server" in times
    assert times["__dash_server"] >= 500  # 0.5 sec wait
