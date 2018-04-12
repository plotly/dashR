# IDEA: provide a suite of "wrapper" functions that make it easier to do common things like display graphics (a la renderPlot)


# Show output of a function
#
# @param func a function, that when called, produces the side-effect of drawing
# @param pre wrap the output in a [htmlPre] tag?
# @param ... arguments passed along to [htmlPre] (if `pre` is `TRUE`)
#
# @example inst/tutorial/examples/graph-callbacks-simple.R
wrap_print <- function(func = NULL, pre = TRUE, ...) {
  wrap(
    func, function() {
      res <- paste(utils::capture.output(func()), collapse = "\n")
      if (!pre) return(res)
      htmlPre(res, ...)
    }
  )
}

# Wrap results into a png image
#
# @param func a function, that when called, produces the side-effect of drawing
# @param width width in pixels
# @param height height in pixels
# @param cairo Use the Cairo package (if installed).
# @param ... arguments passed along to the graphics device
#
# @example inst/tutorial/examples/callback-png-slider.R
wrap_png <- function(func = NULL, width = NULL, height = NULL, cairo = TRUE, ...) {

  device <- if (cairo && system.file(package = "Cairo") != "") {
    Cairo::CairoPNG
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

  wrap(
    func, function() {
      # TODO:
      # (1) access clientWidth/clientHeight?
      # (2) recordPlot(), replayPlot() on resize?
      width <- width %||% 640
      height <- height %||% 480
      device(filename = tmpfile, width = width, height = height, ...)
      func()
      grDevices::dev.off()
      htmlImg(
        src = paste0("data:image/png;base64,", base64enc::base64encode(tmpfile)),
        width = width,
        height = height
      )
    }
  )
}

# @inheritParams wrap_png
wrap_svg <- function(func = NULL, width = NULL, height = NULL, ...) {

  if (system.file(package = "svglite") == "") {
    stop("This function requires the svglite package", call. = FALSE)
  }

  tmpfile <- tempfile(fileext = ".svg")

  wrap(
    func, function() {
      # TODO:
      # (1) access clientWidth/clientHeight?
      # (2) recordPlot(), replayPlot() on resize?
      width <- width %||% 640
      height <- height %||% 480
      svglite::svglite(file = tmpfile, width = width, height = height, ...)
      func()
      grDevices::dev.off()
      htmlEmbed(
        src = basename(tmpfile),
        width = width,
        height = height
      )
    }
  )

}


wrap <- function(func = NULL, closure = function() { func() }) {

  # argument type checking
  assertthat::assert_that(is.function(func))
  assertthat::assert_that(is.function(closure))
  if (is.wrapper(func)) stop("Can't wrap a wrapper", call. = FALSE)

  if (!length(grep("func()", body(closure), fixed = TRUE))) {
    warning("closure should call func", call. = FALSE)
  }

  # identify input/state arguments
  args <- lapply(formals(func), function(x) {
    # missing arguments produce an error when evaluated
    # TODO: should we only evaluate when `!identical(x, quote(expr = ))`?
    val <- tryNULL(eval(x))
    if (is.state(val) || is.input(val)) val else x
  })

  structure(
    list(
      func = func,
      closure = closure,
      inputs = args[vapply(args, is.input, logical(1))],
      state = args[vapply(args, is.state, logical(1))]
    ),
    class = "dashR_wrapper"
  )
}


is.wrapper <- function(x) inherits(x, "dashR_wrapper")
