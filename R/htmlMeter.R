# AUTO GENERATED FILE - DO NOT EDIT

htmlMeter <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, form=NULL, hidden=NULL, high=NULL, key=NULL, lang=NULL, loading_state=NULL, low=NULL, max=NULL, min=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, optimum=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, value=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, form=form, hidden=hidden, high=high, key=key, lang=lang, loading_state=loading_state, low=low, max=max, min=min, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, optimum=optimum, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, value=value, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Meter',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'form', 'hidden', 'high', 'key', 'lang', 'loading_state', 'low', 'max', 'min', 'n_clicks', 'n_clicks_timestamp', 'optimum', 'role', 'spellCheck', 'style', 'tabIndex', 'title', 'value', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
