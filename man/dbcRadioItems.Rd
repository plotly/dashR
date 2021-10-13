% Auto-generated: do not edit by hand
\name{dbcRadioItems}

\alias{dbcRadioItems}

\title{RadioItems component}

\description{
RadioItems is a component that encapsulates several radio item inputs. The values and labels of the RadioItems is specified in the `options` property and the seleced item is specified with the `value` property. Each radio item is rendered as an input and associated label which are siblings of each other.
}

\usage{
dbcRadioItems(id=NULL, key=NULL, options=NULL, value=NULL, style=NULL,
class_name=NULL, className=NULL, input_style=NULL,
inputStyle=NULL, input_checked_style=NULL,
inputCheckedStyle=NULL, input_class_name=NULL,
inputClassName=NULL, input_checked_class_name=NULL,
inputCheckedClassName=NULL, label_style=NULL,
labelStyle=NULL, label_checked_style=NULL,
labelCheckedStyle=NULL, label_class_name=NULL,
labelClassName=NULL, label_checked_class_name=NULL,
labelCheckedClassName=NULL, inline=NULL, switch=NULL,
loading_state=NULL, persistence=NULL, persisted_props=NULL,
persistence_type=NULL, name=NULL)
}

\arguments{
\item{id}{Character. The ID of this component, used to identify dash components in callbacks.
The ID needs to be unique across all of the components in an app.}

\item{key}{Character. A unique identifier for the component, used to improve
performance by React.js while rendering components
See https://reactjs.org/docs/lists-and-keys.html for more info}

\item{options}{List of lists containing elements 'label', 'value', 'disabled', 'input_id', 'label_id'.
those elements have the following types:
  - label (character | numeric; required): the radio item's label
  - value (character | numeric; required): the value of the radio item. this value corresponds to the items
specified in the `value` property.
  - disabled (logical; optional): if true, this radio item is disabled and can't be clicked on.
  - input_id (character; optional): id for this option's input, can be used to attach tooltips or apply
css styles
  - label_id (character; optional): id for this option's label, can be used to attach tooltips or apply
css styless. An array of options}

\item{value}{Character | numeric. The currently selected value}

\item{style}{Named list. The style of the container (div)}

\item{class_name}{Character. The class of the container (div)}

\item{className}{Character. **DEPRECATED** Use `class_name` instead.

The class of the container (div)}

\item{input_style}{Named list. The style of the <input> radio element}

\item{inputStyle}{Named list. **DEPRECATED** Use `input_style` instead.

The style of the <input> radio element}

\item{input_checked_style}{Named list. Additional inline style arguments to apply to <input> elements on checked
items.}

\item{inputCheckedStyle}{Named list. **DEPRECATED** Use `input_checked_style` instead.

Additional inline style arguments to apply to <input> elements on checked
items.}

\item{input_class_name}{Character. The class of the <input> radio element}

\item{inputClassName}{Character. **DEPRECATED** Use `input_class_name` instead.

The class of the <input> radio element}

\item{input_checked_class_name}{Character. Additional CSS classes to apply to the <input> element when the
corresponding radio is checked.}

\item{inputCheckedClassName}{Character. **DEPRECATED** Use `input_checked_class_name` instead.

Additional CSS classes to apply to the <input> element when the
corresponding radio is checked.}

\item{label_style}{Named list. Inline style arguments to apply to the <label> element for each item.}

\item{labelStyle}{Named list. **DEPRECATED** Use `label_style` instead.

Inline style arguments to apply to the <label> element for each item.}

\item{label_checked_style}{Named list. Additional inline style arguments to apply to <label> elements on checked
items.}

\item{labelCheckedStyle}{Named list. **DEPRECATED** Use `label_checked_style` instead.

Additional inline style arguments to apply to <label> elements on checked
items.}

\item{label_class_name}{Character. CSS classes to apply to the <label> element for each item.}

\item{labelClassName}{Character. **DEPRECATED** Use `label_class_name` instead.

CSS classes to apply to the <label> element for each item.}

\item{label_checked_class_name}{Character. Additional CSS classes to apply to the <label> element when the
corresponding radio is checked.}

\item{labelCheckedClassName}{Character. **DEPRECATED** Use `label_checked_class_name` instead.

Additional CSS classes to apply to the <label> element when the
corresponding radio is checked.}

\item{inline}{Logical. Arrange RadioItems inline}

\item{switch}{Logical. Set to True to render toggle-like switches instead of radios.}

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

\item{name}{Character. The name of the control, which is submitted with the form data.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

