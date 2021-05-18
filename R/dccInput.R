# AUTO GENERATED FILE - DO NOT EDIT

dccInput <- function(id=NULL, autoComplete=NULL, autoFocus=NULL, className=NULL, debounce=NULL, disabled=NULL, inputMode=NULL, list=NULL, loading_state=NULL, max=NULL, maxLength=NULL, min=NULL, minLength=NULL, multiple=NULL, n_blur=NULL, n_blur_timestamp=NULL, n_submit=NULL, n_submit_timestamp=NULL, name=NULL, pattern=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, placeholder=NULL, readOnly=NULL, required=NULL, selectionDirection=NULL, selectionEnd=NULL, selectionStart=NULL, size=NULL, spellCheck=NULL, step=NULL, style=NULL, type=NULL, value=NULL) {
    
    props <- list(id=id, autoComplete=autoComplete, autoFocus=autoFocus, className=className, debounce=debounce, disabled=disabled, inputMode=inputMode, list=list, loading_state=loading_state, max=max, maxLength=maxLength, min=min, minLength=minLength, multiple=multiple, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, n_submit=n_submit, n_submit_timestamp=n_submit_timestamp, name=name, pattern=pattern, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, placeholder=placeholder, readOnly=readOnly, required=required, selectionDirection=selectionDirection, selectionEnd=selectionEnd, selectionStart=selectionStart, size=size, spellCheck=spellCheck, step=step, style=style, type=type, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Input',
        namespace = 'dash_core_components',
        propNames = c('id', 'autoComplete', 'autoFocus', 'className', 'debounce', 'disabled', 'inputMode', 'list', 'loading_state', 'max', 'maxLength', 'min', 'minLength', 'multiple', 'n_blur', 'n_blur_timestamp', 'n_submit', 'n_submit_timestamp', 'name', 'pattern', 'persisted_props', 'persistence', 'persistence_type', 'placeholder', 'readOnly', 'required', 'selectionDirection', 'selectionEnd', 'selectionStart', 'size', 'spellCheck', 'step', 'style', 'type', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
