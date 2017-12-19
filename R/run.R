#' Run a dasher example
#'
#' @param name the example's name.
#' @param block whether or not to block the R console.
#' @param showcase whether or not to prompt your web browser.
#' @param ... other arguments passed onto the app's `run_server` method
#' @export
#' @md
#' @examples
#'
#' excel <- runTutorial("excel.R")
#' excel$server$stop()
#'

runTutorial <- function(name, block = FALSE, showcase = interactive(), ...) {
  # for now, just allow one to run tutorial examples
  exdir <- system.file("tutorial", "examples", package = "dasher")
  exfiles <- list.files(exdir)
  if (!isTRUE(name %in% exfiles)) {
    stop(
      "Couldn't find a file named '", name, "'. \n\n",
      "Valid options include: '%s'", paste(exfiles, collapse = "', '"),
      call. = FALSE
    )
  }
  res <- source(file.path(exdir, name), local = TRUE, chdir = TRUE)
  if (!inherits(res$value, "Dash")) {
    stop("File '", name, "' did not return a dasher app", call. = FALSE)
  }
  on.exit({
    res$value$run_server(block = block, showcase = showcase, ...)
  })
  res$value
}
