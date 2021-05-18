# AUTO GENERATED FILE - DO NOT EDIT

htmlA <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, download=NULL, draggable=NULL, hidden=NULL, href=NULL, hrefLang=NULL, key=NULL, lang=NULL, loading_state=NULL, media=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, referrerPolicy=NULL, rel=NULL, role=NULL, shape=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, target=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, download=download, draggable=draggable, hidden=hidden, href=href, hrefLang=hrefLang, key=key, lang=lang, loading_state=loading_state, media=media, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, referrerPolicy=referrerPolicy, rel=rel, role=role, shape=shape, spellCheck=spellCheck, style=style, tabIndex=tabIndex, target=target, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'A',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'download', 'draggable', 'hidden', 'href', 'hrefLang', 'key', 'lang', 'loading_state', 'media', 'n_clicks', 'n_clicks_timestamp', 'referrerPolicy', 'rel', 'role', 'shape', 'spellCheck', 'style', 'tabIndex', 'target', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
