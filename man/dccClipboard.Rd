% Auto-generated: do not edit by hand
\name{dccClipboard}

\alias{dccClipboard}

\title{Clipboard component}

\description{
The Clipboard component copies text to the clipboard
}

\usage{
dccClipboard(id=NULL, target_id=NULL, content=NULL, n_clicks=NULL,
title=NULL, style=NULL, className=NULL, loading_state=NULL)
}

\arguments{
\item{id}{Character. The ID used to identify this component.}

\item{target_id}{Character | named list. The id of target component containing text to copy to the clipboard.
The inner text of the `children` prop will be copied to the clipboard.  If none, then the text from the
 `value` prop will be copied.}

\item{content}{Character. The text to  be copied to the clipboard if the `target_id` is None.}

\item{n_clicks}{Numeric. The number of times copy button was clicked}

\item{title}{Character. The text shown as a tooltip when hovering over the copy icon.}

\item{style}{Named list. The icon's styles}

\item{className}{Character. The class  name of the icon element}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

