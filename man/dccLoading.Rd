% Auto-generated: do not edit by hand
\name{dccLoading}

\alias{dccLoading}

\title{Loading component}

\description{
A Loading component that wraps any other component and displays a spinner until the wrapped component has rendered.
}

\usage{
dccLoading(children=NULL, id=NULL, type=NULL, fullscreen=NULL,
debug=NULL, className=NULL, parent_className=NULL,
style=NULL, parent_style=NULL, color=NULL,
loading_state=NULL)
}

\arguments{
\item{children}{List of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number. Array that holds components to render}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{type}{A value equal to: 'graph', 'cube', 'circle', 'dot', 'default'. Property that determines which spinner to show
one of 'graph', 'cube', 'circle', 'dot', or 'default'.}

\item{fullscreen}{Logical. Boolean that makes the spinner display full-screen}

\item{debug}{Logical. If true, the spinner will display the component_name and prop_name
while loading}

\item{className}{Character. Additional CSS class for the spinner root DOM node}

\item{parent_className}{Character. Additional CSS class for the outermost dcc.Loading parent div DOM node}

\item{style}{Named list. Additional CSS styling for the spinner root DOM node}

\item{parent_style}{Named list. Additional CSS styling for the outermost dcc.Loading parent div DOM node}

\item{color}{Character. Primary colour used for the loading spinners}

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

    app$layout(htmlDiv(
      children=list(
        htmlH3("Edit text input to see loading state"),
        dccInput(id="input-1", value='Input triggers local spinner'),
        dccLoading(id="loading-1", children=list(htmlDiv(id="loading-output-1")), type="default"),
        htmlDiv(
          list(
            dccInput(id="input-2", value='Input triggers nested spinner'),
            dccLoading(
              id="loading-2",
              children=list(htmlDiv(list(htmlDiv(id="loading-output-2")))),
              type="circle"
            )
          )
        )
      )
    ))

    app$callback(
      output = list(id='loading-output-1', property = 'children'),
      params = list(input(id = 'input-1', property = 'value')),
      function(value){
        Sys.sleep(1)
        return(value)
      }
    )

    app$callback(
      output = list(id='loading-output-2', property = 'children'),
      params = list(input(id = 'input-2', property = 'value')),
      function(value){
        Sys.sleep(1)
        return(value)
      }
    )

  app$run_server()
}
}
