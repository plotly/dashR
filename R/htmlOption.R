# AUTO GENERATED FILE - DO NOT EDIT

htmlOption <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, hidden=NULL, key=NULL, label=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, role=NULL, selected=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, value=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, hidden=hidden, key=key, label=label, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, role=role, selected=selected, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, value=value, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Option',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'hidden', 'key', 'label', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'role', 'selected', 'spellCheck', 'style', 'tabIndex', 'title', 'value', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
