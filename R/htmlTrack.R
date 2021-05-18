# AUTO GENERATED FILE - DO NOT EDIT

htmlTrack <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, default=NULL, dir=NULL, draggable=NULL, hidden=NULL, key=NULL, kind=NULL, label=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, role=NULL, spellCheck=NULL, src=NULL, srcLang=NULL, style=NULL, tabIndex=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, default=default, dir=dir, draggable=draggable, hidden=hidden, key=key, kind=kind, label=label, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, role=role, spellCheck=spellCheck, src=src, srcLang=srcLang, style=style, tabIndex=tabIndex, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Track',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'default', 'dir', 'draggable', 'hidden', 'key', 'kind', 'label', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'role', 'spellCheck', 'src', 'srcLang', 'style', 'tabIndex', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
