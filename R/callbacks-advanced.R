#' Add a callback to a Dash app
#'
#' @param app A dash application created with [`dash_app()`].
#' @param outputs Unnamed list. The `output` argument provides the component `id`
#' and `property` which will be updated by the callback; a callback can
#' target one or more outputs (i.e. multiple outputs).
#' @param params Unnamed list; provides [input] and [state] statements, each
#' with its own defined `id` and `property`. For pattern-matching callbacks,
#' the `id` field of a component is written in JSON-like syntax and provides
#' fields that are arbitrary keys which describe the targets of the callback.
#' See \link{selectors} for more details.
#' @param callback Function; must return [output] provided [input] or [state]
#' arguments. `callback` may be any valid R function, or a character string
#' containing valid JavaScript, or a call to [clientsideFunction],
#' including `namespace` and `function_name` arguments for a locally served
#' JavaScript function.
#' @export
add_callback <- function(app, outputs, params, callback) {
  if (inherits(params, "dash_dependency")) {
    params <- list(params)
  }

  params_flat <- flatten(params)

  # determine if the callback arguments match the first level of parameters
  cb_args <- methods::formalArgs(callback)
  if (length(cb_args) != length(params)) {
    stop("add_callback: Number of params does not match the number of arguments in the callback function", call. = FALSE)
  }
  if (!is.null(names(params))) {
    if (!setequal(cb_args, names(params))) {
      stop("add_callback: Arguments in callback do not match the names of the params",
           call. = FALSE)
    }
  }

  cb <- function(...) {
    callback_params <- eval(substitute(alist(...)))

    # the callback moves states to the end after inputs, so we need to fix the positions
    state_idx <- which(unlist(lapply(params_flat, function(x) inherits(x, "state"))))
    num_states <- length(state_idx)
    if (num_states > 0) {
      num_inputs <- length(callback_params) - num_states
      for (i in seq_len(num_states)) {
        idx <- num_inputs + i
        callback_params <- append(callback_params, list(callback_params[[idx]]), state_idx[i] - 1)
        callback_params <- callback_params[-(idx + 1)]
      }
    }

    callback_params <- params_to_keys(callback_params, params)
    do.call(callback, callback_params)
  }

  app$callback(
    output = outputs,
    params = params_flat,
    func = cb
  )
  invisible(app)
}

# test <- list(
#   ab = list(
#     input("a", "value"),
#     state("b", "value")
#   ),
#   cdef = list(
#     cde = list(
#       input("c", "value"),
#       state("d", "value"),
#       input("e", "value")
#     ),
#     f = input("f", "value")
#   ),
#   g = input("g", "value")
# )
# str(flatten(test))
flatten <- function(x) {
  if (!inherits(x, "list")) return(list(x))

  key_names <- rlang::names2(x)
  key_names_exist <- nzchar(key_names)
  if (all(key_names_exist)) {
    if (any(duplicated(key_names))) {
      stop("Named params must have unique names", call. = FALSE)
    }
    x <- unname(x)
  } else if (any(key_names_exist)) {
    stop("Cannot mix named and unnamed params", call. = FALSE)
  }

  unlist(lapply(x, flatten), recursive = FALSE)
}

# test <- list(
#   ab = list(
#     input("a", "value"),
#     state("b", "value")
#   ),
#   cdef = list(
#     cde = list(
#       input("c", "value"),
#       state("d", "value"),
#       input("e", "value")
#     ),
#     f = input("f", "value")
#   ),
#   g = input("g", "value")
# )
# str(params_to_keys(as.list(LETTERS[1:7]), test))
# str(params_to_keys(c(as.list(LETTERS[1:6]), list(NULL)), test))
params_to_keys <- function(params, keys) {
  params_to_key_helper <- function(keys) {
    for (item_idx in seq_along(keys)) {
      if (inherits(keys[[item_idx]], "dash_dependency")) {
        if (is.null(params[[1]])) {
          keys[item_idx] <- list(NULL)
        } else {
          keys[[item_idx]] <- params[[1]]
        }
        params <<- params[-1]
      } else {
        keys[[item_idx]] <- params_to_key_helper(keys[[item_idx]])
      }
    }
    keys
  }
  params_to_key_helper(keys)
}

#' In addition to event properties like n_clicks that change whenever an event
#' happens there is a global variable dash$callback_context, available only
#' inside a callback. It has properties:
#'
#' `triggered`: list of changed properties. This will be empty on initial load,
#' unless an input prop got its value from another initial callback. After a user
#' action it is a length-1 list, unless two properties of a single component
#' update simultaneously, such as a value and a timestamp or event counter.
#'
#' `inputs` and `states`: allow you to access the callback params by id and prop
#' instead of through the function arguments.
#'
#' @examples
#' if (interactive()) {
#'     dash_app() %>%
#'       set_layout(
#'         button('Button 1', id='btn1'),
#'         button('Button 2', id='btn2'),
#'         button('Button 3', id='btn3'),
#'         div(id='container')
#'       ) %>%
#'       add_callback(
#'         output("container", "children"),
#'         list(
#'           input("btn1", "n_clicks"),
#'           input("btn2", "n_clicks"),
#'           input("btn3", "n_clicks")
#'         ),
#'         function(btn1, btn2, btn3) {
#'           ctx <- callback_context()
#'           prevent_update(is.null(ctx))
#'           sprintf("Triggered: %s, btn1: %s, btn2: %s, btn3: %s",
#'                   ctx$triggered$prop_id, btn1, btn2, btn3)
#'         }
#'       ) %>%
#'       run_app()
#'   }
#' @export
callback_context <- function() {
  get("app", envir = parent.frame(2))$callback_context()
}

#' Prevent a callback from updating its output
#'
#' When used inside Dash callbacks, if any of the arguments evaluate to `TRUE`,
#' then the callback's outputs do not update.
#'
#' @param ... Values to check
#' @examples
#' if (interactive()) {
#'     app <- dash_app()
#'
#'     app %>% set_layout(
#'       button('Click here', id = 'btn'),
#'       p('The number of times the button was clicked does not
#'        update when the number is divisible by 5'),
#'       div(id = 'body-div')
#'     )
#'     app %>% add_callback(
#'       output(id='body-div', property='children'),
#'       list(
#'         input(id='btn', property='n_clicks')
#'       ),
#'       function(n_clicks) {
#'         prevent_update(is.null(n_clicks[[1]]), n_clicks[[1]] %% 5 == 0)
#'         paste(n_clicks[[1]], "clicks")
#'       }
#'     )
#'
#'     app %>% run_app()
#' }
#' @export
prevent_update <- function(...) {
  checks <- unlist(list(...))
  if (any(checks)) {
    rlang::eval_bare(rlang::expr(invisible(return(structure(list(NULL), class = "no_update")))) , env = parent.frame())
  } else {
    return()
  }
}
