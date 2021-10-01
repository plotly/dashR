% Auto-generated: do not edit by hand
\name{htmlImg}

\alias{htmlImg}

\title{Img component}

\description{
Img is a wrapper for the <img> HTML5 element. For detailed attribute info see: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img
}

\usage{
htmlImg(children=NULL, id=NULL, accessKey=NULL, alt=NULL,
className=NULL, contentEditable=NULL, contextMenu=NULL,
crossOrigin=NULL, dir=NULL, draggable=NULL, height=NULL,
hidden=NULL, key=NULL, lang=NULL, loading_state=NULL,
n_clicks=NULL, n_clicks_timestamp=NULL, referrerPolicy=NULL,
role=NULL, sizes=NULL, spellCheck=NULL, src=NULL,
srcSet=NULL, style=NULL, tabIndex=NULL, title=NULL,
useMap=NULL, width=NULL, ...)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. The children of this component}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{accessKey}{Character. Keyboard shortcut to activate or add focus to the element.}

\item{alt}{Character. Alternative text in case an image can't be displayed.}

\item{className}{Character. Often used with CSS to style elements with common properties.}

\item{contentEditable}{Character. Indicates whether the element's content is editable.}

\item{contextMenu}{Character. Defines the ID of a <menu> element which will        serve as the element's context menu.}

\item{crossOrigin}{Character. How the element handles cross-origin requests}

\item{dir}{Character. Defines the text direction. Allowed values are ltr (Left-To-Right) or        rtl (Right-To-Left)}

\item{draggable}{Character. Defines whether the element can be dragged.}

\item{height}{Character | numeric. Specifies the height of elements listed here. For all other elements,          use the CSS height property.                                      Note: In some instances, such as            <div>, this is a legacy attribute, in            which case the CSS height property should            be used instead.}

\item{hidden}{A value equal to: 'hidden', 'hidden' | logical. Prevents rendering of given element, while keeping child elements, e.g.        script elements, active.}

\item{key}{Character. A unique identifier for the component, used to improve
performance by React.js while rendering components
See https://reactjs.org/docs/lists-and-keys.html for more info}

\item{lang}{Character. Defines the language used in the element.}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}

\item{n_clicks}{Numeric. An integer that represents the number of times
that this element has been clicked on.}

\item{n_clicks_timestamp}{Numeric. An integer that represents the time (in ms since 1970)
at which n_clicks changed. This can be used to tell
which button was changed most recently.}

\item{referrerPolicy}{Character. Specifies which referrer is sent when fetching the resource.}

\item{role}{Character. The ARIA role attribute}

\item{sizes}{Character. }

\item{spellCheck}{Character. Indicates whether spell checking is allowed for the element.}

\item{src}{Character. The URL of the embeddable content.}

\item{srcSet}{Character. One or more responsive image candidates.}

\item{style}{Named list. Defines CSS styles which will override styles previously set.}

\item{tabIndex}{Character. Overrides the browser's default tab order and follows the one specified        instead.}

\item{title}{Character. Text to be displayed in a tooltip when hovering over the element.}

\item{useMap}{Character. }

\item{width}{Character | numeric. For the elements listed here, this establishes the element's width.                              Note: For all other instances, such as            <div>, this is a legacy attribute, in            which case the CSS width property should be            used instead.}


\item{...}{wildcards allowed have the form: `'aria-*', 'data-*'`}

}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
if (interactive()) {
  library(dash)

  app <- Dash$new()

  app$layout(htmlDiv(list(
      htmlImg(src ='https://brand.plotly.com/static/images/plotly-logo-01-stripe@2x.png',
              height='200', width='400')
      )
    )
  )


  app$run_server()
}
}
