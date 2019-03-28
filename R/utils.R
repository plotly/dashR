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

# @param dependencies a list of HTML dependencies
# @param local should local versions be served instead of CDN hrefs?
# @param prefix the prefix to use for responding to requests, if set
render_dependencies <- function(dependencies, local = TRUE, prefix=NULL) {
  html <- sapply(dependencies, function(dep, is_local=local, path_prefix=prefix) {
    assertthat::assert_that(inherits(dep, "html_dependency"))
    srcs <- names(dep[["src"]])
    src <- if (!is_local && !"href" %in% srcs && "file" %in% srcs) {
      msg <- paste0("No remote hyperlink found for HTML dependency ",
                    dep[["name"]],
                    ". Using local file instead.")
      message(msg)
      "file"
    } else if (is_local && !"file" %in% srcs && "href" %in% srcs) {
      msg <- paste0("No local file found for HTML dependency ",
                    dep[["name"]],
                    ". Using the remote URL instead.")
      message(msg)
      "href"
    } else if (!is_local) {
      "href"
    } else {
      "file"
    }
    
    # According to Dash convention, label react and react-dom as originating
    # in dash_renderer package, even though all three are currently served
    # u p from the DashR package
    if (dep$name %in% c("react", "react-dom")) {
      dep$name <- "dash-renderer"
    }
    
    # The following lines inject _dash-component-suites into the src tags,
    # as this is the current Dash convention. The dependency paths cannot
    # be set solely at component library generation time, since hosted
    # applications should have the app name injected as well.
    #
    # This is essentially analogous to this codeblock on the Python side:
    # https://github.com/plotly/dash/blob/1249ffbd051bfb5fdbe439612cbec7fa8fff5ab5/dash/dash.py#L207
    #
    # Use the system file modification timestamp for the current
    # package and add the version number of the package as a query
    # parameter for cache busting
    
    if (!is.null(dep$package)) {
      # the gsub line is to remove stray duplicate slashes, to
      # permit exact string matching on pathnames
      dep_path <- file.path(dep$src$file,
                            dep$script)
      
      dep_path <- gsub("//+",
                       "/",
                       dep_path)
      
      full_path <- system.file(dep_path,
                               package = dep$package)
      
      modified <- as.integer(file.mtime(full_path))
    } else {
      modified <- as.integer(Sys.time())
    }
    
    # we don't want to serve the JavaScript source maps here,
    # until we are able to provide full support for debug mode,
    # as in Dash for Python
    if ("script" %in% names(dep) && tools::file_ext(dep[["script"]]) != "map") {
      if (!(is_local) & !(is.null(dep$src$href))) {
        html <- sprintf("<script src=\"%s\"></script>", dep$src$href)
      } else {
        dep[["script"]] <- paste0(path_prefix,
                                  "_dash-component-suites/",
                                  dep$name,
                                  "/",
                                  basename(dep[["script"]]),
                                  sprintf("?v=%s&m=%s", dep$version, modified))
        html <- sprintf("<script src=\"%s\"></script>", dep[["script"]])
      }
    } else if (!(is_local) & "stylesheet" %in% names(dep) & src == "href") {
      html <- sprintf("<link href=\"%s\" rel=\"stylesheet\" />", paste(dep[["src"]][["href"]],
                                                                       dep[["stylesheet"]], 
                                                                       sep="/"))
    } else if ("stylesheet" %in% names(dep) & src == "file") {
      if (!(is.null(dep$version))) {
        html <- sprintf("<link href=\"%s?v=%s\" rel=\"stylesheet\" />", file.path(dep[["src"]][["file"]],
                                                                                  dep[["stylesheet"]]),
                        dep$version)        
      } else {
        html <- sprintf("<link href=\"%s\" rel=\"stylesheet\" />", file.path(dep[["src"]][["file"]],
                                                                             dep[["stylesheet"]])
        )
      }
    }
  })
  paste(html, collapse = "\n")
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

# the following function attempts to prune remote CSS
# or local CSS/JS dependencies that either should not
# be resolved to local R package paths, or which have
# insufficient information to do so. 
#
# this attempts to avoid cryptic errors produced by
# get_package_mapping, which requires three parameters:
# -- the script name (i.e. x$script below)
# -- the package name from the URL (i.e. x$package)
# -- the list of dependencies (i.e. deps)
#
# within get_package_mapping, x$package is also required,
# so deps missing it here are assigned NULL and then
# filtered out by the subsequent vapply statement
clean_dependencies <- function(deps) {
  dep_list <- lapply(deps, function(x) {
    if (is.null(x$src$file) | is.null(x$script) | (is.null(x$package))) {
      if (is.null(x$stylesheet) & is.null(x$src$href))
        stop(sprintf("Script dependencies with NULL href fields must include a file path, script name, and R package name."), call. = FALSE)
      else
        return(NULL)
    }
    else
      return(x)
    }
  )
  deps_with_file <- dep_list[!vapply(dep_list, is.null, logical(1))]
  
  return(deps_with_file)
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
}

# The function below requires a dependency path, package information
# retrieved from a request URL, as well as a list of dependencies
# (currently in htmltools htmlDependency format). get_package_mapping
# optionally returns an R package name (if the file is contained
# inside an R package), or NULL if the dependency is not found,
# and a (local) path to the dependency.
# 
# script_name is e.g. "dash_core_components.min.js"
# url_package is e.g. "dash_core_components"
# dependencies = list of htmlDependency objects
# this function returns a list with two elements:
#   rpkg_name = character string supplying the name of the R package
#   rpkg_path = character string providing the path to the dependency
get_package_mapping <- function(script_name, url_package, dependencies) {
  # TODO: improve validation of dependency inputs, particularly
  #       to avoid duplicating dependencies in the package_map
  package_map <- vapply(unique(dependencies), function(x) {
    if (x$name %in% c('react', 'react-dom')) {
      x$name <- 'dash-renderer'
    }
    dep_path <- file.path(x$src$file,
                          x$script)
  
    # remove n>1 slashes and replace with / if present;
    # htmltools seems to permit // in pathnames, but 
    # this complicates string matching unless they're
    # removed from the pathname
    result <- c(pkg_name=ifelse("package" %in% names(x), x$package, NULL),
                dep_name=x$name,
                dep_path=gsub("//+", replacement = "/", dep_path)
    )
  }, FUN.VALUE = character(3))
  
  package_map <- t(package_map)
  
  # pos_match is a vector of logical() values -- this allows filtering
  # of the package_map entries based on name, path, and matching of
  # URL package name against R package names. when all conditions are
  # satisfied, pos_match will return TRUE
  pos_match <- grepl(paste0(script_name, "$"), package_map[, "dep_path"]) &
               grepl(url_package, package_map[,"dep_name"])
  
  rpkg_name <- package_map[,"pkg_name"][pos_match]
  rpkg_path <- package_map[,"dep_path"][pos_match]
  
  return(list(rpkg_name=rpkg_name, rpkg_path=rpkg_path))
}

get_mimetype <- function(filename) {
  # the tools package is available to all
  filename_ext <- tools::file_ext(filename)
  
  if (filename_ext == 'js')
    return('application/JavaScript')
  else if (filename_ext == 'css')
    return('text/css')
  else if (filename_ext == 'map')
    return('application/json')
  else
    return(NULL)
}

generate_css_dist_html <- function(url) {
  if (grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$", url, perl=TRUE)) {
    sprintf("<link href=\"%s\" rel=\"stylesheet\" />", url)
  }
  else
    stop(sprintf("Invalid URL supplied in external_stylesheets. Please check the syntax used for this parameter."), call. = FALSE)
}

encode_plotly <- function(layout_objs) {
  for (i in seq_along(layout_objs)) {
    element <- layout_objs[[i]]
    if (is.list(element) && 
        "x" %in% names(layout_objs) && 
        "visdat" %in% names(layout_objs$x)) {
      # check to determine whether the current element is an
      # object output from the plot_ly function; if it is,
      # we can safely assume that it contains no other plot_ly
      # objects and return the updated element as a mutated
      # plotly figure argument that contains only data and
      # layout attributes. we suppress messages since the
      # plotly_build function will supply them, as it's typically
      # run interactively.
      obj <- suppressMessages(plotly::plotly_build(layout_objs[[i]])$x)
      layout_objs <- obj[c("data", "layout")]
      break
    } else if (is.list(element) & !(any(sapply(element, is.list)))) {
      # here we're checking to see if the current element is
      # a non-nested list; if this is TRUE, pass to the next
      # value of i and continue walking through all elements
      # of the current layout_objs
      next 
    } else if (is.list(element)) {
      # if the current element is a nested list, pass the
      # element to encode_plotly to continue recursing the
      # tree of components
      layout_objs[[i]] <- encode_plotly(element)
    }
  }
  layout_objs
}
