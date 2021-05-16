# AUTO GENERATED FILE - DO NOT EDIT

dccLoading <- function(children=NULL, id=NULL, className=NULL, color=NULL, debug=NULL, fullscreen=NULL, loading_state=NULL, parent_className=NULL, parent_style=NULL, style=NULL, type=NULL) {
    
    props <- list(children=children, id=id, className=className, color=color, debug=debug, fullscreen=fullscreen, loading_state=loading_state, parent_className=parent_className, parent_style=parent_style, style=style, type=type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Loading',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'color', 'debug', 'fullscreen', 'loading_state', 'parent_className', 'parent_style', 'style', 'type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
