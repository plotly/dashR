# AUTO GENERATED FILE - DO NOT EDIT

htmlProgress <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, form=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, max=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, value=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, form=form, hidden=hidden, key=key, lang=lang, loading_state=loading_state, max=max, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, value=value, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Progress',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'form', 'hidden', 'key', 'lang', 'loading_state', 'max', 'n_clicks', 'n_clicks_timestamp', 'role', 'spellCheck', 'style', 'tabIndex', 'title', 'value', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
