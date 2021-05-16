# AUTO GENERATED FILE - DO NOT EDIT

dccStore <- function(id=NULL, clear_data=NULL, data=NULL, modified_timestamp=NULL, storage_type=NULL) {
    
    props <- list(id=id, clear_data=clear_data, data=data, modified_timestamp=modified_timestamp, storage_type=storage_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Store',
        namespace = 'dash_core_components',
        propNames = c('id', 'clear_data', 'data', 'modified_timestamp', 'storage_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
