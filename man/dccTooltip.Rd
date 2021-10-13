% Auto-generated: do not edit by hand
\name{dccTooltip}

\alias{dccTooltip}

\title{Tooltip component}

\description{
A tooltip with an absolute position.
}

\usage{
dccTooltip(children=NULL, id=NULL, className=NULL, style=NULL,
bbox=NULL, show=NULL, direction=NULL, border_color=NULL,
background_color=NULL, loading_text=NULL, zindex=NULL,
targetable=NULL, loading_state=NULL)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. The contents of the tooltip}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{className}{Character. The class of the tooltip}

\item{style}{Named list. The style of the tooltip}

\item{bbox}{Lists containing elements 'x0', 'y0', 'x1', 'y1'.
those elements have the following types:
  - x0 (numeric; optional)
  - y0 (numeric; optional)
  - x1 (numeric; optional)
  - y1 (numeric; optional). The bounding box coordinates of the item to label, in px relative to
the positioning parent of the Tooltip component.}

\item{show}{Logical. Whether to show the tooltip}

\item{direction}{A value equal to: 'top', 'right', 'bottom', 'left'. The side of the `bbox` on which the tooltip should open.}

\item{border_color}{Character. Color of the tooltip border, as a CSS color string.}

\item{background_color}{Character. Color of the tooltip background, as a CSS color string.}

\item{loading_text}{Character. The text displayed in the tooltip while loading}

\item{zindex}{Numeric. The `z-index` CSS property to assign to the tooltip. Components with
higher values will be displayed on top of components with lower values.}

\item{targetable}{Logical. Whether the tooltip itself can be targeted by pointer events.
For tooltips triggered by hover events, typically this should be left
`false` to avoid the tooltip interfering with those same events.}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

