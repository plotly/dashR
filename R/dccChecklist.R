# AUTO GENERATED FILE - DO NOT EDIT

dccChecklist <- function(id=NULL, className=NULL, inline=NULL, inputClassName=NULL, inputStyle=NULL, labelClassName=NULL, labelStyle=NULL, loading_state=NULL, options=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, style=NULL, value=NULL) {
    
    props <- list(id=id, className=className, inline=inline, inputClassName=inputClassName, inputStyle=inputStyle, labelClassName=labelClassName, labelStyle=labelStyle, loading_state=loading_state, options=options, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, style=style, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Checklist',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'inline', 'inputClassName', 'inputStyle', 'labelClassName', 'labelStyle', 'loading_state', 'options', 'persisted_props', 'persistence', 'persistence_type', 'style', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
