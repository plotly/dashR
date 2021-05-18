# AUTO GENERATED FILE - DO NOT EDIT

dccUpload <- function(children=NULL, id=NULL, accept=NULL, className=NULL, className_active=NULL, className_disabled=NULL, className_reject=NULL, contents=NULL, disable_click=NULL, disabled=NULL, filename=NULL, last_modified=NULL, loading_state=NULL, max_size=NULL, min_size=NULL, multiple=NULL, style=NULL, style_active=NULL, style_disabled=NULL, style_reject=NULL) {
    
    props <- list(children=children, id=id, accept=accept, className=className, className_active=className_active, className_disabled=className_disabled, className_reject=className_reject, contents=contents, disable_click=disable_click, disabled=disabled, filename=filename, last_modified=last_modified, loading_state=loading_state, max_size=max_size, min_size=min_size, multiple=multiple, style=style, style_active=style_active, style_disabled=style_disabled, style_reject=style_reject)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Upload',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'accept', 'className', 'className_active', 'className_disabled', 'className_reject', 'contents', 'disable_click', 'disabled', 'filename', 'last_modified', 'loading_state', 'max_size', 'min_size', 'multiple', 'style', 'style_active', 'style_disabled', 'style_reject'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
