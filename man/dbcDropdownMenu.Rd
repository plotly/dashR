% Auto-generated: do not edit by hand
\name{dbcDropdownMenu}

\alias{dbcDropdownMenu}

\title{DropdownMenu component}

\description{
DropdownMenu creates an overlay useful for grouping together links and other content to organise navigation or other interactive elements.
}

\usage{
dbcDropdownMenu(children=NULL, id=NULL, style=NULL, class_name=NULL,
className=NULL, key=NULL, label=NULL, direction=NULL,
align_end=NULL, right=NULL, in_navbar=NULL, addon_type=NULL,
disabled=NULL, nav=NULL, caret=NULL, color=NULL,
menu_variant=NULL, toggle_style=NULL,
toggle_class_name=NULL, toggleClassName=NULL, size=NULL,
loading_state=NULL, group=NULL)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. The children of this component.}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{style}{Named list. Defines CSS styles which will override styles previously set.}

\item{class_name}{Character. Often used with CSS to style elements with common properties.}

\item{className}{Character. **DEPRECATED** Use `class_name` instead.

Often used with CSS to style elements with common properties.}

\item{key}{Character. A unique identifier for the component, used to improve
performance by React.js while rendering components
See https://reactjs.org/docs/lists-and-keys.html for more info}

\item{label}{Character. Label for the DropdownMenu toggle.}

\item{direction}{A value equal to: 'down', 'start', 'end', 'up', 'left', 'right', 'end'. Direction in which to expand the DropdownMenu. Default: 'down'. `left`
and `right` have been deprecated, and `start` and `end` should be used
instead.}

\item{align_end}{Logical. Align the DropdownMenu along the right side of its parent. Default: False.}

\item{right}{Logical. **DEPRECATED** Use `align_end` instead.

Align the DropdownMenu along the right side of its parent. Default: False.}

\item{in_navbar}{Logical. Set this to True if the DropdownMenu is inside a navbar. Default: False.}

\item{addon_type}{Logical | a value equal to: 'prepend', 'append'. Set this to 'prepend' or 'append' if the DropdownMenu is being used in an input group.}

\item{disabled}{Logical. Disable the dropdown.}

\item{nav}{Logical. Set this to True if the DropdownMenu is inside a nav for styling consistent
with other nav items. Default: False.}

\item{caret}{Logical. Add a caret to the DropdownMenu toggle. Default: True.}

\item{color}{Character. Set the color of the DropdownMenu toggle. Available options are: 'primary',
'secondary', 'success', 'warning', 'danger', 'info', 'link' or any valid CSS
color of your choice (e.g. a hex code, a decimal code or a CSS color name)
Default: 'secondary'}

\item{menu_variant}{A value equal to: 'light', 'dark'. Set `menu_variant="dark"` to create a dark-mode drop down instead}

\item{toggle_style}{Named list. Defines CSS styles which will override styles previously set. The styles
set here apply to the DropdownMenu toggle.}

\item{toggle_class_name}{Character. Often used with CSS to style elements with common properties. The classes
specified with this prop will be applied to the DropdownMenu toggle.}

\item{toggleClassName}{Character. **DEPRECATED** Use `toggle_class_name` instead.

Often used with CSS to style elements with common properties. The classes
specified with this prop will be applied to the DropdownMenu toggle.}

\item{size}{A value equal to: 'sm', 'md', 'lg'. Size of the DropdownMenu. 'sm' corresponds to small, 'md' to medium
and 'lg' to large.}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}

\item{group}{Logical. Set group to True if the DropdownMenu is inside a ButtonGroup.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

