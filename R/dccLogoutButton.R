# AUTO GENERATED FILE - DO NOT EDIT

dccLogoutButton <- function(id=NULL, className=NULL, label=NULL, loading_state=NULL, logout_url=NULL, method=NULL, style=NULL) {
    
    props <- list(id=id, className=className, label=label, loading_state=loading_state, logout_url=logout_url, method=method, style=style)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'LogoutButton',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'label', 'loading_state', 'logout_url', 'method', 'style'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
