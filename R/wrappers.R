# IDEA: provide a suite of "wrapper" functions that make it easier to do common things like display graphics (a la renderPlot)

# PROBLEM: how do we execute the callback function *inside* wrapper functions?


#' Wrap results
#'
#'
#' @param func a callback function, that when called, produces a graph
#' @param width width in pixels
#' @param height height in pixels
#' @param cairo Use the Cairo package (if installed).
#' @param ... arguments passed along to the graphics device
#'
#' @export
#' @author Carson Sievert
wrap_png <- function(func = NULL, width = NULL, height = NULL, cairo = TRUE, ...) {

  device <- if (cairo && system.file(package = "Cairo") != "") {
    Cairo::Cairo
  } else if (capabilities("png")) {
    grDevices::png
  } else if (capabilities("jpeg")) {
    grDevices::jpeg
  } else {
    stop(
      "Your installation of R is not currently able to produce png or jpeg images. ",
      "You have a couple options for resolving this problem: \n",
      "  (1) install.packages('Cairo') \n",
      "  (2) compile R to use a bitmap device (png or jpeg)",
      call. = FALSE
    )
  }

  tmpfile <- tempfile(fileext = ".png")

  wrappify(
    func, function() {
      # TODO:
      # (1) access clientWidth/clientHeight?
      # (2) recordPlot(), replayPlot() on resize?
      width <- width %||% 640
      height <- height %||% 480
      device(filename = tmpfile, width = width, height = height, ...)
      func()
      on.exit(grDevices::dev.off(), add = TRUE)
      # TODO: base64enc::base64encode()?
      html_img(src = basename(tmpfile))
    }
  )
}

#' @inheritParams wrap_png
#' @export
wrap_svg <- function(func = NULL, width = NULL, height = NULL, ...) {

  if (system.file(package = "svglite") != "") {
    stop("This function requires the svglite package", call. = FALSE)
  }

  tmpfile <- tempfile(fileext = ".svg")

  wrappify(
    func, function() {
      # TODO:
      # (1) access clientWidth/clientHeight?
      # (2) recordPlot(), replayPlot() on resize?
      width <- width %||% 640
      height <- height %||% 480
      svglite::svglite(file = tmpfile, width = width, height = height, ...)
      func()
      on.exit(grDevices::dev.off(), add = TRUE)
      # TODO: base64enc::base64encode()?
      html_img(src = basename(tmpfile))
    }
  )

}



wrappify <- function(func = NULL, closure = function() { func() }) {

  assertthat::assert_that(is.function(func))
  assertthat::assert_that(is.function(closure))

  if (is.wrapper(func)) stop("Wrapping a wrapper is not (yet) supported", call. = FALSE)

  # TODO: more careful evaluation?
  args <- lapply(formals(func), eval)

  structure(
    list(
      func = func,
      closure = closure,
      inputs = args[vapply(args, is.input, logical(1))],
      states = args[vapply(args, is.state, logical(1))]
    ),
    class = "dasher_wrapper"
  )
}


is.wrapper <- function(x) inherits(x, "dasher_wrapper")
