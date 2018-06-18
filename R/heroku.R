#' Create (and deploy) dashR app to Heroku
#'
#' This function tries to deploy a dashR app in the current directory to Heroku.
#'
#'
#' dashR app to Heroku. It can also deploy the template app
#' if your system is configured properly (see details).
#'
#' @details To deploy, you need the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
#' and successfully run `heroku login` ahead of time. You'll also need access to the `git`
#' system command.
#'
#' @param name a name for (a new) Heroku app.
#' @export
#' @author Carson Sievert
#' @references \url{https://github.com/plotly/dashR/tree/master/inst/heroku}

heroku_app_deploy <- function(name = NULL) {

  if (!file.exists("Aptfile")) stop("Aptfile required", call. = FALSE)
  if (!file.exists("init.R")) stop("init.R script required", call. = FALSE)
  if (!file.exists("run.R")) stop("run.R script required", call. = FALSE)

  if (Sys.which("git") == "") {
    stop(
      "The `git` system command is required for `heroku_app_deploy()`",
      "Please install and try again.",
      call. = FALSE
    )
  }
  if (Sys.which("heroku") == "") {
    stop(
      "The Heroku CLI is required for `heroku_app_deploy()`",
      "Please install and try again -- https://devcenter.heroku.com/articles/heroku-cli",
      call. = FALSE
    )
  }

  # make sure we're in a git repo before we can bootstrap the Heroku app
  system("git init")

  # create a new Heroku app with the buildpack
  # TODO: accomodate pre-existing apps?
  if (is.null(name)) stop("Must specify a name for the heroku app")
  system(
    sprintf("heroku create %s -b http://github.com/virtualstaticvoid/heroku-buildpack-r.git#heroku-16", name)
  )

  # inform Heroku about sensible env vars
  system(
    sprintf("heroku config:set GITHUB_PAT=%s", Sys.getenv("GITHUB_PAT")),
    ignore.stdout = TRUE
  )

  # commit and deploy
  system("git add *")
  system("git commit -m 'trigger a deploy'")
  system("git push heroku master")

  browserURL(sprintf("https://%s.herokuapp.com/", name))
}



#' Summon a template for deploying dashR to heroku
#'
#' This function copies files for Heroku deployment of a dashR app to the
#' current directory.
#' dashR app to Heroku via [the R buildpack](https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16).
#'
#' @param overwite whether or not to overwrite existing `Aptfile`/`init.R`/`run.R` files.
#' @export
#' @author Carson Sievert
heroku_app_template <- function(overwrite = FALSE) {
  source <- dir(system.file("heroku", package = "dashR"), full.names = TRUE)
  file.copy(source, basename(source), overwrite = overwrite)
}
