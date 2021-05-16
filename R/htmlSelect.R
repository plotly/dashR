# AUTO GENERATED FILE - DO NOT EDIT

htmlSelect <- function(children=NULL, id=NULL, accessKey=NULL, autoComplete=NULL, autoFocus=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, form=NULL, hidden=NULL, key=NULL, lang=NULL, loading_state=NULL, multiple=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, required=NULL, role=NULL, size=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, ...) {
    
    wildcard_names = names(dash_assert_valid_wildcards(attrib = list('aria', 'data'), ...))

    props <- list(children=children, id=id, accessKey=accessKey, autoComplete=autoComplete, autoFocus=autoFocus, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, form=form, hidden=hidden, key=key, lang=lang, loading_state=loading_state, multiple=multiple, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, required=required, role=role, size=size, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, ...)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Select',
        namespace = 'dash_html_components',
        propNames = c('children', 'id', 'accessKey', 'autoComplete', 'autoFocus', 'className', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'form', 'hidden', 'key', 'lang', 'loading_state', 'multiple', 'n_clicks', 'n_clicks_timestamp', 'name', 'required', 'role', 'size', 'spellCheck', 'style', 'tabIndex', 'title', wildcard_names),
        package = 'dashHtmlComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
