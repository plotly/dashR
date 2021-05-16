# AUTO GENERATED FILE - DO NOT EDIT

dccConfirmDialog <- function(id=NULL, cancel_n_clicks=NULL, cancel_n_clicks_timestamp=NULL, displayed=NULL, message=NULL, submit_n_clicks=NULL, submit_n_clicks_timestamp=NULL) {
    
    props <- list(id=id, cancel_n_clicks=cancel_n_clicks, cancel_n_clicks_timestamp=cancel_n_clicks_timestamp, displayed=displayed, message=message, submit_n_clicks=submit_n_clicks, submit_n_clicks_timestamp=submit_n_clicks_timestamp)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ConfirmDialog',
        namespace = 'dash_core_components',
        propNames = c('id', 'cancel_n_clicks', 'cancel_n_clicks_timestamp', 'displayed', 'message', 'submit_n_clicks', 'submit_n_clicks_timestamp'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
