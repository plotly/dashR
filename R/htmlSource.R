# AUTO GENERATED FILE - DO NOT EDIT

htmlSource <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, media=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, role=NULL, sizes=NULL, spellCheck=NULL, src=NULL, srcSet=NULL, style=NULL, tabIndex=NULL, title=NULL, type=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, key=key, lang=lang, loading_state=loading_state, media=media, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, role=role, sizes=sizes, spellCheck=spellCheck, src=src, srcSet=srcSet, style=style, tabIndex=tabIndex, title=title, type=type, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Source',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'hidden', 'key', 'lang', 'loading_state', 'media', 'n_clicks', 'n_clicks_timestamp', 'role', 'sizes', 'spellCheck', 'src', 'srcSet', 'style', 'tabIndex', 'title', 'type', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
