# AUTO GENERATED FILE - DO NOT EDIT

dccInterval <- function(id=NULL, disabled=NULL, interval=NULL, max_intervals=NULL, n_intervals=NULL) {
    
    props <- list(id=id, disabled=disabled, interval=interval, max_intervals=max_intervals, n_intervals=n_intervals)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Interval',
        namespace = 'dash_core_components',
        propNames = c('id', 'disabled', 'interval', 'max_intervals', 'n_intervals'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
