# AUTO GENERATED FILE - DO NOT EDIT

htmlAudio <- function(children=NULL, id=NULL, accessKey=NULL, autoPlay=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, controls=NULL, crossOrigin=NULL, dir=NULL, draggable=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, loop=NULL, muted=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, preload=NULL, role=NULL, spellCheck=NULL, src=NULL, style=NULL, tabIndex=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, autoPlay=autoPlay, className=className, contentEditable=contentEditable, contextMenu=contextMenu, controls=controls, crossOrigin=crossOrigin, dir=dir, draggable=draggable, hidden=hidden, key=key, lang=lang, loading_state=loading_state, loop=loop, muted=muted, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, preload=preload, role=role, spellCheck=spellCheck, src=src, style=style, tabIndex=tabIndex, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Audio',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'autoPlay', 'className', 'contentEditable', 'contextMenu', 'controls', 'crossOrigin', 'dir', 'draggable', 'hidden', 'key', 'lang', 'loading_state', 'loop', 'muted', 'n_clicks', 'n_clicks_timestamp', 'preload', 'role', 'spellCheck', 'src', 'style', 'tabIndex', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
