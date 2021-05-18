# AUTO GENERATED FILE - DO NOT EDIT

dccConfirmDialogProvider <- function(children=NULL, id=NULL, cancel_n_clicks=NULL, cancel_n_clicks_timestamp=NULL, displayed=NULL, loading_state=NULL, message=NULL, submit_n_clicks=NULL, submit_n_clicks_timestamp=NULL) {
    
    props <- list(children=children, id=id, cancel_n_clicks=cancel_n_clicks, cancel_n_clicks_timestamp=cancel_n_clicks_timestamp, displayed=displayed, loading_state=loading_state, message=message, submit_n_clicks=submit_n_clicks, submit_n_clicks_timestamp=submit_n_clicks_timestamp)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ConfirmDialogProvider',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'cancel_n_clicks', 'cancel_n_clicks_timestamp', 'displayed', 'loading_state', 'message', 'submit_n_clicks', 'submit_n_clicks_timestamp'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
