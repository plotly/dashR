# AUTO GENERATED FILE - DO NOT EDIT

dccTabs <- function(children=NULL, id=NULL, className=NULL, colors=NULL, content_className=NULL, content_style=NULL, loading_state=NULL, mobile_breakpoint=NULL, parent_className=NULL, parent_style=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, style=NULL, value=NULL, vertical=NULL) {
    
    props <- list(children=children, id=id, className=className, colors=colors, content_className=content_className, content_style=content_style, loading_state=loading_state, mobile_breakpoint=mobile_breakpoint, parent_className=parent_className, parent_style=parent_style, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, style=style, value=value, vertical=vertical)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tabs',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'colors', 'content_className', 'content_style', 'loading_state', 'mobile_breakpoint', 'parent_className', 'parent_style', 'persisted_props', 'persistence', 'persistence_type', 'style', 'value', 'vertical'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
