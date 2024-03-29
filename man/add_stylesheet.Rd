% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrappers.R
\name{add_stylesheet}
\alias{add_stylesheet}
\title{Add external (CSS) stylesheets to a Dash app}
\usage{
add_stylesheet(app, stylesheet)
}
\arguments{
\item{app}{A dash application created with \code{\link[=dash_app]{dash_app()}}.}

\item{stylesheet}{A single stylesheet or a list of stylesheets. Each
stylesheet is either a string (the URL), or a named list with \code{href} (the
URL) and any other valid \verb{<link>} tag attributes. See examples below.
Note that this is only used to add \strong{external} stylesheets, not local.}
}
\description{
Add external (CSS) stylesheets to a Dash app
}
\examples{
app <- dash_app()

# Add a single stylesheet with URL
app \%>\% add_stylesheet("https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css")

# Add multiple stylesheets with URL
app \%>\% add_stylesheet(list(
  "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css",
  "https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
))

# Add a single stylesheet with a list
app \%>\% add_stylesheet(
  list(
    href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css",
    integrity = "sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
  )
)

# Add multiple stylesheets with both URL and list
app \%>\% add_stylesheet(
  list(
    "https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css",
    "https://fonts.googleapis.com/css?family=Lora",
    list(
      href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css",
      integrity = "sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
    )
  )
)
}
