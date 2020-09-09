# akin to https://github.com/plotly/dash/blob/d2ebc837/dash/dependencies.py

#' Input/Output/State definitions
#'
#' Use in conjunction with the `callback()` method from the [dash::Dash] class
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
  if (is(id, 'list')) {
    id = sprintf('{"index":["%s"],"type":"%s"}', id[['index']], id[['type']])
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "output")
  )
}

#' @rdname dependencies
#' @export
input <- function(id, property) {
  if (is(id, 'list')) {
    id = sprintf('{"index":["%s"],"type":"%s"}', id[['index']], id[['type']])
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "input")
  )
}

#' @rdname dependencies
#' @export
state <- function(id, property) {
  if (is(id, 'list')) {
    id = sprintf('{"index":["%s"],"type":"%s"}', id[['index']], id[['type']])
  }
  structure(
    dependency(id, property),
    class = c("dash_dependency", "state")
  )
}

dependency <- function(id = NULL, property = NULL) {
  if (is.null(id)) stop("Must specify an id", call. = FALSE)
  if (is(id, 'list')) {
    id = sprintf('{"index":["%s"],"type":"%s"}', id[['index']], id[['type']])
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

# Wildcards Updates
#' @rdname dependencies
#' @export
id_matches <- function(id, other) {
  my_id = id
  other_id = other
  self_list = is(my_id, "list") && length(names(my_id)) != 0
  other_list = is(my_id, "list") && length(names(my_id)) != 0
  
  if (self_list != other_list){
    return(FALSE)
  }
  if (self_list){
    if (sort(names(my_id)) != sort(names(other_id))){
      return(FALSE)
    }
    
    for (k in names(my_id)){
      other_v = other_id[[k]]
      if (my_id[[k]] == other_v){
        next
      }
      
      v_wild = is(my_id[[k]], "Wildcard")
      other_wild = is(other_v, "Wildcard")
      
      if (v_wild || other_wild) {
        if (!(v_wild && other_wild)){
          next # one wild, one not
        }
        if (my_id[[k]] == ALL || other_id[[k]] == ALL){
          next # either ALL
        }
        if (my_id[[k]] == MATCH || other_id[[k]] == MATCH){
          return(FALSE) # one MATCH, one ALLSMALLER
        }
      }
      else {
        return(FALSE)
      }
      # Here we have to decide how we're using classes or if we're using a different flag.
      # The idea is that we need a way to see if the callback is a wildcard or not, and if it is,
      # what kind of wildcard it corresponds to. We could use `class(n) <- "Wildcard"` to assign 
      # the attribute to a component id. 
    }
  }
  
  return(my_id == other_id)
}
