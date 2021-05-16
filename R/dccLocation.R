# AUTO GENERATED FILE - DO NOT EDIT

dccLocation <- function(id=NULL, hash=NULL, href=NULL, pathname=NULL, refresh=NULL, search=NULL) {
    
    props <- list(id=id, hash=hash, href=href, pathname=pathname, refresh=refresh, search=search)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Location',
        namespace = 'dash_core_components',
        propNames = c('id', 'hash', 'href', 'pathname', 'refresh', 'search'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
