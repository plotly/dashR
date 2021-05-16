# AUTO GENERATED FILE - DO NOT EDIT

htmlCommand <- function(children=NULL, id=NULL, accessKey=NULL, checked=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, hidden=NULL, icon=NULL, key=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, radioGroup=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, type=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, checked=checked, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, hidden=hidden, icon=icon, key=key, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, radioGroup=radioGroup, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, type=type, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Command',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'checked', 'className', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'hidden', 'icon', 'key', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'radioGroup', 'role', 'spellCheck', 'style', 'tabIndex', 'title', 'type', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
