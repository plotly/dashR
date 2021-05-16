# AUTO GENERATED FILE - DO NOT EDIT

dccLink <- function(children=NULL, id=NULL, className=NULL, href=NULL, loading_state=NULL, refresh=NULL, style=NULL, target=NULL, title=NULL) {
    
    props <- list(children=children, id=id, className=className, href=href, loading_state=loading_state, refresh=refresh, style=style, target=target, title=title)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Link',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'href', 'loading_state', 'refresh', 'style', 'target', 'title'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
