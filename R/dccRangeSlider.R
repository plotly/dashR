# AUTO GENERATED FILE - DO NOT EDIT

dccRangeSlider <- function(id=NULL, allowCross=NULL, className=NULL, count=NULL, disabled=NULL, dots=NULL, drag_value=NULL, included=NULL, loading_state=NULL, marks=NULL, max=NULL, min=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, pushable=NULL, step=NULL, tooltip=NULL, updatemode=NULL, value=NULL, vertical=NULL, verticalHeight=NULL) {
    
    props <- list(id=id, allowCross=allowCross, className=className, count=count, disabled=disabled, dots=dots, drag_value=drag_value, included=included, loading_state=loading_state, marks=marks, max=max, min=min, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, pushable=pushable, step=step, tooltip=tooltip, updatemode=updatemode, value=value, vertical=vertical, verticalHeight=verticalHeight)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RangeSlider',
        namespace = 'dash_core_components',
        propNames = c('id', 'allowCross', 'className', 'count', 'disabled', 'dots', 'drag_value', 'included', 'loading_state', 'marks', 'max', 'min', 'persisted_props', 'persistence', 'persistence_type', 'pushable', 'step', 'tooltip', 'updatemode', 'value', 'vertical', 'verticalHeight'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
