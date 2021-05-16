# AUTO GENERATED FILE - DO NOT EDIT

dccClipboard <- function(id=NULL, className=NULL, loading_state=NULL, n_clicks=NULL, style=NULL, target_id=NULL, text=NULL, title=NULL) {
    
    props <- list(id=id, className=className, loading_state=loading_state, n_clicks=n_clicks, style=style, target_id=target_id, text=text, title=title)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Clipboard',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'loading_state', 'n_clicks', 'style', 'target_id', 'text', 'title'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
