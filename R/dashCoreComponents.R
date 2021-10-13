# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccChecklist <- function(id=NULL, options=NULL, value=NULL, className=NULL, style=NULL, inputStyle=NULL, inputClassName=NULL, labelStyle=NULL, labelClassName=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL, inline=NULL) {
    
    props <- list(id=id, options=options, value=value, className=className, style=style, inputStyle=inputStyle, inputClassName=inputClassName, labelStyle=labelStyle, labelClassName=labelClassName, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type, inline=inline)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Checklist',
        namespace = 'dash_core_components',
        propNames = c('id', 'options', 'value', 'className', 'style', 'inputStyle', 'inputClassName', 'labelStyle', 'labelClassName', 'loading_state', 'persistence', 'persisted_props', 'persistence_type', 'inline'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccClipboard <- function(id=NULL, target_id=NULL, content=NULL, n_clicks=NULL, title=NULL, style=NULL, className=NULL, loading_state=NULL) {
    
    props <- list(id=id, target_id=target_id, content=content, n_clicks=n_clicks, title=title, style=style, className=className, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Clipboard',
        namespace = 'dash_core_components',
        propNames = c('id', 'target_id', 'content', 'n_clicks', 'title', 'style', 'className', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccConfirmDialog <- function(id=NULL, message=NULL, submit_n_clicks=NULL, submit_n_clicks_timestamp=NULL, cancel_n_clicks=NULL, cancel_n_clicks_timestamp=NULL, displayed=NULL) {
    
    props <- list(id=id, message=message, submit_n_clicks=submit_n_clicks, submit_n_clicks_timestamp=submit_n_clicks_timestamp, cancel_n_clicks=cancel_n_clicks, cancel_n_clicks_timestamp=cancel_n_clicks_timestamp, displayed=displayed)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ConfirmDialog',
        namespace = 'dash_core_components',
        propNames = c('id', 'message', 'submit_n_clicks', 'submit_n_clicks_timestamp', 'cancel_n_clicks', 'cancel_n_clicks_timestamp', 'displayed'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccConfirmDialogProvider <- function(children=NULL, id=NULL, message=NULL, submit_n_clicks=NULL, submit_n_clicks_timestamp=NULL, cancel_n_clicks=NULL, cancel_n_clicks_timestamp=NULL, displayed=NULL, loading_state=NULL) {
    
    props <- list(children=children, id=id, message=message, submit_n_clicks=submit_n_clicks, submit_n_clicks_timestamp=submit_n_clicks_timestamp, cancel_n_clicks=cancel_n_clicks, cancel_n_clicks_timestamp=cancel_n_clicks_timestamp, displayed=displayed, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ConfirmDialogProvider',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'message', 'submit_n_clicks', 'submit_n_clicks_timestamp', 'cancel_n_clicks', 'cancel_n_clicks_timestamp', 'displayed', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDatePickerRange <- function(id=NULL, start_date=NULL, start_date_id=NULL, end_date_id=NULL, end_date=NULL, min_date_allowed=NULL, max_date_allowed=NULL, disabled_days=NULL, initial_visible_month=NULL, start_date_placeholder_text=NULL, end_date_placeholder_text=NULL, day_size=NULL, calendar_orientation=NULL, is_RTL=NULL, reopen_calendar_on_clear=NULL, number_of_months_shown=NULL, with_portal=NULL, with_full_screen_portal=NULL, first_day_of_week=NULL, minimum_nights=NULL, stay_open_on_select=NULL, show_outside_days=NULL, month_format=NULL, display_format=NULL, disabled=NULL, clearable=NULL, style=NULL, className=NULL, updatemode=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, start_date=start_date, start_date_id=start_date_id, end_date_id=end_date_id, end_date=end_date, min_date_allowed=min_date_allowed, max_date_allowed=max_date_allowed, disabled_days=disabled_days, initial_visible_month=initial_visible_month, start_date_placeholder_text=start_date_placeholder_text, end_date_placeholder_text=end_date_placeholder_text, day_size=day_size, calendar_orientation=calendar_orientation, is_RTL=is_RTL, reopen_calendar_on_clear=reopen_calendar_on_clear, number_of_months_shown=number_of_months_shown, with_portal=with_portal, with_full_screen_portal=with_full_screen_portal, first_day_of_week=first_day_of_week, minimum_nights=minimum_nights, stay_open_on_select=stay_open_on_select, show_outside_days=show_outside_days, month_format=month_format, display_format=display_format, disabled=disabled, clearable=clearable, style=style, className=className, updatemode=updatemode, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DatePickerRange',
        namespace = 'dash_core_components',
        propNames = c('id', 'start_date', 'start_date_id', 'end_date_id', 'end_date', 'min_date_allowed', 'max_date_allowed', 'disabled_days', 'initial_visible_month', 'start_date_placeholder_text', 'end_date_placeholder_text', 'day_size', 'calendar_orientation', 'is_RTL', 'reopen_calendar_on_clear', 'number_of_months_shown', 'with_portal', 'with_full_screen_portal', 'first_day_of_week', 'minimum_nights', 'stay_open_on_select', 'show_outside_days', 'month_format', 'display_format', 'disabled', 'clearable', 'style', 'className', 'updatemode', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDatePickerSingle <- function(id=NULL, date=NULL, min_date_allowed=NULL, max_date_allowed=NULL, disabled_days=NULL, initial_visible_month=NULL, day_size=NULL, calendar_orientation=NULL, is_RTL=NULL, placeholder=NULL, reopen_calendar_on_clear=NULL, number_of_months_shown=NULL, with_portal=NULL, with_full_screen_portal=NULL, first_day_of_week=NULL, stay_open_on_select=NULL, show_outside_days=NULL, month_format=NULL, display_format=NULL, disabled=NULL, clearable=NULL, style=NULL, className=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, date=date, min_date_allowed=min_date_allowed, max_date_allowed=max_date_allowed, disabled_days=disabled_days, initial_visible_month=initial_visible_month, day_size=day_size, calendar_orientation=calendar_orientation, is_RTL=is_RTL, placeholder=placeholder, reopen_calendar_on_clear=reopen_calendar_on_clear, number_of_months_shown=number_of_months_shown, with_portal=with_portal, with_full_screen_portal=with_full_screen_portal, first_day_of_week=first_day_of_week, stay_open_on_select=stay_open_on_select, show_outside_days=show_outside_days, month_format=month_format, display_format=display_format, disabled=disabled, clearable=clearable, style=style, className=className, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DatePickerSingle',
        namespace = 'dash_core_components',
        propNames = c('id', 'date', 'min_date_allowed', 'max_date_allowed', 'disabled_days', 'initial_visible_month', 'day_size', 'calendar_orientation', 'is_RTL', 'placeholder', 'reopen_calendar_on_clear', 'number_of_months_shown', 'with_portal', 'with_full_screen_portal', 'first_day_of_week', 'stay_open_on_select', 'show_outside_days', 'month_format', 'display_format', 'disabled', 'clearable', 'style', 'className', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDownload <- function(id=NULL, data=NULL, base64=NULL, type=NULL) {
    
    props <- list(id=id, data=data, base64=base64, type=type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Download',
        namespace = 'dash_core_components',
        propNames = c('id', 'data', 'base64', 'type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDropdown <- function(id=NULL, options=NULL, value=NULL, optionHeight=NULL, className=NULL, clearable=NULL, disabled=NULL, multi=NULL, placeholder=NULL, searchable=NULL, search_value=NULL, style=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, options=options, value=value, optionHeight=optionHeight, className=className, clearable=clearable, disabled=disabled, multi=multi, placeholder=placeholder, searchable=searchable, search_value=search_value, style=style, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Dropdown',
        namespace = 'dash_core_components',
        propNames = c('id', 'options', 'value', 'optionHeight', 'className', 'clearable', 'disabled', 'multi', 'placeholder', 'searchable', 'search_value', 'style', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccGraph <- function(id=NULL, responsive=NULL, clickData=NULL, clickAnnotationData=NULL, hoverData=NULL, clear_on_unhover=NULL, selectedData=NULL, relayoutData=NULL, extendData=NULL, prependData=NULL, restyleData=NULL, figure=NULL, style=NULL, className=NULL, animate=NULL, animation_options=NULL, config=NULL, loading_state=NULL) {
    
    props <- list(id=id, responsive=responsive, clickData=clickData, clickAnnotationData=clickAnnotationData, hoverData=hoverData, clear_on_unhover=clear_on_unhover, selectedData=selectedData, relayoutData=relayoutData, extendData=extendData, prependData=prependData, restyleData=restyleData, figure=figure, style=style, className=className, animate=animate, animation_options=animation_options, config=config, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Graph',
        namespace = 'dash_core_components',
        propNames = c('id', 'responsive', 'clickData', 'clickAnnotationData', 'hoverData', 'clear_on_unhover', 'selectedData', 'relayoutData', 'extendData', 'prependData', 'restyleData', 'figure', 'style', 'className', 'animate', 'animation_options', 'config', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccInput <- function(id=NULL, value=NULL, style=NULL, className=NULL, debounce=NULL, type=NULL, autoComplete=NULL, autoFocus=NULL, disabled=NULL, inputMode=NULL, list=NULL, max=NULL, maxLength=NULL, min=NULL, minLength=NULL, multiple=NULL, name=NULL, pattern=NULL, placeholder=NULL, readOnly=NULL, required=NULL, selectionDirection=NULL, selectionEnd=NULL, selectionStart=NULL, size=NULL, spellCheck=NULL, step=NULL, n_submit=NULL, n_submit_timestamp=NULL, n_blur=NULL, n_blur_timestamp=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, value=value, style=style, className=className, debounce=debounce, type=type, autoComplete=autoComplete, autoFocus=autoFocus, disabled=disabled, inputMode=inputMode, list=list, max=max, maxLength=maxLength, min=min, minLength=minLength, multiple=multiple, name=name, pattern=pattern, placeholder=placeholder, readOnly=readOnly, required=required, selectionDirection=selectionDirection, selectionEnd=selectionEnd, selectionStart=selectionStart, size=size, spellCheck=spellCheck, step=step, n_submit=n_submit, n_submit_timestamp=n_submit_timestamp, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Input',
        namespace = 'dash_core_components',
        propNames = c('id', 'value', 'style', 'className', 'debounce', 'type', 'autoComplete', 'autoFocus', 'disabled', 'inputMode', 'list', 'max', 'maxLength', 'min', 'minLength', 'multiple', 'name', 'pattern', 'placeholder', 'readOnly', 'required', 'selectionDirection', 'selectionEnd', 'selectionStart', 'size', 'spellCheck', 'step', 'n_submit', 'n_submit_timestamp', 'n_blur', 'n_blur_timestamp', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccInterval <- function(id=NULL, interval=NULL, disabled=NULL, n_intervals=NULL, max_intervals=NULL) {
    
    props <- list(id=id, interval=interval, disabled=disabled, n_intervals=n_intervals, max_intervals=max_intervals)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Interval',
        namespace = 'dash_core_components',
        propNames = c('id', 'interval', 'disabled', 'n_intervals', 'max_intervals'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLink <- function(children=NULL, id=NULL, href=NULL, refresh=NULL, className=NULL, style=NULL, title=NULL, target=NULL, loading_state=NULL) {
    
    props <- list(children=children, id=id, href=href, refresh=refresh, className=className, style=style, title=title, target=target, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Link',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'href', 'refresh', 'className', 'style', 'title', 'target', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLoading <- function(children=NULL, id=NULL, type=NULL, fullscreen=NULL, debug=NULL, className=NULL, parent_className=NULL, style=NULL, parent_style=NULL, color=NULL, loading_state=NULL) {
    
    props <- list(children=children, id=id, type=type, fullscreen=fullscreen, debug=debug, className=className, parent_className=parent_className, style=style, parent_style=parent_style, color=color, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Loading',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'type', 'fullscreen', 'debug', 'className', 'parent_className', 'style', 'parent_style', 'color', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLocation <- function(id=NULL, pathname=NULL, search=NULL, hash=NULL, href=NULL, refresh=NULL) {
    
    props <- list(id=id, pathname=pathname, search=search, hash=hash, href=href, refresh=refresh)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Location',
        namespace = 'dash_core_components',
        propNames = c('id', 'pathname', 'search', 'hash', 'href', 'refresh'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLogoutButton <- function(id=NULL, label=NULL, logout_url=NULL, style=NULL, method=NULL, className=NULL, loading_state=NULL) {
    
    props <- list(id=id, label=label, logout_url=logout_url, style=style, method=method, className=className, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'LogoutButton',
        namespace = 'dash_core_components',
        propNames = c('id', 'label', 'logout_url', 'style', 'method', 'className', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccMarkdown <- function(children=NULL, id=NULL, className=NULL, dangerously_allow_html=NULL, dedent=NULL, highlight_config=NULL, loading_state=NULL, style=NULL) {
    
    props <- list(children=children, id=id, className=className, dangerously_allow_html=dangerously_allow_html, dedent=dedent, highlight_config=highlight_config, loading_state=loading_state, style=style)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Markdown',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'dangerously_allow_html', 'dedent', 'highlight_config', 'loading_state', 'style'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccRadioItems <- function(id=NULL, options=NULL, value=NULL, style=NULL, className=NULL, inputStyle=NULL, inputClassName=NULL, labelStyle=NULL, labelClassName=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL, inline=NULL) {
    
    props <- list(id=id, options=options, value=value, style=style, className=className, inputStyle=inputStyle, inputClassName=inputClassName, labelStyle=labelStyle, labelClassName=labelClassName, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type, inline=inline)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RadioItems',
        namespace = 'dash_core_components',
        propNames = c('id', 'options', 'value', 'style', 'className', 'inputStyle', 'inputClassName', 'labelStyle', 'labelClassName', 'loading_state', 'persistence', 'persisted_props', 'persistence_type', 'inline'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccRangeSlider <- function(id=NULL, min=NULL, max=NULL, step=NULL, marks=NULL, value=NULL, drag_value=NULL, allowCross=NULL, className=NULL, count=NULL, disabled=NULL, dots=NULL, included=NULL, pushable=NULL, tooltip=NULL, vertical=NULL, verticalHeight=NULL, updatemode=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, min=min, max=max, step=step, marks=marks, value=value, drag_value=drag_value, allowCross=allowCross, className=className, count=count, disabled=disabled, dots=dots, included=included, pushable=pushable, tooltip=tooltip, vertical=vertical, verticalHeight=verticalHeight, updatemode=updatemode, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RangeSlider',
        namespace = 'dash_core_components',
        propNames = c('id', 'min', 'max', 'step', 'marks', 'value', 'drag_value', 'allowCross', 'className', 'count', 'disabled', 'dots', 'included', 'pushable', 'tooltip', 'vertical', 'verticalHeight', 'updatemode', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccSlider <- function(id=NULL, min=NULL, max=NULL, step=NULL, marks=NULL, value=NULL, drag_value=NULL, className=NULL, disabled=NULL, dots=NULL, included=NULL, tooltip=NULL, vertical=NULL, verticalHeight=NULL, updatemode=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, min=min, max=max, step=step, marks=marks, value=value, drag_value=drag_value, className=className, disabled=disabled, dots=dots, included=included, tooltip=tooltip, vertical=vertical, verticalHeight=verticalHeight, updatemode=updatemode, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Slider',
        namespace = 'dash_core_components',
        propNames = c('id', 'min', 'max', 'step', 'marks', 'value', 'drag_value', 'className', 'disabled', 'dots', 'included', 'tooltip', 'vertical', 'verticalHeight', 'updatemode', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccStore <- function(id=NULL, storage_type=NULL, data=NULL, clear_data=NULL, modified_timestamp=NULL) {
    
    props <- list(id=id, storage_type=storage_type, data=data, clear_data=clear_data, modified_timestamp=modified_timestamp)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Store',
        namespace = 'dash_core_components',
        propNames = c('id', 'storage_type', 'data', 'clear_data', 'modified_timestamp'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTab <- function(children=NULL, id=NULL, label=NULL, value=NULL, disabled=NULL, disabled_style=NULL, disabled_className=NULL, className=NULL, selected_className=NULL, style=NULL, selected_style=NULL, loading_state=NULL) {
    
    props <- list(children=children, id=id, label=label, value=value, disabled=disabled, disabled_style=disabled_style, disabled_className=disabled_className, className=className, selected_className=selected_className, style=style, selected_style=selected_style, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tab',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'label', 'value', 'disabled', 'disabled_style', 'disabled_className', 'className', 'selected_className', 'style', 'selected_style', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTabs <- function(children=NULL, id=NULL, value=NULL, className=NULL, content_className=NULL, parent_className=NULL, style=NULL, parent_style=NULL, content_style=NULL, vertical=NULL, mobile_breakpoint=NULL, colors=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(children=children, id=id, value=value, className=className, content_className=content_className, parent_className=parent_className, style=style, parent_style=parent_style, content_style=content_style, vertical=vertical, mobile_breakpoint=mobile_breakpoint, colors=colors, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tabs',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'value', 'className', 'content_className', 'parent_className', 'style', 'parent_style', 'content_style', 'vertical', 'mobile_breakpoint', 'colors', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTextarea <- function(id=NULL, value=NULL, autoFocus=NULL, cols=NULL, disabled=NULL, form=NULL, maxLength=NULL, minLength=NULL, name=NULL, placeholder=NULL, readOnly=NULL, required=NULL, rows=NULL, wrap=NULL, accessKey=NULL, className=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, draggable=NULL, hidden=NULL, lang=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, n_blur=NULL, n_blur_timestamp=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, loading_state=NULL, persistence=NULL, persisted_props=NULL, persistence_type=NULL) {
    
    props <- list(id=id, value=value, autoFocus=autoFocus, cols=cols, disabled=disabled, form=form, maxLength=maxLength, minLength=minLength, name=name, placeholder=placeholder, readOnly=readOnly, required=required, rows=rows, wrap=wrap, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, loading_state=loading_state, persistence=persistence, persisted_props=persisted_props, persistence_type=persistence_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Textarea',
        namespace = 'dash_core_components',
        propNames = c('id', 'value', 'autoFocus', 'cols', 'disabled', 'form', 'maxLength', 'minLength', 'name', 'placeholder', 'readOnly', 'required', 'rows', 'wrap', 'accessKey', 'className', 'contentEditable', 'contextMenu', 'dir', 'draggable', 'hidden', 'lang', 'spellCheck', 'style', 'tabIndex', 'title', 'n_blur', 'n_blur_timestamp', 'n_clicks', 'n_clicks_timestamp', 'loading_state', 'persistence', 'persisted_props', 'persistence_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTooltip <- function(children=NULL, id=NULL, className=NULL, style=NULL, bbox=NULL, show=NULL, direction=NULL, border_color=NULL, background_color=NULL, loading_text=NULL, zindex=NULL, targetable=NULL, loading_state=NULL) {
    
    props <- list(children=children, id=id, className=className, style=style, bbox=bbox, show=show, direction=direction, border_color=border_color, background_color=background_color, loading_text=loading_text, zindex=zindex, targetable=targetable, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tooltip',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'style', 'bbox', 'show', 'direction', 'border_color', 'background_color', 'loading_text', 'zindex', 'targetable', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccUpload <- function(children=NULL, id=NULL, contents=NULL, filename=NULL, last_modified=NULL, accept=NULL, disabled=NULL, disable_click=NULL, max_size=NULL, min_size=NULL, multiple=NULL, className=NULL, className_active=NULL, className_reject=NULL, className_disabled=NULL, style=NULL, style_active=NULL, style_reject=NULL, style_disabled=NULL, loading_state=NULL) {
    
    props <- list(children=children, id=id, contents=contents, filename=filename, last_modified=last_modified, accept=accept, disabled=disabled, disable_click=disable_click, max_size=max_size, min_size=min_size, multiple=multiple, className=className, className_active=className_active, className_reject=className_reject, className_disabled=className_disabled, style=style, style_active=style_active, style_reject=style_reject, style_disabled=style_disabled, loading_state=loading_state)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Upload',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'contents', 'filename', 'last_modified', 'accept', 'disabled', 'disable_click', 'max_size', 'min_size', 'multiple', 'className', 'className_active', 'className_reject', 'className_disabled', 'style', 'style_active', 'style_reject', 'style_disabled', 'loading_state'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
