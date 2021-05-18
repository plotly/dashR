# AUTO GENERATED FILE - DO NOT EDIT

htmlScript <- function(children=NULL, id=NULL, accessKey=NULL, async=NULL, charSet=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, crossOrigin=NULL, defer=NULL, dir=NULL, draggable=NULL, hidden=NULL, integrity=NULL, key=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, referrerPolicy=NULL, role=NULL, spellCheck=NULL, src=NULL, style=NULL, tabIndex=NULL, title=NULL, type=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, async=async, charSet=charSet, className=className, contentEditable=contentEditable, contextMenu=contextMenu, crossOrigin=crossOrigin, defer=defer, dir=dir, draggable=draggable, hidden=hidden, integrity=integrity, key=key, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, referrerPolicy=referrerPolicy, role=role, spellCheck=spellCheck, src=src, style=style, tabIndex=tabIndex, title=title, type=type, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Script',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'async', 'charSet', 'className', 'contentEditable', 'contextMenu', 'crossOrigin', 'defer', 'dir', 'draggable', 'hidden', 'integrity', 'key', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'referrerPolicy', 'role', 'spellCheck', 'src', 'style', 'tabIndex', 'title', 'type', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
