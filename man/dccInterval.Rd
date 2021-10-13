% Auto-generated: do not edit by hand
\name{dccInterval}

\alias{dccInterval}

\title{Interval component}

\description{
A component that repeatedly increments a counter `n_intervals` with a fixed time delay between each increment. Interval is good for triggering a component on a recurring basis. The time delay is set with the property "interval" in milliseconds.
}

\usage{
dccInterval(id=NULL, interval=NULL, disabled=NULL, n_intervals=NULL,
max_intervals=NULL)
}

\arguments{
\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{interval}{Numeric. This component will increment the counter `n_intervals` every
`interval` milliseconds}

\item{disabled}{Logical. If True, the counter will no longer update}

\item{n_intervals}{Numeric. Number of times the interval has passed}

\item{max_intervals}{Numeric. Number of times the interval will be fired.
If -1, then the interval has no limit (the default)
and if 0 then the interval stops running.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
if (interactive()) {
    library(dash)
    library(plotly)

    app <- Dash$new()

    app$layout(
      htmlDiv(list(
        htmlH2('3 Second Updates'),
        dccInterval(id = '3s-interval',
                    interval= 3*1000,
                    n_intervals = 0),
        htmlDiv(list(
            dccGraph(id = 'live-graph')
          )
        )
        )
      )
    )

    app$callback(
      output = list(
        output('live-graph', 'figure')
      ),
      params = list(
        input('3s-interval', 'n_intervals')
      ),

      update_graph <- function(n_intervals) {
        df <- data.frame(
          'time' = c(1:8),
          'value' = sample(1:8, 8),
          'value-2' = sample(1:8, 8)
        )

        bar <- animation_opts(plot_ly(
          data = df, x=~time, y=~value, type = "bar"),
          1000, easing = "cubic-in-out"
        )

        return(list(bar))
      }
    )

   app$run_server()
}
}
