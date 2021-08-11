# AUTO GENERATED FILE - DO NOT EDIT

dccClipboard <- function(id=NULL, className=NULL, content=NULL, loading_state=NULL, n_clicks=NULL, style=NULL, target_id=NULL, title=NULL) {
    
    props <- list(id=id, className=className, content=content, loading_state=loading_state, n_clicks=n_clicks, style=style, target_id=target_id, title=title)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Clipboard',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'content', 'loading_state', 'n_clicks', 'style', 'target_id', 'title'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
