#' Run a dashR example
#'
#' @param name the example's name.
#' @param block whether or not to block the R console.
#' @param showcase whether or not to prompt your web browser.
#' @param ... other arguments passed onto the app's `run_server` method
#' @export
#' @md
#' @return Returns the Dash app so that you can stop the server after viewing
#' the application.
#' @examples
#' excel <- runTutorial("excel.R")
#' excel$server$stop()
#'

runTutorial <- function(name, block = FALSE, showcase = interactive(), ...) {
  # for now, just allow one to run tutorial examples
  exdir <- system.file("tutorial", "examples", package = "dashR")
  exfiles <- list.files(exdir, recursive = TRUE)

  # throw an information warning if example isn't found.
  if (!isTRUE(name %in% exfiles)) {
    # apparently there is a pretty strict length limit to stop/warning
    warn_length <- getOption("warning.length")
    options(warning.length = 2000)
    on.exit(options(warning.length = warn_length), add = TRUE)
    warning(
      "Couldn't find a file named '", name, "'. \n\n",
      sprintf("Valid options include:\n '%s'", paste(exfiles, collapse = "'\n '")),
      call. = FALSE
    )
    return()
  }

  # now try to run the example (assuming it returns a Dasher app, which it should!)
  res <- source(file.path(exdir, name), local = TRUE, chdir = TRUE)
  if (!inherits(res$value, "Dash")) {
    stop("File '", name, "' did not return a dashR app", call. = FALSE)
  }
  on.exit({
    res$value$run_server(block = block, showcase = showcase, ...)
  })
  res$value
}
