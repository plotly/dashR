# AUTO GENERATED FILE - DO NOT EDIT

htmlTd <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, colSpan=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, headers=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, role=NULL, rowSpan=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, colSpan=colSpan, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, headers=headers, hidden=hidden, key=key, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, role=role, rowSpan=rowSpan, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Td',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'colSpan', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'headers', 'hidden', 'key', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'role', 'rowSpan', 'spellCheck', 'style', 'tabIndex', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
