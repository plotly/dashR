# AUTO GENERATED FILE - DO NOT EDIT

htmlButton <- function(children=NULL, id=NULL, accessKey=NULL, autoFocus=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, form=NULL, formAction=NULL, formEncType=NULL, formMethod=NULL, formNoValidate=NULL, formTarget=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, type=NULL, value=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, autoFocus=autoFocus, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, form=form, formAction=formAction, formEncType=formEncType, formMethod=formMethod, formNoValidate=formNoValidate, formTarget=formTarget, hidden=hidden, key=key, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, type=type, value=value, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Button',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'autoFocus', 'className', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'form', 'formAction', 'formEncType', 'formMethod', 'formNoValidate', 'formTarget', 'hidden', 'key', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'name', 'role', 'spellCheck', 'style', 'tabIndex', 'title', 'type', 'value', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
