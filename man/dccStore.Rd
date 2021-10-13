% Auto-generated: do not edit by hand
\name{dccStore}

\alias{dccStore}

\title{Store component}

\description{
Easily keep data on the client side with this component. The data is not inserted in the DOM. Data can be in memory, localStorage or sessionStorage. The data will be kept with the id as key.
}

\usage{
dccStore(id=NULL, storage_type=NULL, data=NULL, clear_data=NULL,
modified_timestamp=NULL)
}

\arguments{
\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{storage_type}{A value equal to: 'local', 'session', 'memory'. The type of the web storage.

memory: only kept in memory, reset on page refresh.
local: window.localStorage, data is kept after the browser quit.
session: window.sessionStorage, data is cleared once the browser quit.}

\item{data}{Named list | unnamed list | numeric | character | logical. The stored data for the id.}

\item{clear_data}{Logical. Set to true to remove the data contained in `data_key`.}

\item{modified_timestamp}{Numeric. The last time the storage was modified.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
if (interactive()) {
    library(dash)

    app <- Dash$new()

    app$layout(htmlDiv(list(
      # The memory store reverts to the default on every page refresh
      dccStore(id='memory'),
      # The local store will take the initial data
      # only the first time the page is loaded
      # and keep it until it is cleared.
      dccStore(id='local', storage_type='local'),
      # Same as the local store but will lose the data
      # when the browser/tab closes.
      dccStore(id='session', storage_type='session'),
      htmlTable(list(
        htmlThead(list(
          htmlTr(htmlTh('Click to store in:', colSpan='3')),
          htmlTr(list(
            htmlTh(htmlButton('memory', id='memory-button')),
            htmlTh(htmlButton('localStorage', id='local-button')),
            htmlTh(htmlButton('sessionStorage', id='session-button'))
          )),
          htmlTr(list(
            htmlTh('Memory clicks'),
            htmlTh('Local clicks'),
            htmlTh('Session clicks')
          ))
        )),
        htmlTbody(list(
          htmlTr(list(
            htmlTd(0, id='memory-clicks'),
            htmlTd(0, id='local-clicks'),
            htmlTd(0, id='session-clicks')
          ))
        ))
      ))
    )))

    for (i in c('memory', 'local', 'session')) {
      app$callback(
        output(id = i, property = 'data'),
        params = list(
          input(id = paste0(i, '-button'), property = 'n_clicks'),
          state(id = i, property = 'data')
        ),
        function(n_clicks, data){
          if(is.null(n_clicks)){
            return()
          }
          if(is.null(data[[1]])){
            data = list('clicks' = 0)
          } else{
            data = data
          }
          data['clicks'] = data$clicks + 1
          return(data)
        }
      )
    }

    for (i in c('memory', 'local', 'session')) {
      app$callback(
        output(id = paste0(i, '-clicks'), property = 'children'),
        params = list(
          input(id = i, property = 'modified_timestamp'),
          state(id = i, property = 'data')
        ),
        function(ts, data){
          if(is.null(ts)){
            return()
          }
          if(is.null(data[[1]])){
            data = list()
          } else {
            data = data
          }
          return(data$clicks[[1]])
        }
      )
    }

  app$run_server()
}
}
