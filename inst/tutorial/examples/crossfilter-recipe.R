library(dasher)

app <- Dash$new()

app$layout_set(
  htmlDiv(
    className = 'row',
    htmlButton(
      id = "clear",
      "Clear selection"
    ),
    htmlLabel("Persistent selection?"),
    coreRadioItems(
      id = "persist",
      options = list(
        list(label = "yes", value = "yes"),
        list(label = "no", value = "no")
      ),
      value = "yes"
    ),
    htmlLabel("Selection sequence logic"),
    coreRadioItems(
      id = "logic",
      options = list(
        list(label = "union", value = "union"),
        list(label = "intersection", value = "intersection")
      ),
      value = "intersection"
    )
  ),

  htmlDiv(
    className = 'row',
    htmlDiv(
      className = 'four columns',
      coreGraph(
        id = 'g1',
        # if selectedData is not specified, then it is initialized as none
        selectedData = list(points = list(), range = NULL),
        config = list('displayModeBar' = FALSE)
      )
    ),
    htmlDiv(
      className = 'four columns',
      coreGraph(
        id = 'g2',
        selectedData = list(points = list(), range = NULL),
        config = list('displayModeBar' = FALSE)
      )
    ),
    htmlDiv(
      className = 'four columns',
      coreGraph(
        id = 'g3',
        selectedData = list(points = list(), range = NULL),
        config = list('displayModeBar' = FALSE)
      )
    )
  )
)


#' Maintain selection in a data frame
#'
#' This is closure (a function that returns a function) which
#' can be used to implement 'selection sequences'
#'
#' TODO: generalize this so a user could provide a non-unique key
#' (rather than assuming the row index should be the key)
#'
#' @param d a data frame
#'
reactive_dat <- function(d) {
  d$id <- seq_len(nrow(d))
  d$selected <- FALSE
  function(selected) {
    if (missing(selected)) return(d)
    d$selected <<- selected
    d
  }
}

# helper function for going from data to figure
dat2fig <- function(d, x, y) {
  s <- d[["selected"]]
  color <- if (any(s)) ifelse(s, "red", "black") else "black"
  list(
    data = list(
      list(
        x = d[[x]],
        y = d[[y]],
        customdata = d[["id"]],
        type = "scatter",
        mode = "markers",
        marker = list(color = color)
      )
    ),
    layout = list(
      xaxis = list(title = x),
      yaxis = list(title = y),
      margin = list(l = 30),
      dragmode = "select"
    )
  )
}




riris <- reactive_dat(iris)
selectDataToKey <- function(x) {
  unlist(lapply(x[["points"]], "[[", "customdata"))
}

# 'clear the world' on button click
clearSelectedData <- function(n = input('clear', 'n_clicks')) {
  list(points = list(), range = NULL)
}

app$callback(clearSelectedData, output("g1", "selectedData"))
app$callback(clearSelectedData, output("g2", "selectedData"))
app$callback(clearSelectedData, output("g3", "selectedData"))

sd1 <- input('g1', 'selectedData')
sd2 <- input('g2', 'selectedData')
sd3 <- input('g3', 'selectedData')

function(persistent = , logic = intersect, sd1 = sd1, sd2 = sd2, sd3 = sd3) {

  k1 <- selectDataToKey(sd1)
  k2 <- selectDataToKey(sd2)
  k3 <- selectDataToKey(sd3)

  if (!persistent) logic

  current_ids <- if (any(s)) d[s, ][["id"]] else d[["id"]]
  all_ids <- if (!persistent) new_ids else logic(current_ids, new_ids)
  d$selected <- d[["id"]] %in% all_ids

}


app$callback(
  function(sd1 = sd1, sd2 = sd2, sd3 = sd3) {

    riris(selectDataToKey(sd1))
    riris(selectDataToKey(sd2))
    riris(selectDataToKey(sd3))

    dat2fig(riris(), x = "Sepal.Length", y = "Sepal.Width")

  }, output("g1", "figure")
)

app$callback(
  function(sd1 = sd1, sd2 = sd2, sd3 = sd3) {

    riris(selectDataToKey(sd1))
    riris(selectDataToKey(sd2))
    riris(selectDataToKey(sd3))

    dat2fig(riris(), x = "Sepal.Width", y = "Petal.Length")
  }, output("g2", "figure")
)

app$callback(
  function(sd1 = sd1, sd2 = sd2, sd3 = sd3) {

    riris(selectDataToKey(sd1))
    riris(selectDataToKey(sd2))
    riris(selectDataToKey(sd3))

    dat2fig(riris(), x = "Petal.Length", y = "Petal.Width")
  }, output("g3", "figure")
)


app$dependencies_set(dash_css())
app
