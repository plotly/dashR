# ----------------------------------------------------------------------------
# Class assertion
# ----------------------------------------------------------------------------

# fiery server
is.fire <- function(x) inherits(x, "Fire")

# dependencies
is.dependency <- function(x) inherits(x, "dash_dependency")
is.output <- function(x) inherits(x, "output")
is.input <- function(x) inherits(x, "input")
is.state <- function(x) inherits(x, "state")

# components (TODO: this should be exported by dashRtranspile!)
is.component <- function(x) inherits(x, "dash_component")

# layout is really a special type of component
is.layout <- function(x) {
  is.component(x) && identical(x[["props"]][["id"]], layout_container_id())
}

layout_container_id <- function() {
  "_dashR-layout-container"
}

# retrieve the arguments of a callback function that are dash inputs
callback_inputs <- function(func) {
  compact(lapply(formals(func), function(x) {
    # missing arguments produce an error when evaluated
    # TODO: should we only evaluate when `!identical(x, quote(expr = ))`?
    val <- tryNULL(eval(x))
    if (is.input(val)) val else NULL
  }))
}

callback_states <- function(func) {
  compact(lapply(formals(func), function(x) {
    # missing arguments produce an error when evaluated
    # TODO: should we only evaluate when `!identical(x, quote(expr = ))`?
    val <- tryNULL(eval(x))
    if (is.state(val)) val else NULL
  }))
}

callback_events <- function(func) {
  compact(lapply(formals(func), function(x) {
    # missing arguments produce an error when evaluated
    # TODO: should we only evaluate when `!identical(x, quote(expr = ))`?
    val <- tryNULL(eval(x))
    if (is.event(val)) val else NULL
  }))
}

# search through a component (a recursive data structure) for a component with
# a given id and return the component's type
component_props_given_id <- function(component, id) {

  is_component <- is.component(component)

  is_match <- if (is_component) isTRUE(component$props$id == id) else FALSE

  props <- if (is_match) component$propNames else NA

  if (is_component && !is_match) {
    if ("children" %in% names(component$props)) {
      return(unlist(lapply(component$props$children, component_props_given_id, id)))
    }
  }

  props
}

component_contains_type <- function(component, package, type) {

  is_component <- is.component(component)

  is_match <- if (is_component) isTRUE(component$type == type) && isTRUE(component$package == package) else FALSE

  if (is_component && !is_match) {
    if ("children" %in% names(component$props)) {
      return(any(unlist(lapply(component$props$children, component_contains_type, package, type))))
    }
  }

  is_match
}

# ----------------------------------------------------------------------
# HTTP helpers
# ----------------------------------------------------------------------

request_parse_json <- function(request) {
  # request body must be parsed on demand (to avoid errors by odd formats)
  # http://www.data-imaginist.com/2017/Introducing-reqres/
  if (!request$is("json")) stop("Expected a JSON request", call. = FALSE)

  # Unlike `reqres::default_parsers["application/json"]`, we don't
  # simplify the *entire* JSON blob, but we do simplify input/state value(s)
  # https://gist.github.com/cpsievert/04d53edbe902ca86a41949e24e8b4af7
  from_JSON <- function(raw, directives) {
    jsonlite::fromJSON(rawToChar(raw), simplifyVector = FALSE)
  }
  success <- request$parse(list(`application/json` = from_JSON))
  if (!success) stop("Failed to parse body", call. = FALSE)

  request
}

# ----------------------------------------------------------------------------
# HTML dependency helpers
# ----------------------------------------------------------------------------


# A shim for  htmltools::renderDependencies
# @param dependencies a list of HTML dependencies
# @param external point to an external CDN rather local files?
render_dependencies <- function(dependencies, local = TRUE) {
  html <- sapply(dependencies, function(dep) {
    assertthat::assert_that(inherits(dep, "html_dependency"))
    srcs <- names(dep[["src"]])
    src <- if (!local && !"href" %in% srcs && "file" %in% srcs) {
      message("No remote hyperlink found for HTML dependency '", dep[["name"]], "'. Using local file instead.")
      "file"
    } else if (local && !"file" %in% srcs && "href" %in% srcs) {
      message("No local file found for HTML dependency '", dep[["name"]], "'. Using the remote hyperlink instead.")
      "href"
    } else if (!local) {
      "href"
    } else {
      "file"
    }
    htmltools::renderDependencies(list(dep), src, encodeFunc = identity)
  })
  paste(html, collapse = "\n")
}

# Similar to htmltools::resolveDependencies(), but allows
# pkgload:::shim_system.file() to work it's magic in dev mode
# (i.e., pkgload::load_all())
resolve_dependencies <- function(dependencies, resolvePackageDir = TRUE) {

  dependencies <- htmltools::resolveDependencies(dependencies, FALSE)

  if (resolvePackageDir) {
    dependencies <- lapply(dependencies, function(dep) {
      if (is.null(dep$package)) return(dep)
      dir <- dep$src$file
      if (!is.null(dir)) dep$src$file <- system.file(dir, package = dep$package)
      dep$package <- NULL
      dep
    })
  }

  dependencies
}

# ----------------------------------------------------------------------------
# Other (generic) helpers
# ----------------------------------------------------------------------------

"%||%" <- function(x, y) {
  if (length(x)) x else y
}

compact <- function(x) {
  Filter(Negate(is.null), x)
}

# same as plotly:::to_JSON
to_JSON <- function(x, ...) {
  jsonlite::toJSON(x, digits = 50, auto_unbox = TRUE, force = TRUE,
                   null = "null", na = "null", ...)
}

# same as plotly:::new_id
new_id <- function() {
  basename(tempfile(""))
}

dir_exists <- function(paths) {
  utils::file_test("-d", paths)
}

tryNULL <- function(expr) {
  tryCatch(expr, error = function(e) NULL)
}

str_trim <- function(x) {
  sub("\\s+$", "", sub("^\\s+", "", x))
}

setdiffsym <- function(x, y) {
  setdiff(union(x, y), intersect(x, y))
}

welcome_page <- function() {
  #dashHtmlComponents::htmlDiv(
  #  dashHtmlComponents::htmlH2("Welcome to dash!"),
  #  "If you see this message, you may not have yet specified a layout in your application."
  #)
}

stop_report <- function(msg = "") {
  stop(
    msg, "\n\n",
    "Please let us know about this error via ",
    "https://github.com/plotly/dashR/issues/new",
    call. = FALSE
  )
}

try_library <- function(pkg, fun = NULL) {
  if (system.file(package = pkg) != "") {
    return(invisible())
  }
  stop("Package `", pkg, "` required", if (!is.null(fun))
    paste0(" for `", fun, "`"), ".\n", "Please install and try again.",
    call. = FALSE)
}

assert_valid_children <- function(children, ...) {
  kids <- list(children)
  if (...length()) {
    pattern <- paste(paste0('^', ...), collapse = '|')
    kids <- kids[!grepl(pattern, names2(kids))]
  }
  if (!length(kids)) return(NULL)
  assert_no_names(kids)
}

append_wildcard_props <- function(component, children, ...) {
  attrs <- list(children)
  if (!length(children) || !...length()) return(component)
  pattern <- paste(paste0('^', ...), collapse = '|')
  attrs_wild <- attrs[grepl(pattern, names2(attrs))]
  if (!length(attrs_wild)) return(component)
  component[['props']] <- c(component[['props']] %||% list(), attrs_wild)
  component[['propNames']] <- c(component[['propNames']], names(attrs_wild))
  component
}

assert_no_names <- function (x)
{
  if(!(is.list(x))) x <- list(x)
  nms <- names(x)
  if (is.null(nms))
    return(x)
  if (identical("", unique(nms)))
    return(setNames(x, NULL))
  stop(sprintf("Didn't recognize the following named arguments: '%s'",
               paste(nms, collapse = "', '")), call. = FALSE)
}

filter_null <- function(x) {
  if (length(x) == 0 || !is.list(x)) return(x)
  x[!vapply(x, is.null, logical(1))]
}

assert_valid_callbacks <- function(output, params, func) {
  inputs <- params[vapply(params, function(x) 'input' %in% attr(x, "class"), FUN.VALUE=logical(1))]
  state <- params[vapply(params, function(x) 'state' %in% attr(x, "class"), FUN.VALUE=logical(1))]
  
  # Assert that the component ID as passed is a string.
  if(!(is.character(output$id) & !grepl("^\\s*$", output$id) & !grepl("\\.", output$id))) {
    stop(sprintf("Callback IDs must be (non-empty) character strings that do not contain one or more dots/periods. Verify that the component ID is valid."), call. = FALSE)
  }
  
  # Assert that user_function is a valid function
  if(!(is.function(func))) {
    stop(sprintf("The callback method's 'user_function' parameter requires a function as its argument. Verify that user_function is a valid, executable R function."), call. = FALSE)
  }
  
  # Check if inputs are a nested list
  if(!(any(sapply(inputs, is.list)))) {
    stop(sprintf("Callback inputs should be a nested list, in which each element of the sublist represents a component ID and its properties."), call. = FALSE)
  }
  
  # Check that input is not NULL
  if(is.null(inputs)) {
    stop(sprintf("The callback method requires that one or more properly formatted inputs are passed."), call. = FALSE)
  }
  
  # Check that outputs are not inputs
  # https://github.com/plotly/dash/issues/323
  inputs_vs_outputs <- lapply(inputs, function(x) identical(x, output))
  
  if(TRUE %in% inputs_vs_outputs) {
    stop(sprintf("Circular input and output arguments were found. Please verify that callback outputs are not also input arguments."), call. = FALSE)
  }
  
  # TO DO: check that components contain props
  TRUE
}

names2 <- function(x) names(x) %||% rep('', length(x))
