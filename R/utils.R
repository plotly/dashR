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
render_dependencies <- function(dependencies, local = TRUE, prefix=NULL) {
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
    
    # According to Dash convention, label react and react-dom as originating
    # in dash_renderer package, even though all three are currently served
    # up from the DashR package
    if (dep$name %in% c("react", "react-dom")) {
      dep$name <- "dash_renderer"
    }

    # The following lines inject _dash-component-suites into the src tags,
    # as this is the current Dash convention. The dependency paths cannot
    # be set solely at component library generation time, since hosted
    # applications should have the app name injected as well.
    #
    # This is essentially analogous to this codeblock on the Python side:
    # https://github.com/plotly/dash/blob/1249ffbd051bfb5fdbe439612cbec7fa8fff5ab5/dash/dash.py#L207
    if (is.null(prefix)) {
      dep[["script"]] <- paste0("/_dash-component-suites/",
                                dep$name,
                                "/",
                                basename(dep[["script"]]))
    } else {
      dep[["script"]] <- paste0(sub("/", "", prefix), 
                                "_dash-component-suites/", 
                                dep$name,
                                "/",
                                basename(dep[["script"]]))
    }
    dep$src$file <- ""
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
  
  invalid_params <- vapply(params, function(x) {
    !any(c('input', 'state') %in% attr(x, "class"))
  }, FUN.VALUE=logical(1))
  
  # Verify that params contains no elements that are not either members of 'input' or 'state' classes
  if (any(invalid_params)) {
    stop(sprintf("Callback parameters must be inputs or states. Please verify formatting of callback parameters."), call. = FALSE)
  }

  # Verify that 'input' parameters always precede 'state', if present
  if (!(valid_seq(params))) {
    stop(sprintf("Strict ordering of callback handler parameters is required. Please ensure that input parameters precede all state parameters."), call. = FALSE)
  }
    
  # Assert that the component ID as passed is a string.
  if(!(is.character(output$id) & !grepl("^\\s*$", output$id) & !grepl("\\.", output$id))) {
    stop(sprintf("Callback IDs must be (non-empty) character strings that do not contain one or more dots/periods. Please verify that the component ID is valid."), call. = FALSE)
  }
  
  # Assert that user_function is a valid function
  if(!(is.function(func))) {
    stop(sprintf("The callback method's 'func' parameter requires a function as its argument. Please verify that 'func' is a valid, executable R function."), call. = FALSE)
  }
  
  # Check if inputs are a nested list
  if(!(any(sapply(inputs, is.list)))) {
    stop(sprintf("Callback inputs should be a nested list, in which each element of the sublist represents a component ID and its properties."), call. = FALSE)
  }
  
  # Check if state is a nested list, if the list is not empty
  if(!(length(state) == 0) & !(any(sapply(state, is.list)))) {
    stop(sprintf("Callback states should be a nested list, in which each element of the sublist represents a component ID and its properties."), call. = FALSE)
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

valid_seq <- function(params) {
  class_attr <- vapply(params, function(x) {
    attr(x, "class")[attr(x, "class") %in% c('input', 'state')]
  }, FUN.VALUE=character(1))
  
  rle_result <- rle(class_attr)$values
  
  if (identical(rle_result, 'input')) {
    return(TRUE)
  } else if (identical(rle_result, c('input', 'state'))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

resolve_prefix <- function(prefix, environment_var) {
  if (!(is.null(prefix))) {
    assertthat::assert_that(is.character(prefix))
    
    return(prefix)
  } else {
    prefix_env <- Sys.getenv(environment_var)
    if (prefix_env != "") {
      return(prefix_env)
    } else {
      return("/")
    }
  }
}get_mimetype <- function(filename) {

get_package_mapping <- function(script_path, url_package, dependencies) {
  package_map <- vapply(dependencies, function(x) {
    if (x$name %in% c('react', 'react-dom')) {
      x$name <- 'dash_renderer'
    }
    dep_path <- paste(x$src$file, 
                      x$script,
                      sep = "/")
  
    # remove double slash and replace with single if present
    result <- c(pkg_name=x$package,
                dep_name=x$name,
                dep_path=gsub("//", replacement = "/", dep_path)
    )
  }, FUN.VALUE = character(3))
  
  package_map <- as.data.frame(t(package_map), stringsAsFactors = FALSE)
  
  filename <- basename(script_path)
  
  pos_match <- grepl(paste0(filename, "$"), package_map[, "dep_path"]) &
               grepl(url_package, package_map[,"dep_name"])
  
  rpkg_name <- package_map[,"pkg_name"][pos_match]
  rpkg_path <- package_map[,"dep_path"][pos_match]
  
  return(list(rpkg_name=rpkg_name, rpkg_path=rpkg_path))
}

  # the next two lines are borrowed from file_ext
  last_dot_pos <- regexpr("\\.([[:alnum:]]+)$", filename)
  file_ext <- ifelse(last_dot_pos > -1L, 
                     substring(filename, 
                               last_dot_pos + 1L), 
                     "")
  
  if (file_ext == 'js')
    return('application/JavaScript')
  else if (file_ext == 'css')
    return('text/css')
  else if (file_ext == 'map')
    return('application/json')
  else
    return(NULL)
}
