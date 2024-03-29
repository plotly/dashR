% Auto-generated: do not edit by hand
\name{dccSlider}

\alias{dccSlider}

\title{Slider component}

\description{
A slider component with a single handle.
}

\usage{
dccSlider(id=NULL, min=NULL, max=NULL, step=NULL, marks=NULL,
value=NULL, drag_value=NULL, className=NULL, disabled=NULL,
dots=NULL, included=NULL, tooltip=NULL, vertical=NULL,
verticalHeight=NULL, updatemode=NULL, loading_state=NULL,
persistence=NULL, persisted_props=NULL,
persistence_type=NULL)
}

\arguments{
\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{min}{Numeric. Minimum allowed value of the slider}

\item{max}{Numeric. Maximum allowed value of the slider}

\item{step}{Numeric. Value by which increments or decrements are made}

\item{marks}{List with named elements and values of type character | lists containing elements 'label', 'style'.
those elements have the following types:
  - label (character; optional)
  - style (named list; optional). Marks on the slider.
The key determines the position (a number),
and the value determines what will show.
If you want to set the style of a specific mark point,
the value should be an object which
contains style and label properties.}

\item{value}{Numeric. The value of the input}

\item{drag_value}{Numeric. The value of the input during a drag}

\item{className}{Character. Additional CSS class for the root DOM node}

\item{disabled}{Logical. If true, the handles can't be moved.}

\item{dots}{Logical. When the step value is greater than 1,
you can set the dots to true if you want to
render the slider with dots.}

\item{included}{Logical. If the value is true, it means a continuous
value is included. Otherwise, it is an independent value.}

\item{tooltip}{Lists containing elements 'always_visible', 'placement'.
those elements have the following types:
  - always_visible (logical; optional): determines whether tooltips should always be visible
(as opposed to the default, visible on hover)
  - placement (a value equal to: 'left', 'right', 'top', 'bottom', 'topleft', 'topright', 'bottomleft', 'bottomright'; optional): determines the placement of tooltips
see https://github.com/react-component/tooltip#api
top/bottom{*} sets the _origin_ of the tooltip, so e.g. `topleft`
will in reality appear to be on the top right of the handle. Configuration for tooltips describing the current slider value}

\item{vertical}{Logical. If true, the slider will be vertical}

\item{verticalHeight}{Numeric. The height, in px, of the slider if it is vertical.}

\item{updatemode}{A value equal to: 'mouseup', 'drag'. Determines when the component should update its `value`
property. If `mouseup` (the default) then the slider
will only trigger its value when the user has finished
dragging the slider. If `drag`, then the slider will
update its value continuously as it is being dragged.
If you want different actions during and after drag,
leave `updatemode` as `mouseup` and use `drag_value`
for the continuously updating value.}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}

\item{persistence}{Logical | character | numeric. Used to allow user interactions in this component to be persisted when
the component - or the page - is refreshed. If `persisted` is truthy and
hasn't changed from its previous value, a `value` that the user has
changed while using the app will keep that change, as long as
the new `value` also matches what was given originally.
Used in conjunction with `persistence_type`.}

\item{persisted_props}{List of a value equal to: 'value's. Properties whose user interactions will persist after refreshing the
component or the page. Since only `value` is allowed this prop can
normally be ignored.}

\item{persistence_type}{A value equal to: 'local', 'session', 'memory'. Where persisted user changes will be stored:
memory: only kept in memory, reset on page refresh.
local: window.localStorage, data is kept after the browser quit.
session: window.sessionStorage, data is cleared once the browser quit.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
if (interactive()) {
    library(dash)

    app <- Dash$new()

    app$layout(
      htmlDiv(
        list(
          dccSlider(
            id = "slider-input",
            min = -5,
            max = 10,
            step = 0.5,
            value = -3
          ),
          htmlDiv(
            id = "slider-output",
            children = "Make a selection on the slider to see the value appear here."
          )
        )
      )
    )

    app$callback(
      output("slider-output", "children"),
      list(input("slider-input", "value")),
      function(value) {
        return(paste0("You have chosen ", value, " on the slider above."))
      }
    )

   app$run_server()
}
}
