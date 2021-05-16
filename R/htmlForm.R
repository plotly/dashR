# AUTO GENERATED FILE - DO NOT EDIT

htmlForm <- function(children=NULL, id=NULL, accept=NULL, acceptCharset=NULL, accessKey=NULL, action=NULL, autoComplete=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, encType=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, method=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, noValidate=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, target=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accept=accept, acceptCharset=acceptCharset, accessKey=accessKey, action=action, autoComplete=autoComplete, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, encType=encType, hidden=hidden, key=key, lang=lang, loading_state=loading_state, method=method, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, noValidate=noValidate, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, target=target, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Form',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accept', 'acceptCharset', 'accessKey', 'action', 'autoComplete', 'className', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'encType', 'hidden', 'key', 'lang', 'loading_state', 'method', 'n_clicks', 'n_clicks_timestamp', 'name', 'noValidate', 'role', 'spellCheck', 'style', 'tabIndex', 'target', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
