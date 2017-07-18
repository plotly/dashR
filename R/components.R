#' checklist component 
#' Checklist is a component that encapsulates several checkboxes. The values and labels of the checklist is specified in the `options` property and the checked items are specified with the `values` property. Each checkbox is rendered as an input with a surrounding label. 
#' 
#' @export
#' @param id   
#' @param inputStyle The style of the <input> checkbox element  
#' @param inputClassName The class of the <input> checkbox element  
#' @param labelStyle The style of the <label> that wraps the checkbox input  and the option's label  
#' @param labelClassName The class of the <label> that wraps the checkbox input  and the option's label  
#' @param options An array of options  
#' @param values The currently selected value  
#' @param fireEvent Dash-assigned callback that gets fired when the checkbox item gets selected.  
#' @param setProps Dash-assigned callback that gets fired when the value changes.  
#' @param dashEvents  
checklist <- function(id = NULL, inputStyle = NULL, inputClassName = NULL, labelStyle = NULL, labelClassName = NULL, options = NULL, values = NULL, fireEvent = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, inputStyle=inputStyle, inputClassName=inputClassName, labelStyle=labelStyle, labelClassName=labelClassName, options=options, values=values, fireEvent=fireEvent, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'checklist')
   )
}
#' dropdown component 
#' Dropdown is an interactive dropdown element for selecting one or more items. The values and labels of the dropdown items are specified in the `options` property and the selected item(s) are specified with the `value` property.  Use a dropdown when you have many options (more than 5) or when you are constrained for space. Otherwise, you can use RadioItems or a Checklist, which have the benefit of showing the users all of the items at once. 
#' 
#' @export
#' @param id   
#' @param className   
#' @param disabled If true, the option is disabled  
#' @param multi If true, the user can select multiple values  
#' @param options   
#' @param placeholder The grey, default text shown when no option is selected  
#' @param value The value of the input. If `multi` is false (the default) then value is just a string that corresponds to the values provided in the `options` property. If `multi` is true, then multiple values can be selected at once, and `value` is an array of items with values corresponding to those in the `options` prop.  
#' @param setProps Dash-assigned callback that gets fired when the input changes  
#' @param dashEvents  
dropdown <- function(id = NULL, className = NULL, disabled = NULL, multi = NULL, options = NULL, placeholder = NULL, value = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, className=className, disabled=disabled, multi=multi, options=options, placeholder=placeholder, value=value, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'dropdown')
   )
}
#' graph component 
#'  
#' 
#' @export
#' @param id  (required) 
#' @param clickData Data from latest click event  
#' @param hoverData Data from latest hover event  
#' @param clear_on_unhover If True, `clear_on_unhover` will clear the `hoverData` property when the user "unhovers" from a point. If False, then the `hoverData` property will be equal to the data from the last point that was hovered over.  
#' @param selectedData Data from latest select event  
#' @param relayoutData Data from latest relayout event which occurs when the user zooms or pans on the plot  
#' @param figure Plotly `figure` object. See schema: https://plot.ly/javascript/reference  
#' @param style Generic style overrides on the plot div  
#' @param animate Beta: If true, animate between updates using plotly.js's `animate` function  
#' @param animation_options Beta: Object containing animation settings. Only applies if `animate` is `true`  
#' @param dashEvents   
#' @param setProps Function that updates the state tree.  
#' @param dashFireEvent Function that fires events 
graph <- function(id = NULL, clickData = NULL, hoverData = NULL, clear_on_unhover = NULL, selectedData = NULL, relayoutData = NULL, figure = NULL, style = NULL, animate = NULL, animation_options = NULL, dashEvents = NULL, setProps = NULL, dashFireEvent = NULL) {
   structure(
     list(id=id, clickData=clickData, hoverData=hoverData, clear_on_unhover=clear_on_unhover, selectedData=selectedData, relayoutData=relayoutData, figure=figure, style=style, animate=animate, animation_options=animation_options, dashEvents=dashEvents, setProps=setProps, dashFireEvent=dashFireEvent),
     class = c('component', 'core', 'graph')
   )
}
#' input component 
#' A basic HTML input control for entering text, numbers, or passwords.  Note that checkbox and radio types are supported through the Checklist and RadioItems component. Dates, times, and file uploads are also supported through separate components. 
#' 
#' @export
#' @param id   
#' @param value The value of the input  
#' @param placeholder A hint to the user of what can be entered in the control. Note: Do not use the placeholder attribute instead of a Label element, their purposes are different. The Label attribute describes the role of the form element (i.e. it indicates what kind of information is expected), and the placeholder attribute is a hint about the format that the value should take. There are cases in which the placeholder attribute is never displayed to the user, so the form must be understandable without it.  
#' @param style The input's inline styles  
#' @param className The class of the input element  
#' @param type The type of control to render.  
#' @param disabled If disabled, then the input can not be edited  
#' @param fireEvent Dash-assigned callback that gets fired when the input changes.  
#' @param setProps Dash-assigned callback that gets fired when the value changes.  
#' @param dashEvents  
input <- function(id = NULL, value = NULL, placeholder = NULL, style = NULL, className = NULL, type = NULL, disabled = NULL, fireEvent = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, value=value, placeholder=placeholder, style=style, className=className, type=type, disabled=disabled, fireEvent=fireEvent, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'input')
   )
}
#' interval component 
#' A component that repeatedly fires an event ("interval") with a fixed time delay between each event. Interval is good for triggering a component on a recurring basis. The time delay is set with the property "interval" in milliseconds. 
#' 
#' @export
#' @param id   
#' @param interval This component will fire an event every `interval` milliseconds with the event name `setInterval`  
#' @param fireEvent Dash assigned callback  
#' @param setProps Dash assigned callback  
#' @param dashEvents  
interval <- function(id = NULL, interval = NULL, fireEvent = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, interval=interval, fireEvent=fireEvent, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'interval')
   )
}
#' markdown component 
#' A component that renders Markdown text as specified by the CommonMark spec. 
#' 
#' @export
#' @param id   
#' @param className Class name of the container element  
#' @param containerProps An object containing custom element props to put on the container element such as id or style  
#' @param children A markdown string that adhreres to the CommonMark spec 
markdown <- function(id = NULL, className = NULL, containerProps = NULL, children = NULL) {
   structure(
     list(id=id, className=className, containerProps=containerProps, children=children),
     class = c('component', 'core', 'markdown')
   )
}
#' radioitems component 
#' RadioItems is a component that encapsulates several radio item inputs. The values and labels of the RadioItems is specified in the `options` property and the seleced item is specified with the `value` property. Each radio item is rendered as an input with a surrounding label. 
#' 
#' @export
#' @param id   
#' @param inputStyle The style of the <input> radio element  
#' @param inputClassName The class of the <input> radio element  
#' @param labelStyle The style of the <label> that wraps the radio input  and the option's label  
#' @param labelClassName The class of the <label> that wraps the radio input  and the option's label  
#' @param options An array of options  
#' @param value The currently selected value  
#' @param fireEvent Dash-assigned callback that gets fired when the radio item gets selected.  
#' @param setProps Dash-assigned callback that gets fired when the value changes.  
#' @param dashEvents  
radioitems <- function(id = NULL, inputStyle = NULL, inputClassName = NULL, labelStyle = NULL, labelClassName = NULL, options = NULL, value = NULL, fireEvent = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, inputStyle=inputStyle, inputClassName=inputClassName, labelStyle=labelStyle, labelClassName=labelClassName, options=options, value=value, fireEvent=fireEvent, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'radioitems')
   )
}
#' rangeslider component 
#' A double slider with two handles. Used for specifying a range of numerical values. 
#' 
#' @export
#' @param id   
#' @param allowCross allowCross could be set as true to allow those handles to cross.  
#' @param className Additional CSS class for the root DOM node  
#' @param count Determine how many ranges to render, and multiple handles will be rendered (number + 1).  
#' @param disabled If true, the handles can't be moved.  
#' @param dots When the step value is greater than 1, you can set the dots to true if you want to render the slider with dots.  
#' @param included If the value is true, it means a continuous value is included. Otherwise, it is an independent value.  
#' @param marks Marks on the slider. The key determines the position, and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties.  
#' @param min Minimum allowed value of the slider  
#' @param max Maximum allowed value of the slider  
#' @param pushable pushable could be set as true to allow pushing of surrounding handles when moving an handle. When set to a number, the number will be the minimum ensured distance between handles.  
#' @param step Value by which increments or decrements are made  
#' @param labels Key-values pairs describing the labels  
#' @param value The value of the input  
#' @param vertical If true, the slider will be vertical  
#' @param fireEvent Dash-assigned callback that gets fired when the checkbox item gets selected.  
#' @param setProps Dash-assigned callback that gets fired when the value changes.  
#' @param dashEvents  
rangeslider <- function(id = NULL, allowCross = NULL, className = NULL, count = NULL, disabled = NULL, dots = NULL, included = NULL, marks = NULL, min = NULL, max = NULL, pushable = NULL, step = NULL, labels = NULL, value = NULL, vertical = NULL, fireEvent = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, allowCross=allowCross, className=className, count=count, disabled=disabled, dots=dots, included=included, marks=marks, min=min, max=max, pushable=pushable, step=step, labels=labels, value=value, vertical=vertical, fireEvent=fireEvent, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'rangeslider')
   )
}
#' slider component 
#' A numerical slider with a single handle. 
#' 
#' @export
#' @param id   
#' @param className Additional CSS class for the root DOM node  
#' @param disabled If true, the handles can't be moved.  
#' @param dots When the step value is greater than 1, you can set the dots to true if you want to render the slider with dots.  
#' @param included If the value is true, it means a continuous value is included. Otherwise, it is an independent value.  
#' @param marks Marks on the slider. The key determines the position, and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties.  
#' @param min Minimum allowed value of the slider  
#' @param max Maximum allowed value of the slider  
#' @param step Value by which increments or decrements are made  
#' @param labels Key-values pairs describing the labels  
#' @param value The value of the input  
#' @param vertical If true, the slider will be vertical  
#' @param fireEvent Dash-assigned callback that gets fired when the checkbox item gets selected.  
#' @param setProps Dash-assigned callback that gets fired when the value changes.  
#' @param dashEvents  
slider <- function(id = NULL, className = NULL, disabled = NULL, dots = NULL, included = NULL, marks = NULL, min = NULL, max = NULL, step = NULL, labels = NULL, value = NULL, vertical = NULL, fireEvent = NULL, setProps = NULL, dashEvents = NULL) {
   structure(
     list(id=id, className=className, disabled=disabled, dots=dots, included=included, marks=marks, min=min, max=max, step=step, labels=labels, value=value, vertical=vertical, fireEvent=fireEvent, setProps=setProps, dashEvents=dashEvents),
     class = c('component', 'core', 'slider')
   )
}
#' syntaxhighlighter component 
#' A component for pretty printing code. 
#' 
#' @export
#' @param id   
#' @param children The text to display and highlight  
#' @param language the language to highlight code in.  
#' @param theme theme: light or dark  
#' @param customStyle prop that will be combined with the top level style on the pre tag, styles here will overwrite earlier styles.  
#' @param codeTagProps props that will be spread into the <code> tag that is the direct parent of the highlighted code elements. Useful for styling/assigning classNames.  
#' @param useInlineStyles if this prop is passed in as false, react syntax highlighter will not add style objects to elements, and will instead append classNames. You can then style the code block by using one of the CSS files provided by highlight.js.  
#' @param showLineNumbers if this is enabled line numbers will be shown next to the code block.  
#' @param startingLineNumber if showLineNumbers is enabled the line numbering will start from here.  
#' @param lineNumberContainerStyle the line numbers container default to appearing to the left with 10px of right padding. You can use this to override those styles.  
#' @param lineNumberStyle inline style to be passed to the span wrapping each number. Can be either an object or a function that recieves current line number as argument and returns style object.  
#' @param wrapLines a boolean value that determines whether or not each line of code should be wrapped in a parent element. defaults to false, when false one can not take action on an element on the line level. You can see an example of what this enables here  
#' @param lineStyle inline style to be passed to the span wrapping each line if wrapLines is true. Can be either an object or a function that recieves current line number as argument and returns style object. 
syntaxhighlighter <- function(id = NULL, children = NULL, language = NULL, theme = NULL, customStyle = NULL, codeTagProps = NULL, useInlineStyles = NULL, showLineNumbers = NULL, startingLineNumber = NULL, lineNumberContainerStyle = NULL, lineNumberStyle = NULL, wrapLines = NULL, lineStyle = NULL) {
   structure(
     list(id=id, children=children, language=language, theme=theme, customStyle=customStyle, codeTagProps=codeTagProps, useInlineStyles=useInlineStyles, showLineNumbers=showLineNumbers, startingLineNumber=startingLineNumber, lineNumberContainerStyle=lineNumberContainerStyle, lineNumberStyle=lineNumberStyle, wrapLines=wrapLines, lineStyle=lineStyle),
     class = c('component', 'core', 'syntaxhighlighter')
   )
}
