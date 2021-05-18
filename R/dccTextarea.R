# AUTO GENERATED FILE - DO NOT EDIT

dccTextarea <- function(id=NULL, accessKey=NULL, autoFocus=NULL, className=NULL, cols=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, form=NULL, hidden=NULL, lang=NULL, loading_state=NULL, maxLength=NULL, minLength=NULL, n_blur=NULL, n_blur_timestamp=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, placeholder=NULL, readOnly=NULL, required=NULL, rows=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, value=NULL, wrap=NULL) {
    
    props <- list(id=id, accessKey=accessKey, autoFocus=autoFocus, className=className, cols=cols, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, form=form, hidden=hidden, lang=lang, loading_state=loading_state, maxLength=maxLength, minLength=minLength, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, placeholder=placeholder, readOnly=readOnly, required=required, rows=rows, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, value=value, wrap=wrap)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Textarea',
        namespace = 'dash_core_components',
        propNames = c('id', 'accessKey', 'autoFocus', 'className', 'cols', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'form', 'hidden', 'lang', 'loading_state', 'maxLength', 'minLength', 'n_blur', 'n_blur_timestamp', 'n_clicks', 'n_clicks_timestamp', 'name', 'persisted_props', 'persistence', 'persistence_type', 'placeholder', 'readOnly', 'required', 'rows', 'spellCheck', 'style', 'tabIndex', 'title', 'value', 'wrap'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
