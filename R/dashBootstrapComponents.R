# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcAccordion <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, flush=NULL, active_item=NULL, start_collapsed=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, flush=flush, active_item=active_item, start_collapsed=start_collapsed, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Accordion',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'flush', 'active_item', 'start_collapsed', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcAccordionItem <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, title=NULL, item_id=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, title=title, item_id=item_id, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'AccordionItem',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'title', 'item_id', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcAlert <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, color=NULL, is_open=NULL, fade=NULL, dismissable=NULL, duration=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, color=color, is_open=is_open, fade=fade, dismissable=dismissable, duration=duration, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Alert',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'color', 'is_open', 'fade', 'dismissable', 'duration', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcBadge <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, color=NULL, text_color=NULL, pill=NULL, href=NULL, tag=NULL, loading_state=NULL, external_link=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, target=NULL, title=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, color=color, text_color=text_color, pill=pill, href=href, tag=tag, loading_state=loading_state, external_link=external_link, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, target=target, title=title)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Badge',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'color', 'text_color', 'pill', 'href', 'tag', 'loading_state', 'external_link', 'n_clicks', 'n_clicks_timestamp', 'target', 'title'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcBreadcrumb <- function(id=NULL, items=NULL, style=NULL, item_style=NULL, class_name=NULL, className=NULL, item_class_name=NULL, itemClassName=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(id=id, items=items, style=style, item_style=item_style, class_name=class_name, className=className, item_class_name=item_class_name, itemClassName=itemClassName, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Breadcrumb',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'items', 'style', 'item_style', 'class_name', 'className', 'item_class_name', 'itemClassName', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcButton <- function(children=NULL, id=NULL, class_name=NULL, className=NULL, style=NULL, key=NULL, href=NULL, external_link=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, active=NULL, color=NULL, disabled=NULL, size=NULL, title=NULL, outline=NULL, loading_state=NULL, target=NULL, type=NULL, download=NULL, name=NULL, value=NULL) {

    props <- list(children=children, id=id, class_name=class_name, className=className, style=style, key=key, href=href, external_link=external_link, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, active=active, color=color, disabled=disabled, size=size, title=title, outline=outline, loading_state=loading_state, target=target, type=type, download=download, name=name, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Button',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'class_name', 'className', 'style', 'key', 'href', 'external_link', 'n_clicks', 'n_clicks_timestamp', 'active', 'color', 'disabled', 'size', 'title', 'outline', 'loading_state', 'target', 'type', 'download', 'name', 'value'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcButtonGroup <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, vertical=NULL, size=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, vertical=vertical, size=size, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ButtonGroup',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'vertical', 'size', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCard <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, color=NULL, body=NULL, outline=NULL, inverse=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, color=color, body=body, outline=outline, inverse=inverse, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Card',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'color', 'body', 'outline', 'inverse', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardBody <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardBody',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardFooter <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardFooter',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardGroup <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardGroup',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardHeader <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardHeader',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardImg <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, top=NULL, bottom=NULL, src=NULL, alt=NULL, title=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, top=top, bottom=bottom, src=src, alt=alt, title=title, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardImg',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'top', 'bottom', 'src', 'alt', 'title', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardImgOverlay <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardImgOverlay',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCardLink <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, href=NULL, external_link=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, loading_state=NULL, target=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, href=href, external_link=external_link, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, loading_state=loading_state, target=target)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'CardLink',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'href', 'external_link', 'n_clicks', 'n_clicks_timestamp', 'loading_state', 'target'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCarousel <- function(id=NULL, style=NULL, class_name=NULL, className=NULL, items=NULL, active_index=NULL, controls=NULL, indicators=NULL, ride=NULL, slide=NULL, variant=NULL, interval=NULL, loading_state=NULL) {

    props <- list(id=id, style=style, class_name=class_name, className=className, items=items, active_index=active_index, controls=controls, indicators=indicators, ride=ride, slide=slide, variant=variant, interval=interval, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Carousel',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'style', 'class_name', 'className', 'items', 'active_index', 'controls', 'indicators', 'ride', 'slide', 'variant', 'interval', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCheckbox <- function(id=NULL, class_name=NULL, className=NULL, style=NULL, input_style=NULL, inputStyle=NULL, input_class_name=NULL, inputClassName=NULL, label=NULL, label_id=NULL, label_style=NULL, labelStyle=NULL, label_class_name=NULL, labelClassName=NULL, name=NULL, disabled=NULL, value=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {

    props <- list(id=id, class_name=class_name, className=className, style=style, input_style=input_style, inputStyle=inputStyle, input_class_name=input_class_name, inputClassName=inputClassName, label=label, label_id=label_id, label_style=label_style, labelStyle=labelStyle, label_class_name=label_class_name, labelClassName=labelClassName, name=name, disabled=disabled, value=value, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Checkbox',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'class_name', 'className', 'style', 'input_style', 'inputStyle', 'input_class_name', 'inputClassName', 'label', 'label_id', 'label_style', 'labelStyle', 'label_class_name', 'labelClassName', 'name', 'disabled', 'value', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcChecklist <- function(id=NULL, options=NULL, value=NULL, class_name=NULL, className=NULL, style=NULL, key=NULL, input_style=NULL, inputStyle=NULL, input_checked_style=NULL, inputCheckedStyle=NULL, input_class_name=NULL, inputClassName=NULL, input_checked_class_name=NULL, inputCheckedClassName=NULL, label_style=NULL, labelStyle=NULL, label_checked_style=NULL, labelCheckedStyle=NULL, label_class_name=NULL, labelClassName=NULL, label_checked_class_name=NULL, labelCheckedClassName=NULL, inline=NULL, switch=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL, name=NULL) {

    props <- list(id=id, options=options, value=value, class_name=class_name, className=className, style=style, key=key, input_style=input_style, inputStyle=inputStyle, input_checked_style=input_checked_style, inputCheckedStyle=inputCheckedStyle, input_class_name=input_class_name, inputClassName=inputClassName, input_checked_class_name=input_checked_class_name, inputCheckedClassName=inputCheckedClassName, label_style=label_style, labelStyle=labelStyle, label_checked_style=label_checked_style, labelCheckedStyle=labelCheckedStyle, label_class_name=label_class_name, labelClassName=labelClassName, label_checked_class_name=label_checked_class_name, labelCheckedClassName=labelCheckedClassName, inline=inline, switch=switch, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type, name=name)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Checklist',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'options', 'value', 'class_name', 'className', 'style', 'key', 'input_style', 'inputStyle', 'input_checked_style', 'inputCheckedStyle', 'input_class_name', 'inputClassName', 'input_checked_class_name', 'inputCheckedClassName', 'label_style', 'labelStyle', 'label_checked_style', 'labelCheckedStyle', 'label_class_name', 'labelClassName', 'label_checked_class_name', 'labelCheckedClassName', 'inline', 'switch', 'loading_state', 'persistence', 'persisted_props', 'persistence_type', 'name'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCol <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, width=NULL, xs=NULL, sm=NULL, md=NULL, lg=NULL, xl=NULL, xxl=NULL, align=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, width=width, xs=xs, sm=sm, md=md, lg=lg, xl=xl, xxl=xxl, align=align, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Col',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'width', 'xs', 'sm', 'md', 'lg', 'xl', 'xxl', 'align', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcCollapse <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, is_open=NULL, navbar=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, is_open=is_open, navbar=navbar, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Collapse',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'is_open', 'navbar', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcContainer <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, fluid=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, fluid=fluid, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Container',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'fluid', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcDropdownMenu <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, label=NULL, direction=NULL, align_end=NULL, right=NULL, in_navbar=NULL, addon_type=NULL, disabled=NULL, nav=NULL, caret=NULL, color=NULL, menu_variant=NULL, toggle_style=NULL, toggle_class_name=NULL, toggleClassName=NULL, size=NULL, loading_state=NULL, group=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, label=label, direction=direction, align_end=align_end, right=right, in_navbar=in_navbar, addon_type=addon_type, disabled=disabled, nav=nav, caret=caret, color=color, menu_variant=menu_variant, toggle_style=toggle_style, toggle_class_name=toggle_class_name, toggleClassName=toggleClassName, size=size, loading_state=loading_state, group=group)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DropdownMenu',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'label', 'direction', 'align_end', 'right', 'in_navbar', 'addon_type', 'disabled', 'nav', 'caret', 'color', 'menu_variant', 'toggle_style', 'toggle_class_name', 'toggleClassName', 'size', 'loading_state', 'group'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcDropdownMenuItem <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, active=NULL, disabled=NULL, divider=NULL, header=NULL, href=NULL, toggle=NULL, external_link=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, loading_state=NULL, target=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, active=active, disabled=disabled, divider=divider, header=header, href=href, toggle=toggle, external_link=external_link, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, loading_state=loading_state, target=target)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DropdownMenuItem',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'active', 'disabled', 'divider', 'header', 'href', 'toggle', 'external_link', 'n_clicks', 'n_clicks_timestamp', 'loading_state', 'target'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcFade <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, is_in=NULL, timeout=NULL, appear=NULL, enter=NULL, exit=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, is_in=is_in, timeout=timeout, appear=appear, enter=enter, exit=exit, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Fade',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'is_in', 'timeout', 'appear', 'enter', 'exit', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcForm <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, action=NULL, method=NULL, n_submit=NULL, n_submit_timestamp=NULL, prevent_default_on_submit=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, action=action, method=method, n_submit=n_submit, n_submit_timestamp=n_submit_timestamp, prevent_default_on_submit=prevent_default_on_submit, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Form',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'action', 'method', 'n_submit', 'n_submit_timestamp', 'prevent_default_on_submit', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcFormFeedback <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, type=NULL, tooltip=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, type=type, tooltip=tooltip, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'FormFeedback',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'type', 'tooltip', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcFormFloating <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, html_for=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, html_for=html_for, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'FormFloating',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'html_for', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcFormText <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, color=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, color=color, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'FormText',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'color', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcInput <- function(id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, type=NULL, value=NULL, disabled=NULL, autocomplete=NULL, autoComplete=NULL, autofocus=NULL, autoFocus=NULL, inputmode=NULL, inputMode=NULL, list=NULL, max=NULL, maxlength=NULL, maxLength=NULL, min=NULL, minlength=NULL, minLength=NULL, step=NULL, html_size=NULL, size=NULL, valid=NULL, invalid=NULL, required=NULL, plaintext=NULL, placeholder=NULL, name=NULL, pattern=NULL, n_submit=NULL, n_submit_timestamp=NULL, n_blur=NULL, n_blur_timestamp=NULL, debounce=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL, tabindex=NULL, tabIndex=NULL) {

    props <- list(id=id, style=style, class_name=class_name, className=className, key=key, type=type, value=value, disabled=disabled, autocomplete=autocomplete, autoComplete=autoComplete, autofocus=autofocus, autoFocus=autoFocus, inputmode=inputmode, inputMode=inputMode, list=list, max=max, maxlength=maxlength, maxLength=maxLength, min=min, minlength=minlength, minLength=minLength, step=step, html_size=html_size, size=size, valid=valid, invalid=invalid, required=required, plaintext=plaintext, placeholder=placeholder, name=name, pattern=pattern, n_submit=n_submit, n_submit_timestamp=n_submit_timestamp, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, debounce=debounce, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type, tabindex=tabindex, tabIndex=tabIndex)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Input',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'style', 'class_name', 'className', 'key', 'type', 'value', 'disabled', 'autocomplete', 'autoComplete', 'autofocus', 'autoFocus', 'inputmode', 'inputMode', 'list', 'max', 'maxlength', 'maxLength', 'min', 'minlength', 'minLength', 'step', 'html_size', 'size', 'valid', 'invalid', 'required', 'plaintext', 'placeholder', 'name', 'pattern', 'n_submit', 'n_submit_timestamp', 'n_blur', 'n_blur_timestamp', 'debounce', 'loading_state', 'persistence', 'persisted_props', 'persistence_type', 'tabindex', 'tabIndex'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcInputGroup <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, size=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, size=size, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'InputGroup',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'size', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcInputGroupText <- function(children=NULL, id=NULL, style=NULL, key=NULL, class_name=NULL, className=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, key=key, class_name=class_name, className=className, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'InputGroupText',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'key', 'class_name', 'className', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcLabel <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, hidden=NULL, size=NULL, html_for=NULL, check=NULL, width=NULL, xs=NULL, sm=NULL, md=NULL, lg=NULL, xl=NULL, align=NULL, color=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, hidden=hidden, size=size, html_for=html_for, check=check, width=width, xs=xs, sm=sm, md=md, lg=lg, xl=xl, align=align, color=color, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Label',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'hidden', 'size', 'html_for', 'check', 'width', 'xs', 'sm', 'md', 'lg', 'xl', 'align', 'color', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcListGroup <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, flush=NULL, loading_state=NULL, horizontal=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, flush=flush, loading_state=loading_state, horizontal=horizontal)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ListGroup',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'flush', 'loading_state', 'horizontal'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcListGroupItem <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, active=NULL, disabled=NULL, color=NULL, action=NULL, href=NULL, external_link=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, loading_state=NULL, target=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, active=active, disabled=disabled, color=color, action=action, href=href, external_link=external_link, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, loading_state=loading_state, target=target)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ListGroupItem',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'active', 'disabled', 'color', 'action', 'href', 'external_link', 'n_clicks', 'n_clicks_timestamp', 'loading_state', 'target'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcModal <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, tag=NULL, is_open=NULL, centered=NULL, scrollable=NULL, autofocus=NULL, autoFocus=NULL, size=NULL, role=NULL, labelledby=NULL, labelledBy=NULL, keyboard=NULL, backdrop=NULL, modal_class_name=NULL, modalClassName=NULL, backdrop_class_name=NULL, backdropClassName=NULL, content_class_name=NULL, contentClassName=NULL, fade=NULL, fullscreen=NULL, zindex=NULL, zIndex=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, tag=tag, is_open=is_open, centered=centered, scrollable=scrollable, autofocus=autofocus, autoFocus=autoFocus, size=size, role=role, labelledby=labelledby, labelledBy=labelledBy, keyboard=keyboard, backdrop=backdrop, modal_class_name=modal_class_name, modalClassName=modalClassName, backdrop_class_name=backdrop_class_name, backdropClassName=backdropClassName, content_class_name=content_class_name, contentClassName=contentClassName, fade=fade, fullscreen=fullscreen, zindex=zindex, zIndex=zIndex)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Modal',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'tag', 'is_open', 'centered', 'scrollable', 'autofocus', 'autoFocus', 'size', 'role', 'labelledby', 'labelledBy', 'keyboard', 'backdrop', 'modal_class_name', 'modalClassName', 'backdrop_class_name', 'backdropClassName', 'content_class_name', 'contentClassName', 'fade', 'fullscreen', 'zindex', 'zIndex'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcModalBody <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ModalBody',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcModalFooter <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ModalFooter',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcModalHeader <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, close_button=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, close_button=close_button, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ModalHeader',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'close_button', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcModalTitle <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ModalTitle',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNav <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, pills=NULL, card=NULL, fill=NULL, justified=NULL, vertical=NULL, horizontal=NULL, navbar=NULL, navbar_scroll=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, pills=pills, card=card, fill=fill, justified=justified, vertical=vertical, horizontal=horizontal, navbar=navbar, navbar_scroll=navbar_scroll, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Nav',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'pills', 'card', 'fill', 'justified', 'vertical', 'horizontal', 'navbar', 'navbar_scroll', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNavItem <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'NavItem',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNavLink <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, href=NULL, active=NULL, disabled=NULL, external_link=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, loading_state=NULL, target=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, href=href, active=active, disabled=disabled, external_link=external_link, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, loading_state=loading_state, target=target)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'NavLink',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'href', 'active', 'disabled', 'external_link', 'n_clicks', 'n_clicks_timestamp', 'loading_state', 'target'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNavbar <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, light=NULL, dark=NULL, fixed=NULL, sticky=NULL, color=NULL, role=NULL, tag=NULL, expand=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, light=light, dark=dark, fixed=fixed, sticky=sticky, color=color, role=role, tag=tag, expand=expand, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Navbar',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'light', 'dark', 'fixed', 'sticky', 'color', 'role', 'tag', 'expand', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNavbarBrand <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, external_link=NULL, href=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, external_link=external_link, href=href, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'NavbarBrand',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'external_link', 'href', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNavbarSimple <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, brand=NULL, brand_href=NULL, brand_style=NULL, brand_external_link=NULL, fluid=NULL, links_left=NULL, light=NULL, dark=NULL, fixed=NULL, sticky=NULL, color=NULL, expand=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, brand=brand, brand_href=brand_href, brand_style=brand_style, brand_external_link=brand_external_link, fluid=fluid, links_left=links_left, light=light, dark=dark, fixed=fixed, sticky=sticky, color=color, expand=expand, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'NavbarSimple',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'brand', 'brand_href', 'brand_style', 'brand_external_link', 'fluid', 'links_left', 'light', 'dark', 'fixed', 'sticky', 'color', 'expand', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcNavbarToggler <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, type=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, type=type, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'NavbarToggler',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'type', 'n_clicks', 'n_clicks_timestamp', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcOffcanvas <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, labelledby=NULL, labelledBy=NULL, backdrop=NULL, backdrop_class_name=NULL, backdropClassName=NULL, keyboard=NULL, is_open=NULL, placement=NULL, scrollable=NULL, autofocus=NULL, autoFocus=NULL, title=NULL, close_button=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, labelledby=labelledby, labelledBy=labelledBy, backdrop=backdrop, backdrop_class_name=backdrop_class_name, backdropClassName=backdropClassName, keyboard=keyboard, is_open=is_open, placement=placement, scrollable=scrollable, autofocus=autofocus, autoFocus=autoFocus, title=title, close_button=close_button, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Offcanvas',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'labelledby', 'labelledBy', 'backdrop', 'backdrop_class_name', 'backdropClassName', 'keyboard', 'is_open', 'placement', 'scrollable', 'autofocus', 'autoFocus', 'title', 'close_button', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcPagination <- function(id=NULL, class_name=NULL, className=NULL, style=NULL, size=NULL, min_value=NULL, max_value=NULL, step=NULL, active_page=NULL, fully_expanded=NULL, previous_next=NULL, first_last=NULL, loading_state=NULL) {

    props <- list(id=id, class_name=class_name, className=className, style=style, size=size, min_value=min_value, max_value=max_value, step=step, active_page=active_page, fully_expanded=fully_expanded, previous_next=previous_next, first_last=first_last, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Pagination',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'class_name', 'className', 'style', 'size', 'min_value', 'max_value', 'step', 'active_page', 'fully_expanded', 'previous_next', 'first_last', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcPopover <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, placement=NULL, target=NULL, trigger=NULL, is_open=NULL, hide_arrow=NULL, inner_class_name=NULL, innerClassName=NULL, delay=NULL, offset=NULL, flip=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, placement=placement, target=target, trigger=trigger, is_open=is_open, hide_arrow=hide_arrow, inner_class_name=inner_class_name, innerClassName=innerClassName, delay=delay, offset=offset, flip=flip, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Popover',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'placement', 'target', 'trigger', 'is_open', 'hide_arrow', 'inner_class_name', 'innerClassName', 'delay', 'offset', 'flip', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcPopoverBody <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'PopoverBody',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcPopoverHeader <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, tag=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, tag=tag, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'PopoverHeader',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'tag', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcProgress <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, bar=NULL, min=NULL, max=NULL, value=NULL, label=NULL, hide_label=NULL, animated=NULL, striped=NULL, color=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, bar=bar, min=min, max=max, value=value, label=label, hide_label=hide_label, animated=animated, striped=striped, color=color, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Progress',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'bar', 'min', 'max', 'value', 'label', 'hide_label', 'animated', 'striped', 'color', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcRadioButton <- function(id=NULL, class_name=NULL, className=NULL, style=NULL, input_style=NULL, inputStyle=NULL, input_class_name=NULL, inputClassName=NULL, label=NULL, label_id=NULL, label_style=NULL, labelStyle=NULL, label_class_name=NULL, labelClassName=NULL, name=NULL, value=NULL, disabled=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {

    props <- list(id=id, class_name=class_name, className=className, style=style, input_style=input_style, inputStyle=inputStyle, input_class_name=input_class_name, inputClassName=inputClassName, label=label, label_id=label_id, label_style=label_style, labelStyle=labelStyle, label_class_name=label_class_name, labelClassName=labelClassName, name=name, value=value, disabled=disabled, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RadioButton',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'class_name', 'className', 'style', 'input_style', 'inputStyle', 'input_class_name', 'inputClassName', 'label', 'label_id', 'label_style', 'labelStyle', 'label_class_name', 'labelClassName', 'name', 'value', 'disabled', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcRadioItems <- function(id=NULL, key=NULL, options=NULL, value=NULL, style=NULL, class_name=NULL, className=NULL, input_style=NULL, inputStyle=NULL, input_checked_style=NULL, inputCheckedStyle=NULL, input_class_name=NULL, inputClassName=NULL, input_checked_class_name=NULL, inputCheckedClassName=NULL, label_style=NULL, labelStyle=NULL, label_checked_style=NULL, labelCheckedStyle=NULL, label_class_name=NULL, labelClassName=NULL, label_checked_class_name=NULL, labelCheckedClassName=NULL, inline=NULL, switch=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL, name=NULL) {

    props <- list(id=id, key=key, options=options, value=value, style=style, class_name=class_name, className=className, input_style=input_style, inputStyle=inputStyle, input_checked_style=input_checked_style, inputCheckedStyle=inputCheckedStyle, input_class_name=input_class_name, inputClassName=inputClassName, input_checked_class_name=input_checked_class_name, inputCheckedClassName=inputCheckedClassName, label_style=label_style, labelStyle=labelStyle, label_checked_style=label_checked_style, labelCheckedStyle=labelCheckedStyle, label_class_name=label_class_name, labelClassName=labelClassName, label_checked_class_name=label_checked_class_name, labelCheckedClassName=labelCheckedClassName, inline=inline, switch=switch, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type, name=name)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RadioItems',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'key', 'options', 'value', 'style', 'class_name', 'className', 'input_style', 'inputStyle', 'input_checked_style', 'inputCheckedStyle', 'input_class_name', 'inputClassName', 'input_checked_class_name', 'inputCheckedClassName', 'label_style', 'labelStyle', 'label_checked_style', 'labelCheckedStyle', 'label_class_name', 'labelClassName', 'label_checked_class_name', 'labelCheckedClassName', 'inline', 'switch', 'loading_state', 'persistence', 'persisted_props', 'persistence_type', 'name'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcRow <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, align=NULL, justify=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, align=align, justify=justify, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Row',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'align', 'justify', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcSelect <- function(id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, placeholder=NULL, value=NULL, options=NULL, disabled=NULL, required=NULL, valid=NULL, invalid=NULL, size=NULL, html_size=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL, name=NULL) {

    props <- list(id=id, style=style, class_name=class_name, className=className, key=key, placeholder=placeholder, value=value, options=options, disabled=disabled, required=required, valid=valid, invalid=invalid, size=size, html_size=html_size, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type, name=name)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Select',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'style', 'class_name', 'className', 'key', 'placeholder', 'value', 'options', 'disabled', 'required', 'valid', 'invalid', 'size', 'html_size', 'persistence', 'persisted_props', 'persistence_type', 'name'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcSpinner <- function(children=NULL, id=NULL, fullscreen_style=NULL, spinner_style=NULL, fullscreen_class_name=NULL, fullscreenClassName=NULL, spinner_class_name=NULL, spinnerClassName=NULL, color=NULL, type=NULL, size=NULL, fullscreen=NULL, delay_hide=NULL, delay_show=NULL, show_initially=NULL) {

    props <- list(children=children, id=id, fullscreen_style=fullscreen_style, spinner_style=spinner_style, fullscreen_class_name=fullscreen_class_name, fullscreenClassName=fullscreenClassName, spinner_class_name=spinner_class_name, spinnerClassName=spinnerClassName, color=color, type=type, size=size, fullscreen=fullscreen, delay_hide=delay_hide, delay_show=delay_show, show_initially=show_initially)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Spinner',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'fullscreen_style', 'spinner_style', 'fullscreen_class_name', 'fullscreenClassName', 'spinner_class_name', 'spinnerClassName', 'color', 'type', 'size', 'fullscreen', 'delay_hide', 'delay_show', 'show_initially'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcSwitch <- function(id=NULL, class_name=NULL, className=NULL, style=NULL, input_style=NULL, inputStyle=NULL, input_class_name=NULL, inputClassName=NULL, label=NULL, label_id=NULL, label_style=NULL, labelStyle=NULL, label_class_name=NULL, labelClassName=NULL, name=NULL, value=NULL, disabled=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {

    props <- list(id=id, class_name=class_name, className=className, style=style, input_style=input_style, inputStyle=inputStyle, input_class_name=input_class_name, inputClassName=inputClassName, label=label, label_id=label_id, label_style=label_style, labelStyle=labelStyle, label_class_name=label_class_name, labelClassName=labelClassName, name=name, value=value, disabled=disabled, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Switch',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'class_name', 'className', 'style', 'input_style', 'inputStyle', 'input_class_name', 'inputClassName', 'label', 'label_id', 'label_style', 'labelStyle', 'label_class_name', 'labelClassName', 'name', 'value', 'disabled', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcTab <- function(children=NULL, id=NULL, style=NULL, tab_style=NULL, active_tab_style=NULL, label_style=NULL, active_label_style=NULL, class_name=NULL, className=NULL, tab_class_name=NULL, tabClassName=NULL, active_tab_class_name=NULL, activeTabClassName=NULL, label_class_name=NULL, labelClassName=NULL, active_label_class_name=NULL, activeLabelClassName=NULL, key=NULL, label=NULL, tab_id=NULL, disabled=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, tab_style=tab_style, active_tab_style=active_tab_style, label_style=label_style, active_label_style=active_label_style, class_name=class_name, className=className, tab_class_name=tab_class_name, tabClassName=tabClassName, active_tab_class_name=active_tab_class_name, activeTabClassName=activeTabClassName, label_class_name=label_class_name, labelClassName=labelClassName, active_label_class_name=active_label_class_name, activeLabelClassName=activeLabelClassName, key=key, label=label, tab_id=tab_id, disabled=disabled, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tab',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'tab_style', 'active_tab_style', 'label_style', 'active_label_style', 'class_name', 'className', 'tab_class_name', 'tabClassName', 'active_tab_class_name', 'activeTabClassName', 'label_class_name', 'labelClassName', 'active_label_class_name', 'activeLabelClassName', 'key', 'label', 'tab_id', 'disabled', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcTable <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, size=NULL, bordered=NULL, borderless=NULL, striped=NULL, color=NULL, dark=NULL, hover=NULL, responsive=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, size=size, bordered=bordered, borderless=borderless, striped=striped, color=color, dark=dark, hover=hover, responsive=responsive, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Table',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'size', 'bordered', 'borderless', 'striped', 'color', 'dark', 'hover', 'responsive', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcTabs <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, active_tab=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, active_tab=active_tab, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tabs',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'active_tab', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcTextarea <- function(id=NULL, key=NULL, value=NULL, autofocus=NULL, autoFocus=NULL, cols=NULL, disabled=NULL, form=NULL, maxlength=NULL, maxLength=NULL, minlength=NULL, minLength=NULL, name=NULL, placeholder=NULL, readonly=NULL, readOnly=NULL, required=NULL, rows=NULL, wrap=NULL, accesskey=NULL, accessKey=NULL, class_name=NULL, className=NULL, contenteditable=NULL, contentEditable=NULL, contextmenu=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, hidden=NULL, lang=NULL, spellcheck=NULL, spellCheck=NULL, style=NULL, tabindex=NULL, tabIndex=NULL, title=NULL, size=NULL, valid=NULL, invalid=NULL, n_blur=NULL, n_blur_timestamp=NULL, n_submit=NULL, n_submit_timestamp=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, debounce=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {

    props <- list(id=id, key=key, value=value, autofocus=autofocus, autoFocus=autoFocus, cols=cols, disabled=disabled, form=form, maxlength=maxlength, maxLength=maxLength, minlength=minlength, minLength=minLength, name=name, placeholder=placeholder, readonly=readonly, readOnly=readOnly, required=required, rows=rows, wrap=wrap, accesskey=accesskey, accessKey=accessKey, class_name=class_name, className=className, contenteditable=contenteditable, contentEditable=contentEditable, contextmenu=contextmenu, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellcheck=spellcheck, spellCheck=spellCheck, style=style, tabindex=tabindex, tabIndex=tabIndex, title=title, size=size, valid=valid, invalid=invalid, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, n_submit=n_submit, n_submit_timestamp=n_submit_timestamp, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, debounce=debounce, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Textarea',
        namespace = 'dash_bootstrap_components',
        propNames = c('id', 'key', 'value', 'autofocus', 'autoFocus', 'cols', 'disabled', 'form', 'maxlength', 'maxLength', 'minlength', 'minLength', 'name', 'placeholder', 'readonly', 'readOnly', 'required', 'rows', 'wrap', 'accesskey', 'accessKey', 'class_name', 'className', 'contenteditable', 'contentEditable', 'contextmenu', 'contextMenu', 'dir', 'draggable', 'hidden', 'lang', 'spellcheck', 'spellCheck', 'style', 'tabindex', 'tabIndex', 'title', 'size', 'valid', 'invalid', 'n_blur', 'n_blur_timestamp', 'n_submit', 'n_submit_timestamp', 'n_clicks', 'n_clicks_timestamp', 'debounce', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcToast <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, header_style=NULL, header_class_name=NULL, headerClassName=NULL, body_style=NULL, body_class_name=NULL, bodyClassName=NULL, tag=NULL, is_open=NULL, key=NULL, header=NULL, dismissable=NULL, duration=NULL, n_dismiss=NULL, n_dismiss_timestamp=NULL, icon=NULL, color=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, header_style=header_style, header_class_name=header_class_name, headerClassName=headerClassName, body_style=body_style, body_class_name=body_class_name, bodyClassName=bodyClassName, tag=tag, is_open=is_open, key=key, header=header, dismissable=dismissable, duration=duration, n_dismiss=n_dismiss, n_dismiss_timestamp=n_dismiss_timestamp, icon=icon, color=color, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Toast',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'header_style', 'header_class_name', 'headerClassName', 'body_style', 'body_class_name', 'bodyClassName', 'tag', 'is_open', 'key', 'header', 'dismissable', 'duration', 'n_dismiss', 'n_dismiss_timestamp', 'icon', 'color', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dbcTooltip <- function(children=NULL, id=NULL, style=NULL, class_name=NULL, className=NULL, key=NULL, target=NULL, placement=NULL, flip=NULL, delay=NULL, loading_state=NULL) {

    props <- list(children=children, id=id, style=style, class_name=class_name, className=className, key=key, target=target, placement=placement, flip=flip, delay=delay, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tooltip',
        namespace = 'dash_bootstrap_components',
        propNames = c('children', 'id', 'style', 'class_name', 'className', 'key', 'target', 'placement', 'flip', 'delay', 'loading_state'),
        package = 'dashBootstrapComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

#' dbcIcons
#' @description
#' A list of contextually colored icon styles that can be added to Dash Bootstrap Components.
#' @export
dbcIcons <- list(
  BOOTSTRAP = "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css",
  FONT_AWESOME = "https://use.fontawesome.com/releases/v5.15.4/css/all.css"
)

.prependBootswatch <- function(suffix) {
  BOOTSWATCH_BASE <- "https://cdn.jsdelivr.net/npm/bootswatch@5.1.0/dist/"
  return(paste(BOOTSWATCH_BASE, suffix, sep=""))
}

#' dbcThemes
#' @description
#' Externally hosted themes that can be passed to the Dash app with `app %>% add_stylesheet()`.
#' @export
dbcThemes <- list(
  BOOTSTRAP = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css",
  GRID = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap-grid.min.css",
  CERULEAN = .prependBootswatch("cerulean/bootstrap.min.css"),
  COSMO = .prependBootswatch("cosmo/bootstrap.min.css"),
  CYBORG = .prependBootswatch("cyborg/bootstrap.min.css"),
  DARKLY = .prependBootswatch("darkly/bootstrap.min.css"),
  FLATLY = .prependBootswatch("flatly/bootstrap.min.css"),
  JOURNAL = .prependBootswatch("journal/bootstrap.min.css"),
  LITERA = .prependBootswatch("litera/bootstrap.min.css"),
  LUMEN = .prependBootswatch("lumen/bootstrap.min.css"),
  LUX = .prependBootswatch("lux/bootstrap.min.css"),
  MATERIA = .prependBootswatch("materia/bootstrap.min.css"),
  MINTY = .prependBootswatch("minty/bootstrap.min.css"),
  MORPH = .prependBootswatch("morph/bootstrap.min.css"),
  PULSE = .prependBootswatch("pulse/bootstrap.min.css"),
  QUARTZ = .prependBootswatch("quartz/bootstrap.min.css"),
  SANDSTONE = .prependBootswatch("sandstone/bootstrap.min.css"),
  SIMPLEX = .prependBootswatch("simplex/bootstrap.min.css"),
  SKETCHY = .prependBootswatch("sketchy/bootstrap.min.css"),
  SLATE = .prependBootswatch("slate/bootstrap.min.css"),
  SOLAR = .prependBootswatch("solar/bootstrap.min.css"),
  SPACELAB = .prependBootswatch("spacelab/bootstrap.min.css"),
  SUPERHERO = .prependBootswatch("superhero/bootstrap.min.css"),
  UNITED = .prependBootswatch("united/bootstrap.min.css"),
  VAPOR = .prependBootswatch("vapor/bootstrap.min.css"),
  YETI = .prependBootswatch("yeti/bootstrap.min.css"),
  ZEPHYR = .prependBootswatch("zephyr/bootstrap.min.css")
)
