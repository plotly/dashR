# AUTO GENERATED FILE - DO NOT EDIT

htmlMeta <- function(children=NULL, id=NULL, accessKey=NULL, charSet=NULL, className=NULL, content=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, hidden=NULL, httpEquiv=NULL, key=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, charSet=charSet, className=className, content=content, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, httpEquiv=httpEquiv, key=key, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Meta',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'charSet', 'className', 'content', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'hidden', 'httpEquiv', 'key', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'name', 'role', 'spellCheck', 'style', 'tabIndex', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
