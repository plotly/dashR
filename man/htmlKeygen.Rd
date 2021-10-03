% Auto-generated: do not edit by hand
\name{htmlKeygen}

\alias{htmlKeygen}

\title{Keygen component}

\description{
Keygen is a wrapper for the <keygen> HTML5 element.  DEPRECATED: <keygen> is included for completeness, but should be avoided as it is not supported by all browsers and may be removed at any time from those that do support it.  For detailed attribute info see: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/keygen
}

\usage{
htmlKeygen(children=NULL, id=NULL, accessKey=NULL, autoFocus=NULL,
challenge=NULL, className=NULL, contentEditable=NULL,
contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL,
form=NULL, hidden=NULL, key=NULL, keyType=NULL, lang=NULL,
loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL,
name=NULL, role=NULL, spellCheck=NULL, style=NULL,
tabIndex=NULL, title=NULL, ...)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. The children of this component}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{accessKey}{Character. Keyboard shortcut to activate or add focus to the element.}

\item{autoFocus}{A value equal to: 'autofocus', 'autofocus', 'autofocus' | logical. The element should be automatically focused after the page loaded.}

\item{challenge}{Character. A challenge string that is submitted along with the public key.}

\item{className}{Character. Often used with CSS to style elements with common properties.}

\item{contentEditable}{Character. Indicates whether the element's content is editable.}

\item{contextMenu}{Character. Defines the ID of a <menu> element which will        serve as the element's context menu.}

\item{dir}{Character. Defines the text direction. Allowed values are ltr (Left-To-Right) or        rtl (Right-To-Left)}

\item{disabled}{A value equal to: 'disabled', 'disabled' | logical. Indicates whether the user can interact with the element.}

\item{draggable}{Character. Defines whether the element can be dragged.}

\item{form}{Character. Indicates the form that is the owner of the element.}

\item{hidden}{A value equal to: 'hidden', 'hidden' | logical. Prevents rendering of given element, while keeping child elements, e.g.        script elements, active.}

\item{key}{Character. A unique identifier for the component, used to improve
performance by React.js while rendering components
See https://reactjs.org/docs/lists-and-keys.html for more info}

\item{keyType}{Character. Specifies the type of key generated.}

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

\item{name}{Character. Name of the element. For example used by the server to identify the        fields in form submits.}

\item{role}{Character. The ARIA role attribute}

\item{spellCheck}{Character. Indicates whether spell checking is allowed for the element.}

\item{style}{Named list. Defines CSS styles which will override styles previously set.}

\item{tabIndex}{Character. Overrides the browser's default tab order and follows the one specified        instead.}

\item{title}{Character. Text to be displayed in a tooltip when hovering over the element.}


\item{...}{wildcards allowed have the form: `'aria-*', 'data-*'`}

}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
# This feature is obsolete. It may still work in some
# browsers, but could stop working at any time. Try to
# avoid using this component.
}
