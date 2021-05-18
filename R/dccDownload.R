# AUTO GENERATED FILE - DO NOT EDIT

dccDownload <- function(id=NULL, base64=NULL, data=NULL, type=NULL) {
    
    props <- list(id=id, base64=base64, data=data, type=type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Download',
        namespace = 'dash_core_components',
        propNames = c('id', 'base64', 'data', 'type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
