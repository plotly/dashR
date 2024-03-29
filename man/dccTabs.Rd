% Auto-generated: do not edit by hand
\name{dccTabs}

\alias{dccTabs}

\title{Tabs component}

\description{
A Dash component that lets you render pages with tabs - the Tabs component's children can be dcc.Tab components, which can hold a label that will be displayed as a tab, and can in turn hold children components that will be that tab's content.
}

\usage{
dccTabs(children=NULL, id=NULL, value=NULL, className=NULL,
content_className=NULL, parent_className=NULL, style=NULL,
parent_style=NULL, content_style=NULL, vertical=NULL,
mobile_breakpoint=NULL, colors=NULL, loading_state=NULL,
persistence=NULL, persisted_props=NULL,
persistence_type=NULL)
}

\arguments{
\item{children}{List of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number. Array that holds Tab components}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{value}{Character. The value of the currently selected Tab}

\item{className}{Character. Appends a class to the Tabs container holding the individual Tab components.}

\item{content_className}{Character. Appends a class to the Tab content container holding the children of the Tab that is selected.}

\item{parent_className}{Character. Appends a class to the top-level parent container holding both the Tabs container and the content container.}

\item{style}{Named list. Appends (inline) styles to the Tabs container holding the individual Tab components.}

\item{parent_style}{Named list. Appends (inline) styles to the top-level parent container holding both the Tabs container and the content container.}

\item{content_style}{Named list. Appends (inline) styles to the tab content container holding the children of the Tab that is selected.}

\item{vertical}{Logical. Renders the tabs vertically (on the side)}

\item{mobile_breakpoint}{Numeric. Breakpoint at which tabs are rendered full width (can be 0 if you don't want full width tabs on mobile)}

\item{colors}{Lists containing elements 'border', 'primary', 'background'.
those elements have the following types:
  - border (character; optional)
  - primary (character; optional)
  - background (character; optional). Holds the colors used by the Tabs and Tab components. If you set these, you should specify colors for all properties, so:
colors: {
   border: '#d6d6d6',
   primary: '#1975FA',
   background: '#f9f9f9'
 }}

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

    app$layout(htmlDiv(list(
      dccTabs(id="tabs", value='tab-1', children=list(
        dccTab(label='Tab one', value='tab-1'),
        dccTab(label='Tab two', value='tab-2')
        )
      ),
      htmlDiv(id='tabs-content')
      )
      )
    )

    app$callback(output('tabs-content', 'children'),
        params = list(input('tabs', 'value')),
    function(tab){
      if(tab == 'tab-1'){
      return(htmlDiv(list(
        htmlH3('Tab content 1')
        )))}
      else if(tab == 'tab-2'){
      return(htmlDiv(list(
        htmlH3('Tab content 2')
        )))}
      }
    )

  app$run_server()
}
}
