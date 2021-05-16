# AUTO GENERATED FILE - DO NOT EDIT

dccTab <- function(children=NULL, id=NULL, className=NULL, disabled=NULL, disabled_className=NULL, disabled_style=NULL, label=NULL, loading_state=NULL, selected_className=NULL, selected_style=NULL, style=NULL, value=NULL) {
    
    props <- list(children=children, id=id, className=className, disabled=disabled, disabled_className=disabled_className, disabled_style=disabled_style, label=label, loading_state=loading_state, selected_className=selected_className, selected_style=selected_style, style=style, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tab',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'disabled', 'disabled_className', 'disabled_style', 'label', 'loading_state', 'selected_className', 'selected_style', 'style', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
