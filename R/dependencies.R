# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

# Helper functions for handling dependency ids or props
setWildcardId <- function(id) {
  # Sort the keys of a wildcard id
  id <- id[order(names(id))]
  all_selectors <- vapply(id, function(x) {is.symbol(x)}, logical(1))
  id[all_selectors] <- as.character(id[all_selectors])
  id[!all_selectors] <- lapply(id[!all_selectors], function(x) {jsonlite::unbox(x)})
  return(as.character(jsonlite::toJSON(id, auto_unbox = FALSE)))
}

#' Input/Output/State definitions
#'
#' Use in conjunction with the `callback()` method from the [Dash] class
#' to define the update logic in your application.
#'
#' The `dashNoUpdate()` function permits application developers to prevent a
#' single output from updating the layout. It has no formal arguments.
#'
#' @name dependencies
#' @param id a component id
#' @param property the component property to use

#' @rdname dependencies
#' @export

output <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
input <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
state <- function(id, property) {
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(id = NULL, property = NULL) {
  if (is.null(id)) stop("Must specify an id", call. = FALSE)
  if (is.list(id)) {
    id = setWildcardId(id)
  }
  list(
    id = id,
    property = property
  )
}

#' @rdname dependencies
#' @export
dashNoUpdate <- function() {
  x <- list(NULL)
  class(x) <- "no_update"
  return(x)
}

#' Pattern-Matching Callback Selectors
#' @description
#' Symbols which reference pattern-matching callback selectors with the same names
#' @details
#' `ALL`, `ALLSMALLER` and `MATCH` are symbols corresponding to the
#' pattern-matching callback selectors with the same names. These allow you
#' to write callbacks that respond to or update an arbitrary or dynamic
#' number of components. Because they are symbols (see \link{name}) rather than
#' functions, each has no arguments. For more information, see the `callback`
#' section in \link{Dash}.
#'
#' For pattern-matching callbacks, the `id` field of a component is written
#' in JSON-like syntax. The resulting `id` is then transformed into a dictionary
#' object when serialized for use by the Dash renderer within the web browser.
#' The fields are arbitrary keys, which describe the targets of the callback.
#'
#' For example, when we write `input(id=list("foo" = ALL, "bar" = "dropdown")`,
#' Dash interprets this as "match any input that has an ID list where 'foo'
#' is 'ALL' and 'bar' is anything." If any of the dropdown
#' `value` properties change, all of their values are returned to the callback.
#'
#' However, for readability, we recommend using keys like type, index, or id.
#' `type` can be used to refer to the class or set of dynamic components and
#' `index` or `id` could be used to refer to the component you are matching
#' within that set. While your application may have a single set of dynamic
#' components, it's possible to specify multiple sets of dynamic components
#' in more complex apps or if you are using `MATCH`.
#'
#' Like `ALL`, `MATCH` will fire the callback when any of the component's properties
#' change. However, instead of passing all of the values into the callback, `MATCH`
#' will pass just a single value into the callback. Instead of updating a single
#' output, it will update the dynamic output that is "matched" with.
#'
#' `ALLSMALLER` is used to pass in the values of all of the targeted components
#' on the page that have an index smaller than the index corresponding to the div.
#' For example, `ALLSMALLER` makes it possible to filter results that are
#' increasingly specific as the user applies each additional selection.
#'
#' `ALLSMALLER` can only be used in `input` and `state` items, and must be used
#' on a key that has `MATCH` in the `output` item(s). `ALLSMALLER` it isn't always
#' necessary (you can usually use `ALL` and filter out the indices in your callback),
#' but it will make your logic simpler.
#' @name selectors
#' @rdname selectors
#' @export
#' @examples
#' if (interactive() ) {
#'   library(dash)
#'
#'   # Simple example illustrating use of ALL selector
#'   app <- Dash$new()
#'
#'   app$layout(htmlDiv(list(
#'     htmlButton("Add Filter", id="add-filter", n_clicks=0),
#'     htmlDiv(id="dropdown-container", children=list()),
#'     htmlDiv(id="dropdown-container-output")
#'   )))
#'
#'
#'   app$callback(
#'     output(id="dropdown-container", property = "children"),
#'     params = list(
#'       input(id = "add-filter", property = "n_clicks"),
#'       state(id = "dropdown-container", property = "children")
#'     ),
#'     display_dropdowns <- function(n_clicks, children){
#'       new_dropdown = dccDropdown(
#'         id=list(
#'           "index" = n_clicks,
#'           "type" = "filter-dropdown"
#'         ),
#'         options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
#'           list("label" = x, "value" = x)
#'         })
#'       )
#'       children[[n_clicks + 1]] <- new_dropdown
#'       return(children)
#'     }
#'   )
#'
#'   app$callback(
#'     output(id="dropdown-container-output", property="children"),
#'     params = list(
#'       input(id=list("index" = ALL, "type" = "filter-dropdown"), property= "value")
#'     ),
#'     display_output <- function(test){
#'       ctx <- app$callback_context()
#'       return(htmlDiv(
#'         lapply(seq_along(test), function(x){
#'           return(htmlDiv(sprintf("Dropdown %s = %s", x, test[[x]])))
#'         })
#'       ))
#'     }
#'   )
#'
#'   app$run_server()
#'
#'   # Simple example illustrating use of ALLSMALLER selector
#'   library(dash)
#'
#'   df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv',
#'                  stringsAsFactors = FALSE)
#'
#'   app <- Dash$new()
#'
#'   app$layout(htmlDiv(list(
#'     htmlButton("Add Filter", id = "add-filter-ex3", n_clicks = 0),
#'     htmlDiv(id = "container-ex3", children = list())
#'   )))
#'
#'   app$callback(
#'     output('container-ex3', 'children'),
#'     params = list(
#'       input('add-filter-ex3', 'n_clicks'),
#'       state('container-ex3', 'children')
#'     ),
#'     display_dropdowns <- function(n_clicks, existing_children){
#'       new_children <- htmlDiv(list(
#'         dccDropdown(
#'           id = list("index" = n_clicks, "type" = "filter-dropdown-ex3"),
#'           options = lapply(unique(df$country), function(x){
#'             list("label" = x, "value" = x)
#'           }),
#'           value = unique(df$country)[n_clicks + 1]
#'         ),
#'         htmlDiv(id = list("index" = n_clicks, "type" = "output-ex3"),
#'                 children = list(unique(df$country)[n_clicks + 1]))
#'       ))
#'
#'       existing_children <- c(existing_children, list(new_children))
#'     }
#'   )
#'
#'   app$callback(
#'     output(id = list("type" = "output-ex3", "index" = MATCH), property = "children"),
#'     params = list(
#'       input(id = list("type" = "filter-dropdown-ex3", "index" = MATCH), property = "value"),
#'       input(id = list("type" = "filter-dropdown-ex3", "index" = ALLSMALLER), property = "value")
#'     ),
#'     display_output <- function(matching_value, previous_values){
#'       previous_values_in_reversed_order = rev(previous_values)
#'       all_values = c(matching_value, previous_values_in_reversed_order)
#'       all_values = unlist(all_values)
#'
#'       dff = df[df$country %in% all_values,]
#'       avgLifeExp = round(mean(dff$lifeExp), digits = 2)
#'
#'       if (length(all_values) == 1) {
#'         return(
#'           htmlDiv(sprintf("%s is the life expectancy of %s.",
#'                   avgLifeExp,
#'                   matching_value))
#'         )
#'       } else if (length(all_values) == 2) {
#'         return(
#'           htmlDiv(sprintf("%s is the life expectancy of %s.",
#'                           avgLifeExp,
#'                           paste(all_values, collapse = " and ")))
#'         )
#'       } else {
#'         return(
#'           htmlDiv(sprintf("%s is the life expectancy of %s, and %s.",
#'                   avgLifeExp,
#'                   paste(all_values[-length(all_values)], collapse = " , "),
#'                   paste(all_values[length(all_values)])))
#'         )
#'       }
#'     }
#'   )
#'
#'   app$run_server()
#'
#'   # Simple example illustrating use of MATCH selector
#'   library(dash)
#'
#'   app <- Dash$new()
#'
#'   app$layout(htmlDiv(list(
#'     htmlButton("Add Filter", id="dynamic-add-filter", n_clicks=0),
#'     htmlDiv(id="dynamic-dropdown-container", children = list())
#'   )))
#'
#'   app$callback(
#'     output(id="dynamic-dropdown-container", "children"),
#'     params = list(
#'       input("dynamic-add-filter", "n_clicks"),
#'       state("dynamic-dropdown-container", "children")
#'     ),
#'     display_dropdown <- function(n_clicks, children){
#'       new_element = htmlDiv(list(
#'         dccDropdown(
#'           id = list("index" = n_clicks, "type" = "dynamic-dropdown"),
#'           options = lapply(c("NYC", "MTL", "LA", "TOKYO"), function(x){
#'             list("label" = x, "value" = x)
#'           })
#'         ),
#'         htmlDiv(
#'           id = list("index" = n_clicks, "type" = "dynamic-output"),
#'           children = list()
#'         )
#'       ))
#'
#'       children <- c(children, list(new_element))
#'       return(children)
#'     }
#'   )
#'
#'   app$callback(
#'     output(id = list("index" = MATCH, "type" = "dynamic-output"), property= "children"),
#'     params = list(
#'       input(id=list("index" = MATCH, "type" = "dynamic-dropdown"), property= "value"),
#'       state(id=list("index" = MATCH, "type" = "dynamic-dropdown"), property= "id")
#'     ),
#'     display_output <- function(value, id){
#'       return(htmlDiv(sprintf("Dropdown %s = %s", id$index, value)))
#'     }
#'   )
#'
#'   app$run_server()
#'}
ALL <- as.symbol("ALL")

#' @rdname selectors
#' @export
ALLSMALLER <- as.symbol("ALLSMALLER")

#' @rdname selectors
#' @export
MATCH <- as.symbol("MATCH")
