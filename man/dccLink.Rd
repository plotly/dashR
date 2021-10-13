% Auto-generated: do not edit by hand
\name{dccLink}

\alias{dccLink}

\title{Link component}

\description{
Link allows you to create a clickable link within a multi-page app.  For links with destinations outside the current app, `html.A` is a better component to use.
}

\usage{
dccLink(children=NULL, id=NULL, href=NULL, refresh=NULL,
className=NULL, style=NULL, title=NULL, target=NULL,
loading_state=NULL)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. The children of this component}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{href}{Character. The URL of a linked resource.}

\item{refresh}{Logical. Controls whether or not the page will refresh when the link is clicked}

\item{className}{Character. Often used with CSS to style elements with common properties.}

\item{style}{Named list. Defines CSS styles which will override styles previously set.}

\item{title}{Character. Adds the title attribute to your link, which can contain supplementary
information.}

\item{target}{Character. Specifies where to open the link reference.}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
if (interactive()) {
    library(dash)

    app <- Dash$new()

    app$layout(htmlDiv(list(
              # represents the URL bar, doesn't render anything
              dccLocation(id = 'url', refresh=FALSE),
              dccLink('Navigate to "/"', href='/'),
              htmlBr(),
              dccLink('Navigate to "/page-2"', href='/page-2'),
              # content will be rendered in this element
              htmlDiv(id='page-content')
            )
        )
    )

    app$callback(output=list(id='page-content', property='children'),
                 params=list(
              input(id='url', property='pathname')),
              function(pathname) {
              paste0('You are on page ', pathname)
              }
    )

  app$run_server()
}
}
