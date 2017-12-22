library(dasher)

dat <- read.csv(
  'https://raw.githubusercontent.com/plotly/datasets/master/1962_2006_walmart_store_openings.csv'
)

app <- Dash$new()

app$layout_set(
  htmlH1('Walmart Store Openings'),
  htmlDiv(id = 'text-content'),
  coreGraph(
    id = 'map',
    figure = list(
      data = list(list(
        lat = dat$LAT,
        lon = dat$LON,
        marker = list(
          color = dat$YEAR,
          size = 8,
          opacity = 0.6
        ),
        customdata = dat$storenum,
        type = 'scattermapbox'
      )),
      layout = list(
        mapbox = list(
          accesstoken = 'pk.eyJ1IjoiY2hyaWRkeXAiLCJhIjoiY2ozcGI1MTZ3MDBpcTJ3cXR4b3owdDQwaCJ9.8jpMunbKjdq1anXwU5gxIw'
        ),
        hovermode = 'closest',
        margin = list(l = 0, r = 0, b = 0, t = 0)
      )
    )
  )
)

app$callback(
  function(hover = input('map', 'hoverData')) {

    store <- hover$points$customdata
    if (length(store) != 1) return()

    d <- dat[dat$storenum %in% store, ]

    sprintf(
      "The %s, %s %s opened in %s",
      d$STRCITY,
      d$STRSTATE,
      d$type_store,
      d$YEAR
    )
  }, output('text-content')
)


app$dependencies_set(dash_css())
app

