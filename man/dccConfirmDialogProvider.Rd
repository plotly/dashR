% Auto-generated: do not edit by hand
\name{dccConfirmDialogProvider}

\alias{dccConfirmDialogProvider}

\title{ConfirmDialogProvider component}

\description{
A wrapper component that will display a confirmation dialog when its child component has been clicked on.  For example: ``` dcc.ConfirmDialogProvider(     html.Button('click me', id='btn'),     message='Danger - Are you sure you want to continue.'     id='confirm') ```
}

\usage{
dccConfirmDialogProvider(children=NULL, id=NULL, message=NULL, submit_n_clicks=NULL,
submit_n_clicks_timestamp=NULL, cancel_n_clicks=NULL,
cancel_n_clicks_timestamp=NULL, displayed=NULL,
loading_state=NULL)
}

\arguments{
\item{children}{Logical | numeric | character | named list | unnamed list. The children to hijack clicks from and display the popup.}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{message}{Character. Message to show in the popup.}

\item{submit_n_clicks}{Numeric. Number of times the submit was clicked}

\item{submit_n_clicks_timestamp}{Numeric. Last time the submit button was clicked.}

\item{cancel_n_clicks}{Numeric. Number of times the popup was canceled.}

\item{cancel_n_clicks_timestamp}{Numeric. Last time the cancel button was clicked.}

\item{displayed}{Logical. Is the modal currently displayed.}

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
      dccConfirmDialogProvider(
        children=htmlButton(
          'Click Me',
          n_clicks = 0
        ),
        id='danger-danger-provider',
        message='Danger danger! Are you sure you want to continue?',
        submit_n_clicks=NULL
      ),
      htmlDiv(id='output-provider',
              children='Click the button to submit')
    )))

    app$callback(
      output = list(id = 'output-provider', property = 'children'),
      params=list(input(id = 'danger-danger-provider', property = 'submit_n_clicks')),
      function(submit_n_clicks) {
        if (is.null(unlist(submit_n_clicks))) {
          return('')
        } else {
          paste0('That was a dangerous choice! Submitted ', submit_n_clicks, ' times.')
        }
        }

    )

  app$run_server()
}
}
