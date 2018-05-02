# ----------------------------------------------------------------------------
# Class assertion
# ----------------------------------------------------------------------------

# fiery server
is.fire <- function(x) inherits(x, "Fire")

# dependencies
is.dependency <- function(x) inherits(x, "dash_dependency")
is.output <- function(x) is.dependency(x) && inherits(x, "output")
is.input <- function(x) is.dependency(x) && inherits(x, "input")
is.state <- function(x) is.dependency(x) && inherits(x, "state")

# layout is really a special type of component
is.layout <- function(x) inherits(x, "dash_layout")

# components (TODO: this should be exported by dashRtranspile!)
is.component <- function(x) inherits(x, "dash_component")

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

# ----------------------------------------------------------------------------
# Mapping htmltools to dash components
# ----------------------------------------------------------------------------

# crawl a recursive list for shiny.tags and return their htmltools::htmlDependencies()
# note how the recursive structuring of this function is versy similar to as_component
html_dependencies <- function(x) {

  if (is.component(x)) {
    # a component's children could be holding tags
    if ("children" %in% x[["propNames"]]) {
      x[["props"]][["children"]] <- lapply(x[["props"]][["children"]], html_dependencies)
    }

    # pick up on dashRwidgets::htmlwidget() dependencies
    # note that name/package should be pre-populated and dashRwidgets imports htmlwidgets
    is_widget <- identical("dashRwidgets", x[["package"]]) && identical("htmlwidget", x[["type"]])
    if (is_widget) {
      name <- x[["props"]][["name"]]
      package <- x[["props"]][["package"]] %||% name
      deps <- utils::getFromNamespace("getDependency", "htmlwidgets")(name, package)
      return(c(deps, x[["props"]][["widget"]][["dependencies"]]))
    }

    return(NULL)
  }

  if (inherits(x, c("shiny.tag.list", "list"))) {
    return(lapply(x, html_dependencies))
  }

  if (inherits(x, "shiny.tag")) {

    if (length(x[["children"]])) {
      x[["children"]] <- lapply(x[["children"]], html_dependencies)
    }

    return(htmltools::htmlDependencies(x))
  }

  NULL
}

# try our best to map htmltools to dash components
as_component <- function(x) {

  if (is.component(x)) {
    # a component's children could be holding tags
    if ("children" %in% x[["propNames"]]) {
      x[["props"]][["children"]] <- lapply(x[["props"]][["children"]], as_component)
    }
    return(x)
  }

  if (inherits(x, c("shiny.tag.list", "list"))) {
    return(lapply(x, as_component))
  }

  if (inherits(x, "shiny.tag")) {

    if (length(x[["children"]])) {
      x[["children"]] <- lapply(x[["children"]], as_component)
    }

    # obtain the relevant dash-html-component function definiton
    # (e.g. tags$a() -> htmlA())
    components_html <- ls(asNamespace("dashHtmlComponents"))
    is_html <- tolower(sub("^html", "", components_html)) %in% x[["name"]]
    component <- components_html[is_html]
    htmlComponent <- tryCatch(
      getFromNamespace(component, "dashHtmlComponents"),
      error = function(e) {
        stop(sprintf("Couldn't find a mapping for '%s' tags", x[["name"]]), call. = FALSE)
      }
    )

    # translate tag attributes to props (i.e., build the function arguments)
    args <- x[["attribs"]] %||% list()

    # class attribute -> className prop
    args[["className"]] <- args[["class"]]
    args[["class"]] <- NULL

    # style attribute (string) -> style prop (list)
    if (length(args[["style"]])) {
      assertthat::assert_that(is.character(args[["style"]]))
      assertthat::assert_that(length(args[["style"]]) == 1)
      styles <- strsplit(strsplit(args[["style"]], ";")[[1]], ":")
      if (!unique(lengths(styles)) == 2) stop("Malformed style attribute")
      name <- str_trim(sapply(styles, `[[`, 1))
      value <- str_trim(sapply(styles, `[[`, 2))
      args[["style"]] <- setNames(as.list(value), name)
    }

    if (length(x[["children"]])) args[["children"]] <- x[["children"]]

    return(do.call(htmlComponent, args))
  }

  if (inherits(x, "html") && isTRUE(attr(x, "html"))) {
    try_library("dashDangerouslySetInnerHtml", "HTML")
    return(getFromNamespace("DangerouslySetInnerHTML", "dashDangerouslySetInnerHtml")(x))
  }

  # TODO: special handling for any other types of objects?

  x
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

register_dependencies <- function(dependencies, server) {

  # copy dependencies to temp dir and make their file path relative to it
  libdir <- tempdir()
  dependencies <- copy_dependencies(dependencies, libdir)

  # dash endpoints should already be registered at this point...
  # TODO: provide a more uniquely identifiable name https://github.com/thomasp85/routr/issues/6
  routrs <- server$plugins
  if (!"request_routr" %in% names(routrs)) stop("Something unexpected happened.")

  # register a route to dependencies on the server (if it doesn't already exist)
  dash_router <- routrs[["request_routr"]]
  if (!dash_router$has_route("dashR-resources")) {
    # resource routes are designed to serve directories (not individual files)
    # TODO: should this respect routes prefix?
    resources <- routr::ressource_route('/' = libdir)
    dash_router$add_route(resources, "dashR-resources")
    server$attach(dash_router, force = TRUE)
  }

  dependencies
}

copy_dependencies <- function(dependencies, libdir = tempdir()) {
  lapply(dependencies, function(dep) {
    assertthat::assert_that(inherits(dep, "html_dependency"))
    if (!length(dep[["src"]][["file"]])) return(dep)
    href <- dep[["src"]][["href"]]
    dep <- htmltools::copyDependencyToDir(dep, libdir)
    dep <- htmltools::makeDependencyRelative(dep, libdir)
    dep[["src"]] <- as.list(dep[["src"]])
    dep[["src"]][["href"]] <- href
    dep
  })
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
  dashHtmlComponents::htmlDiv(
    dashHtmlComponents::htmlH2("Welcome to dash!"),
    "If you see this message, you may not have yet specified a layout in your application."
  )
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
