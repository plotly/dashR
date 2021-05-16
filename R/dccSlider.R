# AUTO GENERATED FILE - DO NOT EDIT

dccSlider <- function(id=NULL, className=NULL, disabled=NULL, dots=NULL, drag_value=NULL, included=NULL, loading_state=NULL, marks=NULL, max=NULL, min=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, step=NULL, tooltip=NULL, updatemode=NULL, value=NULL, vertical=NULL, verticalHeight=NULL) {
    
    props <- list(id=id, className=className, disabled=disabled, dots=dots, drag_value=drag_value, included=included, loading_state=loading_state, marks=marks, max=max, min=min, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, step=step, tooltip=tooltip, updatemode=updatemode, value=value, vertical=vertical, verticalHeight=verticalHeight)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Slider',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'disabled', 'dots', 'drag_value', 'included', 'loading_state', 'marks', 'max', 'min', 'persisted_props', 'persistence', 'persistence_type', 'step', 'tooltip', 'updatemode', 'value', 'vertical', 'verticalHeight'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
