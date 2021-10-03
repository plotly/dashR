# AUTO GENERATED FILE - DO NOT EDIT

dccTooltip <- function(children=NULL, id=NULL, background_color=NULL, bbox=NULL, border_color=NULL, className=NULL, direction=NULL, loading_state=NULL, loading_text=NULL, show=NULL, style=NULL, targetable=NULL, zindex=NULL) {
    
    props <- list(children=children, id=id, background_color=background_color, bbox=bbox, border_color=border_color, className=className, direction=direction, loading_state=loading_state, loading_text=loading_text, show=show, style=style, targetable=targetable, zindex=zindex)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tooltip',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'background_color', 'bbox', 'border_color', 'className', 'direction', 'loading_state', 'loading_text', 'show', 'style', 'targetable', 'zindex'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
