library(dashR)
  
app <- Dash$new()

app$layout_set(
  htmlDiv(coreInput(id = "input-box", type = "text")),
  htmlButton("submit", id = "button"),
  htmlDiv('Enter a value and press submit', id = 'output-container-button')
)

app$callback(
  function(n_clicks = input("button", "n_clicks"), value = input("input-box")) {
    #print(length(value))
    #print(value)
    if (length(value)>1){
      sprintf(
        'The input value was "%s" and the button has been clicked %s times',
        value[2], n_clicks
      )
    }else{
      sprintf(
        'The input value was "%s" and the button has been clicked %s times',
        value, n_clicks
      )
    }
  },
  output("output-container-button")
)



app
