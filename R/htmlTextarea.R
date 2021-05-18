# AUTO GENERATED FILE - DO NOT EDIT

htmlTextarea <- function(children=NULL, id=NULL, accessKey=NULL, autoComplete=NULL, autoFocus=NULL, className=NULL, cols=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, form=NULL, hidden=NULL, inputMode=NULL, key=NULL, lang=NULL, loading_state=NULL, maxLength=NULL, minLength=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, placeholder=NULL, readOnly=NULL, required=NULL, role=NULL, rows=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, wrap=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, autoComplete=autoComplete, autoFocus=autoFocus, className=className, cols=cols, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, form=form, hidden=hidden, inputMode=inputMode, key=key, lang=lang, loading_state=loading_state, maxLength=maxLength, minLength=minLength, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, placeholder=placeholder, readOnly=readOnly, required=required, role=role, rows=rows, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, wrap=wrap, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Textarea',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'autoComplete', 'autoFocus', 'className', 'cols', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'form', 'hidden', 'inputMode', 'key', 'lang', 'loading_state', 'maxLength', 'minLength', 'n_clicks', 'n_clicks_timestamp', 'name', 'placeholder', 'readOnly', 'required', 'role', 'rows', 'spellCheck', 'style', 'tabIndex', 'title', 'wrap', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
