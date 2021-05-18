# AUTO GENERATED FILE - DO NOT EDIT

htmlOutput <- function(children=NULL, id=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, form=NULL, hidden=NULL, htmlFor=NULL, key=NULL, lang=NULL, loading_state=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, role=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, form=form, hidden=hidden, htmlFor=htmlFor, key=key, lang=lang, loading_state=loading_state, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, role=role, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Output',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'form', 'hidden', 'htmlFor', 'key', 'lang', 'loading_state', 'n_clicks', 'n_clicks_timestamp', 'name', 'role', 'spellCheck', 'style', 'tabIndex', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
