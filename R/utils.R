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
is.event <- function(x) is.dependency(x) && inherits(x, "event")

# components (TODO: this should be exported by dashRtranspile!)
is.component <- function(x) inherits(x, "dash_component")

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
    # up from the DashR package
    if (dep$name %in% c("react", "react-dom", "prop-types")) {
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
      full_path <- getDependencyPath(dep)
      modified <- as.integer(file.mtime(full_path))
    } else {
      modified <- as.integer(Sys.time())
    }

    # we don't want to serve the JavaScript source maps here,
    # until we are able to provide full support for debug mode,
    # as in Dash for Python
    if ("script" %in% names(dep) && tools::file_ext(dep[["script"]]) != "map") {
      if (!(is_local) & !(is.null(dep$src$href))) {
        html <- generate_js_dist_html(tagdata = dep$src$href)
      } else {
        script_mtime <- file.mtime(getDependencyPath(dep))
        modtime <- as.integer(script_mtime)
        dep$script <- buildFingerprint(dep$script, dep$version, modtime)
        dep[["script"]] <- paste0(path_prefix,
                                  "_dash-component-suites/",
                                  dep$name,
                                  "/",
                                  basename(dep[["script"]]),
                                  "?v=",
                                  dep$version,
                                  "&m=",
                                  modified)

        html <- generate_js_dist_html(tagdata = dep[["script"]], as_is = TRUE)
      }
    } else if (!(is_local) & "stylesheet" %in% names(dep) & src == "href") {
      html <- generate_css_dist_html(tagdata = paste(dep[["src"]][["href"]],
                                                  dep[["stylesheet"]],
                                                  sep="/"),
                                     local = FALSE)
    } else if ("stylesheet" %in% names(dep) & src == "file") {
      dep[["stylesheet"]] <- paste0(path_prefix,
                                    "_dash-component-suites/",
                                    dep$name,
                                    "/",
                                    basename(dep[["stylesheet"]]))

      if (!(is.null(dep$version))) {
        if(!is.null(dep$package)) {
          sheetpath <- paste0(dep[["stylesheet"]],
                              "?v=",
                              dep$version)

          html <- generate_css_dist_html(tagdata = sheetpath, as_is = TRUE)
        } else {
          sheetpath <- paste0(dep[["src"]][["file"]],
                              dep[["stylesheet"]],
                              "?v=",
                              dep$version)

          html <- generate_css_dist_html(tagdata = sheetpath, as_is = TRUE)
        }

      } else {
        sheetpath <- paste0(dep[["src"]][["file"]],
                            dep[["stylesheet"]])
        html <- generate_css_dist_html(tagdata = sheetpath, as_is = TRUE)
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

assertValidWildcards <- function(dependency) {
  if (is.symbol(dependency$id)) {
    result <- (jsonlite::validate(as.character(dependency$id)) && grepl("{", dependency$id))
  } else {
    result <- TRUE
  }
  if (!result) {
    dependencyType <- class(dependency)
    stop(sprintf("A callback %s ID contains restricted pattern matching callback selectors ALL, MATCH or ALLSMALLER. Please verify that it is formatted as a pattern matching callback list ID, or choose a different component ID.",
                 dependencyType[dependencyType %in% c("input", "output", "state")]),
         call. = FALSE)
  } else {
    return(result)
  }
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
    if (is.null(x$src$file) | (is.null(x$script) & is.null(x$stylesheet) & is.null(x$other)) | (is.null(x$package))) {
      if (is.null(x$src$href))
        stop(sprintf("Script, CSS, or other dependencies with NULL href fields must include a file path, dependency name, and R package name."), call. = FALSE)
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

insertIntoCallbackMap <- function(map, inputs, output, state, func, clientside_function) {
  output_id <- createCallbackId(output)

  if (output_id %in% names(map)) {
    stop(
      sprintf(
        "One or more of the following outputs are duplicated across callbacks: %s. Please ensure that all ID and property combinations are unique.",
        output_id
      ),
      call. = FALSE
    )
  }

  map[[output_id]] <- list(
    inputs = inputs,
    output = output,
    state = state,
    func = func,
    clientside_function = clientside_function
  )

  if (length(map) >= 2) {
    ids <- lapply(names(map), function(x) getIdProps(x)$ids)
    props <- lapply(names(map), function(x) getIdProps(x)$props)

    outputs_as_list <- mapply(paste, ids, props, sep=".", SIMPLIFY = FALSE)

    if (length(Reduce(intersect, outputs_as_list))) {
      stop(sprintf("One or more outputs are duplicated across callbacks. Please ensure that all ID and property combinations are unique."), call. = FALSE)
    }
  }
  return(map)
}

assert_valid_callbacks <- function(output, params, func) {
  inputs <- params[vapply(params, function(x) 'input' %in% attr(x, "class"), FUN.VALUE=logical(1))]
  state <- params[vapply(params, function(x) 'state' %in% attr(x, "class"), FUN.VALUE=logical(1))]

  invalid_params <- vapply(params, function(x) {
    !any(c('input', 'state') %in% attr(x, "class"))
  }, FUN.VALUE=logical(1))

  if (!is.list(output[[1]])) listed_output <- list(output) else listed_output <- output
  invalid_outputs <- vapply(listed_output, function(x) {
    !any(c('output') %in% attr(x, "class"))
  }, FUN.VALUE=logical(1))

  # Verify that no outputs are duplicated
  if (length(output) != length(unique(output))) {
    stop(sprintf("One or more callback outputs have been duplicated; please confirm that all outputs are unique."), call. = FALSE)
  }

  # Verify that params contains no elements that are not either members of 'input' or 'state' classes
  if (any(invalid_params)) {
    stop(sprintf("Callback parameters must be inputs or states. Please verify formatting of callback parameters."), call. = FALSE)
  }

   # Verify that output contains no elements that are not a member of the 'output' class.
  if (any(invalid_outputs)) {
    stop(sprintf("Callback outputs must be output function calls. Please verify formatting of callback outputs."), call. = FALSE)
  }


  # Assert that the component ID as passed is a string.
  # This function inspects the output object to see if its ID
  # is a valid string.
  validateOutput <- function(string) {
    return((is.character(string[["id"]]) & !grepl("^\\s*$", string[["id"]]) & !grepl("\\.", string[["id"]])))
  }

  # Check if the callback uses multiple outputs
  if (any(sapply(output, is.list))) {
    invalid_callback_ID <- (!all(vapply(output, validateOutput, logical(1))))
  } else {
    invalid_callback_ID <-  (!validateOutput(output))
  }
  if (invalid_callback_ID) {
    stop(sprintf("Callback IDs must be (non-empty) character strings that do not contain one or more dots/periods. Please verify that the component ID is valid."), call. = FALSE)
  }

  # Assert that user_function is a valid function
  if(!(is.function(func))) {
    if (!(all(names(func) == c("namespace", "function_name")))) {
      stop(sprintf("The callback method's 'func' parameter requires an R function or clientsideFunction call as its argument. Please verify that 'func' is either a valid R function or clientsideFunction."), call. = FALSE)
    }
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

  # Verify that 'input', 'state' and 'output' parameters only contain 'Wildcard' keywords if they are JSON formatted ids for pattern matching callbacks
  valid_wildcard_inputs <- sapply(inputs, function(x) {
    assertValidWildcards(x)
  })


  valid_wildcard_state <- sapply(state, function(x) {
    assertValidWildcards(x)
  })

  if(any(sapply(output, is.list))) {
    valid_wildcard_output <- sapply(output, function(x) {
      assertValidWildcards(x)
    })
  } else {
    valid_wildcard_output <- sapply(list(output), function(x) {
      assertValidWildcards(x)
    })
  }


  # Check that outputs are not inputs
  # https://github.com/plotly/dash/issues/323

  # helper function to permit same mapply syntax regardless
  # of whether output is defined using output function or not
  listWrap <- function(x){
    if (!any(sapply(x, is.list))) {
      return(list(x))
    } else {
      x
    }
  }

  # determine whether any input matches the output, or outputs, if
  # multiple callback scenario
  inputs_vs_outputs <- mapply(function(inputObject, outputObject) {
    identical(outputObject[["id"]], inputObject[["id"]]) & identical(outputObject[["property"]], inputObject[["property"]])
  }, inputs, listWrap(output))

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

resolvePrefix <- function(prefix, environment_var, base_pathname) {
  if (!(is.null(prefix))) {
    assertthat::assert_that(is.character(prefix))

    return(prefix)
  } else {
    # Check environment variables
    prefix_env <- Sys.getenv(environment_var)
    env_base_pathname <- Sys.getenv("DASH_URL_BASE_PATHNAME")
    app_name <- Sys.getenv("DASH_APP_NAME")
    if (prefix_env != "")
      return(prefix_env)
    else if (app_name != "")
      return(sprintf("/%s/", app_name))
    else if (env_base_pathname != "")
      return(env_base_pathname)
    else
      return(base_pathname)
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
    if (x$name %in% c('react', 'react-dom', 'prop-types')) {
      x$name <- 'dash-renderer'
    }

    if (!is.null(x$script))
      dep_path <- file.path(x$src$file, x$script)
    else if (!is.null(x$stylesheet))
      dep_path <- file.path(x$src$file, x$stylesheet)
    else if (!is.null(x$other))
      dep_path <- file.path(x$src$file, x$other)

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
  filename_ext <- getFileExt(filename)

  if (filename_ext == 'js')
    return('application/JavaScript')
  else if (filename_ext == 'css')
    return('text/css')
  else if (filename_ext %in% c('js.map', 'map'))
    return('application/json')
  else
    return(mime::guess_type(filename,
                            empty = "application/octet-stream"))
}

generate_css_dist_html <- function(tagdata,
                                   local = FALSE,
                                   local_path = NULL,
                                   prefix = NULL,
                                   as_is = FALSE) {
  attribs <- names(tagdata)
  if (!(local)) {
    if (any(grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$",
        tagdata,
        perl=TRUE)) || as_is) {
            if (is.list(tagdata))
                glue::glue('<link ', glue::glue_collapse(glue::glue('{attribs}="{tagdata}"'), sep=" "), ' rel="stylesheet">')
            else {
                interpolated_link <- glue::glue('href="{tagdata}"')
                glue::glue('<link ', '{interpolated_link}', ' rel="stylesheet">')
            }
    }
    else
      stop(sprintf("Invalid URL supplied in external_stylesheets. Please check the syntax used for this parameter."), call. = FALSE)
  } else {
    modified <- as.integer(file.mtime(local_path))
    # strip leading slash from href if present
    if (is.list(tagdata)) {
        tagdata$href <- paste0(prefix, sub("^/", "", tagdata$href))
        glue::glue('<link ', glue::glue_collapse(glue::glue('{attribs}="{tagdata}?m={modified}"'), sep=" "), ' rel="stylesheet">')
    }
    else {
        tagdata <- sub("^/", "", tagdata)
        interpolated_link <- glue::glue('href="{prefix}{tagdata}?m={modified}"')
        glue::glue('<link ', '{interpolated_link}', ' rel="stylesheet">')
    }
  }
}


generate_js_dist_html <- function(tagdata,
                                  local = FALSE,
                                  local_path = NULL,
                                  prefix = NULL,
                                  as_is = FALSE) {
  attribs <- names(tagdata)
  if (!(local)) {
    if (any(grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$",
        tagdata,
        perl=TRUE)) || as_is) {
            if (is.list(tagdata))
                glue::glue('<script ', glue::glue_collapse(glue::glue('{attribs}="{tagdata}"'), sep=" "), '></script>')
            else {
                interpolated_link <- glue::glue('src="{tagdata}"')
                glue::glue('<script ', '{interpolated_link}', '></script>')
            }
        }
    else
      stop(sprintf("Invalid URL supplied. Please check the syntax used for this parameter."), call. = FALSE)
  } else {
    modified <- as.integer(file.mtime(local_path))
    # strip leading slash from href if present
    if (is.list(tagdata)) {
        tagdata$src <- paste0(prefix, sub("^/", "", tagdata$src))
        glue::glue('<script ', glue::glue_collapse(glue::glue('{attribs}="{tagdata}?m={modified}"'), sep=" "), '></script>')
    }
    else {
        tagdata <- sub("^/", "", tagdata)
        interpolated_link <- glue::glue('src="{prefix}{tagdata}?m={modified}"')
        glue::glue('<script ', '{interpolated_link}', '></script>')
    }
  }
}

assertValidExternals <- function(scripts, stylesheets) {
    allowed_js_attribs <- c("async",
                            "crossorigin",
                            "defer",
                            "integrity",
                            "nomodule",
                            "nonce",
                            "referrerpolicy",
                            "src",
                            "type",
                            "charset",
                            "language")

    allowed_css_attribs <- c("as",
                             "crossorigin",
                             "disabled",
                             "href",
                             "hreflang",
                             "importance",
                             "integrity",
                             "media",
                             "referrerpolicy",
                             "rel",
                             "sizes",
                             "title",
                             "type",
                             "methods",
                             "prefetch",
                             "target",
                             "charset",
                             "rev")
    script_attributes <- character()
    stylesheet_attributes <- character()

    for (item in scripts) {
      if (is.list(item)) {
        if (!"src" %in% names(item) || !(any(grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$",
            item,
            perl=TRUE))))
          stop("A valid URL must be included with every entry in external_scripts. Please sure no 'src' entries are missing or malformed.", call. = FALSE)
        if (any(names(item) == ""))
          stop("Please verify that all attributes are named elements when specifying URLs for scripts and stylesheets.", call. = FALSE)
        script_attributes <- c(script_attributes, names(item))
      }
      else {
        if (!grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$",
            item,
            perl=TRUE))
            stop("A valid URL must be included with every entry in external_scripts. Please sure no 'src' entries are missing or malformed.", call. = FALSE)
        script_attributes <- c(script_attributes, character(0))
      }
    }

    for (item in stylesheets) {
      if (is.list(item)) {
        if (!"href" %in% names(item) || !(any(grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$",
            item,
            perl=TRUE))))
          stop("A valid URL must be included with every entry in external_stylesheets. Please sure no 'href' entries are missing or malformed.", call. = FALSE)
        if (any(names(item) == ""))
          stop("Please verify that all attributes are named elements when specifying URLs for scripts and stylesheets.", call. = FALSE)
        stylesheet_attributes <- c(stylesheet_attributes, names(item))
      }
      else {
        if (!grepl("^(?:http(s)?:\\/\\/)?[\\w.-]+(?:\\.[\\w\\.-]+)+[\\w\\-\\._~:/?#[\\]@!\\$&'\\(\\)\\*\\+,;=.]+$",
            item,
            perl=TRUE))
            stop("A valid URL must be included with every entry in external_stylesheets. Please sure no 'href' entries are missing or malformed.", call. = FALSE)
        stylesheet_attributes <- c(stylesheet_attributes, character(0))
      }
    }

    invalid_script_attributes <- setdiff(script_attributes, allowed_js_attribs)
    invalid_stylesheet_attributes <- setdiff(stylesheet_attributes, allowed_css_attribs)

    if (length(invalid_script_attributes) > 0 || length(invalid_stylesheet_attributes) > 0) {
      stop(sprintf("The following script or stylesheet attributes are invalid: %s.",
           paste0(c(invalid_script_attributes, invalid_stylesheet_attributes), collapse=", ")), call. = FALSE)
    }
    invisible(TRUE)
  }

generate_meta_tags <- function(metas) {
  has_ie_compat <- any(vapply(metas, function(x)
    x$name == "http-equiv" && x$content == "X-UA-Compatible",
    logical(1)), na.rm=TRUE)
  has_charset <- any(vapply(metas, function(x)
    "charset" %in% names(x),
    logical(1)), na.rm=TRUE)

  # allow arbitrary tags with varying numbers of keys
  tags <- vapply(metas,
                 function(tag) sprintf("<meta %s>", paste(sprintf("%s=\"%s\"",
                                                                  names(tag),
                                                                  unlist(tag, use.names = FALSE)),
                                                          collapse=" ")),
                 character(1))

  if (!has_ie_compat) {
    tags <- c('<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">', tags)
  }

  if (!has_charset) {
    tags <- c('<meta charset=\"UTF-8\">', tags)
  }
  return(tags)
}

# This function takes the list object containing asset paths
# for all stylesheets and scripts, as well as the URL path
# to search, then returns the absolute local path (when
# present) to the requested asset
#
# e.g. assets_map is a named list potentially containing
#      $css, a list of absolute paths as character strings
#      for all locally supplied CSS assets, named with their
#      assets pathname (i.e. "assets/stylesheet.css"), and
#      $scripts, a list of character strings formatted
#      identically to $css, also named with subpaths.
#
get_asset_path <- function(assets_map, asset_path) {
  unlist(setNames(assets_map, NULL))[asset_path]
}

# This function returns the URL corresponding to assets
# included in the asset map, with the request prefix
# prepended, e.g. when asset_path is
#
#                   assets/stylesheet.css
# "/Users/testuser/assets/stylesheet.css"
#
#            ... the function will return
#
#               "/assets/stylesheet.css"
#
get_asset_url <- function(asset_path, prefix = "/") {
  # the subpath is stored in the names attribute
  # of the return object from get_asset_path, so
  # we can retrieve it using names()
  asset <- names(asset_path)

  # strip one or more trailing slashes, since we'll
  # introduce one when we concatenate the prefix and
  # asset path
  prefix <- gsub(pattern = "/+$",
                 replacement = "",
                 x = prefix)

  # prepend the asset name with the route prefix
  return(paste(prefix, asset, sep="/"))
}

encode_plotly <- function(layout_objs) {
  if (is.list(layout_objs)) {
    if ("plotly" %in% class(layout_objs) &&
        "x" %in% names(layout_objs) &&
        any(c("visdat", "data") %in% names(layout_objs$x))) {
      # check to determine whether the current element is an
      # object output from the plot_ly or ggplotly function;
      # if it is, we can safely assume that it contains no
      # other plot_ly or ggplotly objects and return the updated
      # element as a mutated plotly figure argument that contains
      # only data and layout attributes. we suppress messages
      # since the plotly_build function will supply them, as it's
      # typically run interactively.
      obj <- suppressMessages(plotly::plotly_build(layout_objs)$x)
      layout_objs <- obj[c("data", "layout")]
      return(layout_objs)
    } else {
      for (i in seq_along(layout_objs)) {
        # if the current element is a nested list, pass the
        # element to encode_plotly to continue recursing the
        # tree of components
        if (any(sapply(layout_objs[[i]], is.list)))
          layout_objs[[i]] <- encode_plotly(layout_objs[[i]])
      }
    }
  }
  layout_objs
}

# This function formats the output from sys.calls()
# so that it is pretty printed to stderr()
printCallStack <- function(call_stack, header=TRUE) {
  if (header) {
    write(crayon::yellow$bold(" ### Dash for R Traceback (most recent/innermost call last) ###"), stderr())
  }
  write(
    crayon::white(
      paste0(
        "    ",
        seq_along(
          call_stack
          ),
        ": ",
        call_stack,
        " ",
        lapply(call_stack, attr, "flineref")
        )
    ),
    stderr()
    )
}

stackTraceToHTML <- function(call_stack,
                             throwing_call,
                             error_message) {
  if(is.null(call_stack)) {
    return(NULL)
  }
  header <- " ### Dash for R Traceback (most recent/innermost call last) ###\n"

  formattedStack <- c(paste0(
    "    ",
    seq_along(
      call_stack
    ),
    ": ",
    call_stack,
    " ",
    lapply(call_stack, attr, "lineref"),
    collapse="\n"
  )
  )

  template <- "%s\nError: %s: %s\n%s"
  response <- sprintf(template,
                      header,
                      throwing_call,
                      error_message,
                      formattedStack)

  # properly format anonymous tags if present in call stack
  #response <- gsub("<anonymous>", "&lt;anonymous&gt;", response)

  return(response)
}

# This function is essentially the R equivalent of a
# Python decorator method; if debug mode is active,
# it will wrap an expression using withCallingHandlers
# and capture the call stack. By default, the call
# stack will be "pruned" of error handling functions
# for greater readability.
getStackTrace <- function(expr, debug = FALSE, prune_errors = TRUE) {
  if (debug) {
    tryCatch(withCallingHandlers(
      expr,
      error = function(e) {
        if (is.null(attr(e, "stack.trace", exact = TRUE))) {
          calls <- sys.calls()
          reverseStack <- rev(calls)
          attr(e, "stack.trace") <- calls

          if (!is.null(e$call[[1]]))
            errorCall <- e$call[[1]]
          else {
            # attempt to capture the error or warning if thrown by
            # simpleError or simpleWarning (which may arise for user-defined errors)
            #
            # the first matching call in the reversed stack will always be
            # getStackTrace, so we select the second match instead
            errorCall <- reverseStack[grepl(x=reverseStack, "simpleError|simpleWarning")][[2]]
          }

          functionsAsList <- lapply(calls, function(completeCall) {
            # avoid attempting to cast closures as strings, which will fail
            # some calls in the stack are symbol (name) objects, while others
            # are calls, which must be deparsed; the first element in the vector
            # should be the function signature
            if (is.name(completeCall[[1]]))
              currentCall <- as.character(completeCall[[1]])
            else if (is.call(completeCall[[1]]))
              currentCall <- deparse(completeCall)[1]
            else
              currentCall <- completeCall[[1]]

            attr(currentCall, "flineref") <- getLineWithError(completeCall, formatted=TRUE)
            attr(currentCall, "lineref") <- getLineWithError(completeCall, formatted=FALSE)

            if (is.function(currentCall) & !is.primitive(currentCall)) {
              constructedCall <- paste0("<anonymous> function(",
                                        paste(names(formals(currentCall)), collapse = ", "),
                                        ")")
              return(constructedCall)
            } else {
              return(currentCall)
            }

          })

          if (prune_errors) {
            # this line should match the last occurrence of the function
            # which raised the error within the call stack; prune here
            indexFromLast <- match(TRUE, lapply(reverseStack, function(currentCall) {
              # if the first element of the current call pulled from the stack
              # is a function, deparse the error object's call and compare
              # to the current call from the stack -- if they're the same,
              # return TRUE -- the match function will return the position
              # of the first successful match.
              #
              # since the stack of calls being evaluated is reversed, "pruning"
              # here has the effect of capturing the stack up to the most recent
              # call which matches the call throwing the error. the call may have
              # not thrown an error further up the stack, so we want to be sure
              # to stop at the correct position.
              if (is.function(currentCall[[1]])) {
                identical(deparse(errorCall), deparse(currentCall[[1]]))
              } else if (currentCall[[1]] == "stop") {
                # handle case where function developer deliberately invokes a stop
                # condition and halts function execution
                TRUE
              } else {
                FALSE
              }
            }))
            # the position to stop at is one less than the difference
            # between the total number of calls and the index of the
            # call throwing the error
            stopIndex <- length(calls) - indexFromLast + 1

            startIndex <- match(TRUE, lapply(functionsAsList, function(fn) fn == "getStackTrace"))
            functionsAsList <- functionsAsList[seq(startIndex, stopIndex)]
            functionsAsList <- removeHandlers(functionsAsList)
          }

          warning(call. = FALSE, immediate. = TRUE, sprintf("Execution error in %s: %s",
                                                            functionsAsList[[length(functionsAsList)]],
                                                            conditionMessage(e)))

          stack_message <- stackTraceToHTML(functionsAsList,
                                            functionsAsList[[length(functionsAsList)]],
                                            conditionMessage(e))

          assign("stack_message", value=stack_message,
                 envir=sys.frame(countEnclosingFrames("private"))$private)

          printCallStack(functionsAsList)
        }
      }
    ),
    error = function(e) {
      write(crayon::yellow$bold("in debug mode, catching error as warning ..."), stderr())
      }
    )
    } else {
      evalq(expr)
  }
}

getLineWithError <- function(currentCall, formatted=TRUE) {
  srcref <- attr(currentCall, "srcref", exact = TRUE)
  if (!is.null(srcref) & !(getAppPath()==FALSE)) {
    # filename
    srcfile <- attr(srcref, "srcfile", exact = TRUE)
    # line number
    context <- sprintf("-- %s, Line %s", srcfile$filename, srcref[[1]])
    if (formatted)
      context <- crayon::yellow$italic(context)
    return(context)
  } else
    ""
}

# This helper function drops error
# handling functions from the call
# stack, as these are generally not
# useful.
#
# TODO: modify this function such
# that these handlers are only pruned
# *after* the function throwing the
# error has entered the stack for
# the last time.
removeHandlers <- function(fnList) {
  omittedStrings <- c("withCallingHandlers",
                      "tryCatch",
                      "tryCatchList",
                      "tryCatchOne",
                      "doTryCatch",
                      ".handleSimpleError",
                      "h",
                      ".handleSimpleError",
                      "withRestarts")
  return(fnList[!fnList %in% omittedStrings])
}

setCallbackContext <- function(callback_elements) {
  # Set state elements for this callback

  if (length(callback_elements$state[[1]]) == 0) {
    states <- sapply(callback_elements$state, function(x) {
      setNames(list(x$value), paste(x$id, x$property, sep="."))
    })
  } else if (is.character(callback_elements$state[[1]][[1]])) {
    states <- sapply(callback_elements$state, function(x) {
      setNames(list(x$value), paste(x$id, x$property, sep="."))
    })
  } else {
    states <- sapply(callback_elements$state, function(x) {
      states_vector <- unlist(x)
      setNames(list(states_vector[grepl("value|value.", names(states_vector))]),
               paste(as.character(jsonlite::toJSON(x[[1]])), x$property, sep="."))
    })
  }

  splitIdProp <- function(x) unlist(strsplit(x, split = "[.]"))

  triggered <- lapply(callback_elements$changedPropIds,
                      function(x) {
                        input_id <- splitIdProp(x)[1]
                        prop <- splitIdProp(x)[2]

                        # The following conditionals check whether the callback is a pattern-matching callback and if it has been triggered.
                        if (startsWith(input_id, "{")){
                          id_match <- vapply(callback_elements$inputs, function(x) {
                            x <- unlist(x)
                            any(x[grepl("id.", names(x))] %in% jsonlite::fromJSON(input_id)[[1]])
                          }, logical(1))[[1]]
                        } else {
                          id_match <- vapply(callback_elements$inputs, function(x) {
                            unlist(x)
                            any(x$id %in% input_id)}, logical(1))
                        }

                        if (startsWith(input_id, "{")){
                          prop_match <- vapply(callback_elements$inputs, function(x) {
                            x <- unlist(x)
                            any(x[names(x) == "property"] %in% prop)
                          }, logical(1))[[1]]
                        } else {
                          prop_match <- vapply(callback_elements$inputs, function(x) {
                            unlist(x)
                            any(x$property %in% prop)}, logical(1))
                        }

                        if (startsWith(input_id, "{")){
                          if (length(callback_elements$inputs) == 1 || !is.null(unlist(callback_elements$inputs, recursive = F)$value)) {
                            value <- sapply(callback_elements$inputs[id_match & prop_match], `[[`, "value")
                          } else {
                            value <- sapply(callback_elements$inputs[id_match & prop_match][[1]], `[[`, "value")
                          }
                        } else {
                          value <- sapply(callback_elements$inputs[id_match & prop_match], `[[`, "value")
                        }

                        return(list(`prop_id` = x, `value` = value))
                      }
                    )
  if (length(callback_elements$inputs[[1]]) == 0 || is.character(callback_elements$inputs[[1]][[1]])) {
    inputs <- sapply(callback_elements$inputs, function(x) {
      setNames(list(x$value), paste(x$id, x$property, sep="."))
    })
  } else if (length(callback_elements$inputs[[1]]) > 1) {
    inputs <- sapply(callback_elements$inputs, function(x) {
      inputs_vector <- unlist(x)
      setNames(list(inputs_vector[grepl("value|value.", names(inputs_vector))]), paste(as.character(jsonlite::toJSON(x$id)), x$property, sep="."))
    })
  } else {
    inputs <- sapply(callback_elements$inputs, function(x) {
      inputs_vector <- unlist(x)
      setNames(list(inputs_vector[grepl("value|value.", names(inputs_vector))]), paste(as.character(jsonlite::toJSON(x[[1]]$id)), x[[1]]$property, sep="."))
    })
  }

  return(list(states=states,
              triggered=unlist(triggered, recursive=FALSE),
              inputs=inputs))
}

getDashMetadata <- function(pkgname) {
  fnList <- ls(getNamespace(pkgname), all.names = TRUE)
  metadataFn <- as.vector(fnList[grepl("^\\.dash.+_js_metadata$", fnList)])
  return(metadataFn)
}

createCallbackId <- function(output) {
  # check if callback uses single output
  if (!any(sapply(output, is.list))) {
    id <- paste0(output, collapse=".")
  } else {
    # multi-output callback, concatenate
    ids <- vapply(output, function(x) {
      paste(x, collapse = ".")
    }, character(1))
    id <- paste0("..", paste0(ids, collapse="..."), "..")
  }
  return(id)
}

getIdProps <- function(output) {
  output_ids <- strsplit(gsub("^\\.{2}|\\.{2}$", "", output), '...', fixed=TRUE)
  idprops <- lapply(output_ids, strsplit, '.', fixed=TRUE)
  ids <- vapply(unlist(idprops, recursive=FALSE), '[', character(1), 1)
  props <- vapply(unlist(idprops, recursive=FALSE), '[', character(1), 2)
  return(list(ids=ids, props=props))
}

modtimeFromPath <- function(path, recursive = FALSE, asset_path="") {
  # ensure path is properly formatted
  path <- normalizePath(path)

  if (is.null(path)) {
    return(NULL)
  }

  if (recursive) {
    if (asset_path != "") {
      all_files <- file.info(list.files(path, recursive = TRUE))
      # need to exclude files which are in assets directory so we don't always hard reload
      initpath <- vapply(strsplit(rownames(all_files), split = .Platform$file.sep), `[`, FUN.VALUE=character(1), 1)
      # now subset the modtimes, and identify the most recently modified file
      modtime <- as.integer(max(all_files$mtime[which(initpath != asset_path)], na.rm = TRUE))
    } else {
      # now identify the most recently modified file
      all_files <- list.files(path, recursive = TRUE, full.names = TRUE)
      modtime <- as.integer(max(file.info(all_files)$mtime, na.rm=TRUE))
    }
  } else {
    # check if the path is for a directory or file, and handle accordingly
    if (length(path) == 1 && dir.exists(path))
      modtime <- as.integer(max(file.info(list.files(path, full.names = TRUE))$mtime, na.rm=TRUE))
    else
      modtime <- as.integer(file.info(path)$mtime)
  }

  return(modtime)
}

getAppPath <- function() {
  # attempt to retrieve path for Dash apps served via
  # Rscript or source()
  cmd_args <- commandArgs(trailingOnly = FALSE)
  file_argument <- "--file="
  matched_arg <- grep(file_argument, cmd_args)

  # if app is instantiated via Rscript, cmd_args should contain path
  if (length(matched_arg) > 0) {
    # Rscript
    return(normalizePath(sub(file_argument, "", cmd_args[matched_arg])))
  }
  # if app is instantiated via source(), sys.frames should contain path
  else if (!is.null(sys.frames()[[1]]$ofile)) {
    return(normalizePath(sys.frames()[[1]]$ofile))
  }
  else {
    return(FALSE)
  }
}

# this function enables Dash to set file modification times
# as attributes on the vectors stored within the asset map
#
# this permits storing additional information on the object
# without dramatically modifying the existing API, and makes
# it somewhat trivial to request the set of modification times
setModtimeAsAttr <- function(path) {
  if (!is.null(path)) {
    mtime <- modtimeFromPath(path)
    attributes(path)$modtime <- mtime
    return(path)
  } else {
    return(NULL)
  }
}

countEnclosingFrames <- function(object) {
  for (i in 1:sys.nframe()) {
    objs <- ls(envir=sys.frame(i))
    if (object %in% objs)
      return(i)
  }
}

changedAssets <- function(before, after) {
  # identify files that used to exist in the asset map,
  # but which have been removed
  deletedElements <-  before[which(is.na(match(before, after)))]

  # identify files which were added since the last refresh
  addedElements <-  after[which(is.na(match(after, before)))]

  # identify any items that have been updated since the last
  # refresh based on modification time attributes set in map
  #
  # in R, attributes are discarded when subsetting, so it's
  # necessary to subset the attributes being compared instead.
  # here we only compare objects which overlap
  before_modtimes <-attributes(before)$modtime[before %in% after]
  after_modtimes <- attributes(after)$modtime[after %in% before]

  changedElements <- after[which(after_modtimes > before_modtimes)]

  if (length(deletedElements) == 0) {
    deletedElements <- NULL
  }
  if (length(changedElements) == 0) {
    changedElements <- NULL
  }
  if (length(addedElements) == 0) {
    addedElements <- NULL
  }
  invisible(return(
    list(deleted = deletedElements,
         changed = changedElements,
         new = addedElements)
  )
  )
}

dashLogger <- function(event = NULL,
                       message = NULL,
                       request = NULL,
                       time = Sys.time(),
                       ...) {
  orange <- crayon::make_style("orange")

  # dashLogger is being called from within fiery, and the Fire() object generator
  # is called from a private method within the Dash() R6 class; this makes
  # accessing variables set within Dash's private fields somewhat complicated
  #
  # the following lines retrieve the value of the silence_route_logging parameter,
  # which is many frames up the stack; if it's not found, we'll assume FALSE
  self_object <- dynGet("self", ifnotfound = NULL)

  if (!is.null(self_object))
    silence_routes_logging <- self_object$config$silence_routes_logging
  else
    silence_routes_logging <- FALSE

  if (!is.null(event)) {
    msg <- sprintf("%s: %s", event, message)

    msg <- switch(event, error = crayon::red(msg), warning = crayon::yellow(msg),
                  message = crayon::blue(msg), msg)

    # assign the status group for color coding
    if (event == "request") {
      status_group <- as.integer(cut(request$respond()$status,
                                     breaks = c(100, 200, 300, 400, 500, 600), right = FALSE))

      msg <- switch(status_group, crayon::blue$bold(msg), crayon::green$bold(msg),
                    crayon::cyan$bold(msg), orange$bold(msg), crayon::red$bold(msg))
    }

    # if log messages are suppressed, report only server stop/start messages, errors, and warnings
    # otherwise, print everything to console
    if (event %in% c("start", "stop", "error", "warning") || !(silence_routes_logging)) {
      cat(msg, file = stdout(), append = TRUE)
      cat("\n", file = stdout(), append = TRUE)
    }
  }
}

#' Define a clientside callback
#'
#' Create a callback that updates the output by calling a clientside (JavaScript) function instead of an R function.
#' Note that it is also possible to specify JavaScript as a character string instead of passing `clientsideFunction`.
#' In this case Dash will inline your JavaScript automatically, without needing to save a script inside `assets`.
#'
#' @param namespace Character. Describes where the JavaScript function resides (Dash will look
#' for the function at `window[namespace][function_name]`.)
#' @param function_name Character. Provides the name of the JavaScript function to call.
#'
#' @details With this signature, Dash's front-end will call `window.my_clientside_library.my_function` with the current
#' values of the `value` properties of the components `my-input` and `another-input` whenever those values change.
#' Include a JavaScript file by including it your `assets/` folder. The file can be named anything but you'll need to
#' assign the function's namespace to the `window`. For example, this file might look like:
#' \preformatted{window.my_clientside_library = \{
#' my_function: function(input_value_1, input_value_2) \{
#'    return (
#'      parseFloat(input_value_1, 10) +
#'        parseFloat(input_value_2, 10)
#'    );
#' \}
#'\}
#'}
#'
#'
#' @export
#' @examples \dontrun{
#' app$callback(
#'   output('output-clientside', 'children'),
#'   params=list(input('input', 'value')),
#'   clientsideFunction(
#'   namespace = 'my_clientside_library',
#'   function_name = 'my_function'
#'   )
#' )
#'
#' # Passing JavaScript as a character string
#' app$callback(
#'  output('output-clientside', 'children'),
#'  params=list(input('input', 'value')),
#'  "function (value) {
#'        return 'Client says \"' + value + '\"';
#'  }"
#')}
clientsideFunction <- function(namespace, function_name) {
  return(list(namespace=namespace, function_name=function_name))
}

buildFingerprint <- function(path, version, hash_value) {
  path <- file.path(path)
  filename <- getFileSansExt(path)
  extension <- getFileExt(path)

  sprintf("%s.v%sm%s.%s",
          file.path(dirname(path), filename),
          gsub("[^\\w-]", "_", version, perl = TRUE),
          hash_value,
          extension)
}

checkFingerprint <- function(path) {
  name_parts <- unlist(strsplit(basename(path), ".", fixed = TRUE))

  # Check if the resource has a fingerprint
  if ((length(name_parts) > 2) && grepl("^v[\\w-]+m[0-9a-fA-F]+$", name_parts[2], perl = TRUE)) {
    return(list(paste(name_parts[name_parts != name_parts[2]], collapse = "."), TRUE))
  }
  return(list(basename(path), FALSE))
}

getDependencyPath <- function(dep) {
  if (missing(dep)) {
    stop("getDependencyPath requires that a valid dependency object is passed. Please verify that dep is non-missing.")
  }

  if(!(is.null(dep$script))) {
    filename <- checkFingerprint(dep$script)[[1]]
    dirname <- returnDirname(dep$script)
    } else {
      filename <- dep$stylesheet
      dirname <- returnDirname(filename)
    }

  dep_path <- file.path(dep$src$file, filename)

  # the gsub line is to remove stray duplicate slashes, to
  # permit exact string matching on pathnames
  dep_path <- gsub("//+",
                   "/",
                   dep_path)

  # this may generate doubled slashes, which should not
  # pose problems on Mac OS, Windows, or Linux systems
  full_path_to_dependency <- system.file(file.path(dep$src$file,
                                                   dirname,
                                                   filename),
                                         package=dep$package)

  if (!file.exists(full_path_to_dependency)) {
    write(crayon::yellow(sprintf("The dependency path '%s' within the '%s' package is invalid; cannot find '%s'.",
                                 dep_path,
                                 dep$package,
                                 filename)
                         ),
          stderr())
  }

  return(full_path_to_dependency)
}

# the base R functions which strip extensions and filenames without
# extensions from paths are not robust to multipart extensions,
# such as .js.map or .min.js; these are functions intended to
# perform reliably in such cases. the first occurrence of a dot
# is replaced with an asterisk, which is generally an invalid
# filename character in any modern filesystem, since it represents
# a wildcard. the resulting string is then split on the asterisk.
getFileSansExt <- function(filepath) {
  unlist(strsplit(sub("[.]", "*", basename(filepath)), "[*]"))[1]
}

getFileExt <- function(filepath) {
  unlist(strsplit(sub("[.]", "*", basename(filepath)), "[*]"))[2]
}

returnDirname <- function(filepath) {
  dirname <- dirname(filepath)
  if (is.null(dirname) || dirname == ".")
    return("")
  return(dirname)
}

isDynamic <- function(eager_loading, resource) {
  if (
    is.null(resource$dynamic) && is.null(resource$async)
  )
    return(FALSE)
  # need assert that async and dynamic are not both present
  if (
    (!is.null(resource$dynamic) && (resource$dynamic == FALSE)) ||
    (eager_loading==TRUE && !is.null(resource$async) && (resource$async %in% c("eager", TRUE)))
  )
    return(FALSE)
  else
    return(TRUE)
}

tryCompress <- function(request, response) {
  # charToRaw requires a length one character string
  response$body <- paste(response$body, collapse="\n")
  # the reqres gzip implementation requires file I/O
  # brotli does not; when available, use brotli with
  # a moderate level of compression for speed --
  # the viewer pane only supports gzip and deflate,
  # so gzip will be used when launching apps within
  # RStudio
  tryBrotli <- request$accepts_encoding('br')
  if (tryBrotli == "br") {
    response$body <- brotli::brotli_compress(charToRaw(response$body),
                                             quality = 3)
    response$set_header('Content-Encoding',
                        "br")
    return(response)
  }
  return(response$compress())
}

get_relative_path <- function(requests_pathname, path) {
  # Returns a path with the config setting 'requests_pathname_prefix' prefixed to
  # it. This is particularly useful for apps deployed on Dash Enterprise, which makes
  # it easier to serve apps under both URL prefixes and localhost.

  if (requests_pathname == "/" && path == "") {
    return("/")
  }
  else if (requests_pathname != "/" && path == "") {
    return(requests_pathname)
  }
  else if (!startsWith(path, "/")) {
    stop(sprintf(paste0("Unsupported relative path! Paths that aren't prefixed" ,
                        "with a leading '/' are not supported. You supplied '%s'."),
                 path))
  }
  else {
    return(paste(gsub("/$", "", requests_pathname), gsub("^/", "", path), sep = "/"))
  }
}

strip_relative_path <- function(requests_pathname, path) {
  # Returns a relative path with the `requests_pathname_prefix` and leadings and trailing
  # slashes stripped from it. This function is particularly relevant to dccLocation pathname routing.
  if (is.null(path)) {
    return(NULL)
  }
  else if ((requests_pathname != "/" && !startsWith(path, gsub("/$", "", requests_pathname)))
          || (requests_pathname == "/" && !startsWith(path, "/"))) {
    stop(sprintf(paste0("Unsupported relative path! Path's that are not prefixed ",
                        "with a leading 'requests_pathname_prefix` are not suported. ",
                        "You supplied '%s', and requests_pathname_prefix was '%s'."),
                 path, requests_pathname
                 ))
  }
  else if (requests_pathname != "/" && startsWith(path, gsub("/$", "", requests_pathname))) {
    path = sub(gsub("/$", "", requests_pathname), "", path)
  }
  return(trimws(gsub("/", "", path)))
}

interpolate_str <- function(index_template, ...) {
  # This function takes an index string, along with
  # user specified keys for the html keys of the index
  # and sets the default values of the keys to the
  # ones specified by the keys themselves, returning
  # the custom index template.
  template = index_template
  kwargs <- list(...)

  for (name in names(kwargs)) {
    key = paste0('\\{', name, '\\}')

    template = sub(key, kwargs[[name]], template)
  }
  return(template)
}

validate_keys <- function(string, is_template) {
  required_keys <- c("app_entry", "config", "scripts")

  if (is_template)
    keys_present <- vapply(required_keys, function(x) grepl(x, string), logical(1))
  else
    keys_present <- vapply(required_keys, function(x) x %in% string, logical(1))

  if (!all(keys_present)) {
    stop(sprintf("Did you forget to include %s in your index string?",
                 paste(names(keys_present[keys_present==FALSE]), collapse = ", ")))
  } else {
    return(string)
  }
}

# Dash Layout Helper Functions

#' Is the given object a Dash app?
#' @param x Any object.
is_dash_app <- function(x) {
  inherits(x, "Dash")
}

assert_dash <- function(x) {
  if (!is_dash_app(x)) {
    stop("You must provide a Dash app object (created with `Dash$new()` or `dash_app()`)", call. = FALSE)
  }
  invisible(TRUE)
}

componentify <- function(x) {
  if (asNamespace("dash")$is.component(x)) {
    x
  } else if (inherits(x, "shiny.tag") || inherits(x, "shiny.tag.list")) {
    stop("dash: layout cannot include Shiny tags (you might have loaded the {shiny} package after loading {dash})", call. = FALSE)
  } else if (is.list(x)) {
    x <- remove_empty(x)
    htmlDiv(children = lapply(x, componentify))
  } else if (length(x) == 1) {
    htmlSpan(children = x)
  } else if (is.null(x)) {
    return(NULL)
  } else {
    stop("dash: layout must be a dash component or list of dash components", call. = FALSE)
  }
}

remove_empty <- function(x) {
  Filter(Negate(is.null), x)
}
