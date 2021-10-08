# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccChecklist <- function(id=NULL, className=NULL, inline=NULL, inputClassName=NULL, inputStyle=NULL, labelClassName=NULL, labelStyle=NULL, loading_state=NULL, options=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, style=NULL, value=NULL) {
    
    props <- list(id=id, className=className, inline=inline, inputClassName=inputClassName, inputStyle=inputStyle, labelClassName=labelClassName, labelStyle=labelStyle, loading_state=loading_state, options=options, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, style=style, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Checklist',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'inline', 'inputClassName', 'inputStyle', 'labelClassName', 'labelStyle', 'loading_state', 'options', 'persisted_props', 'persistence', 'persistence_type', 'style', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccClipboard <- function(id=NULL, className=NULL, content=NULL, loading_state=NULL, n_clicks=NULL, style=NULL, target_id=NULL, title=NULL) {
    
    props <- list(id=id, className=className, content=content, loading_state=loading_state, n_clicks=n_clicks, style=style, target_id=target_id, title=title)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Clipboard',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'content', 'loading_state', 'n_clicks', 'style', 'target_id', 'title'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccConfirmDialog <- function(id=NULL, cancel_n_clicks=NULL, cancel_n_clicks_timestamp=NULL, displayed=NULL, message=NULL, submit_n_clicks=NULL, submit_n_clicks_timestamp=NULL) {
    
    props <- list(id=id, cancel_n_clicks=cancel_n_clicks, cancel_n_clicks_timestamp=cancel_n_clicks_timestamp, displayed=displayed, message=message, submit_n_clicks=submit_n_clicks, submit_n_clicks_timestamp=submit_n_clicks_timestamp)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ConfirmDialog',
        namespace = 'dash_core_components',
        propNames = c('id', 'cancel_n_clicks', 'cancel_n_clicks_timestamp', 'displayed', 'message', 'submit_n_clicks', 'submit_n_clicks_timestamp'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccConfirmDialogProvider <- function(children=NULL, id=NULL, cancel_n_clicks=NULL, cancel_n_clicks_timestamp=NULL, displayed=NULL, loading_state=NULL, message=NULL, submit_n_clicks=NULL, submit_n_clicks_timestamp=NULL) {
    
    props <- list(children=children, id=id, cancel_n_clicks=cancel_n_clicks, cancel_n_clicks_timestamp=cancel_n_clicks_timestamp, displayed=displayed, loading_state=loading_state, message=message, submit_n_clicks=submit_n_clicks, submit_n_clicks_timestamp=submit_n_clicks_timestamp)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'ConfirmDialogProvider',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'cancel_n_clicks', 'cancel_n_clicks_timestamp', 'displayed', 'loading_state', 'message', 'submit_n_clicks', 'submit_n_clicks_timestamp'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDatePickerRange <- function(id=NULL, calendar_orientation=NULL, className=NULL, clearable=NULL, day_size=NULL, disabled=NULL, disabled_days=NULL, display_format=NULL, end_date=NULL, end_date_id=NULL, end_date_placeholder_text=NULL, first_day_of_week=NULL, initial_visible_month=NULL, is_RTL=NULL, loading_state=NULL, max_date_allowed=NULL, min_date_allowed=NULL, minimum_nights=NULL, month_format=NULL, number_of_months_shown=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, reopen_calendar_on_clear=NULL, show_outside_days=NULL, start_date=NULL, start_date_id=NULL, start_date_placeholder_text=NULL, stay_open_on_select=NULL, style=NULL, updatemode=NULL, with_full_screen_portal=NULL, with_portal=NULL) {
    
    props <- list(id=id, calendar_orientation=calendar_orientation, className=className, clearable=clearable, day_size=day_size, disabled=disabled, disabled_days=disabled_days, display_format=display_format, end_date=end_date, end_date_id=end_date_id, end_date_placeholder_text=end_date_placeholder_text, first_day_of_week=first_day_of_week, initial_visible_month=initial_visible_month, is_RTL=is_RTL, loading_state=loading_state, max_date_allowed=max_date_allowed, min_date_allowed=min_date_allowed, minimum_nights=minimum_nights, month_format=month_format, number_of_months_shown=number_of_months_shown, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, reopen_calendar_on_clear=reopen_calendar_on_clear, show_outside_days=show_outside_days, start_date=start_date, start_date_id=start_date_id, start_date_placeholder_text=start_date_placeholder_text, stay_open_on_select=stay_open_on_select, style=style, updatemode=updatemode, with_full_screen_portal=with_full_screen_portal, with_portal=with_portal)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DatePickerRange',
        namespace = 'dash_core_components',
        propNames = c('id', 'calendar_orientation', 'className', 'clearable', 'day_size', 'disabled', 'disabled_days', 'display_format', 'end_date', 'end_date_id', 'end_date_placeholder_text', 'first_day_of_week', 'initial_visible_month', 'is_RTL', 'loading_state', 'max_date_allowed', 'min_date_allowed', 'minimum_nights', 'month_format', 'number_of_months_shown', 'persisted_props', 'persistence', 'persistence_type', 'reopen_calendar_on_clear', 'show_outside_days', 'start_date', 'start_date_id', 'start_date_placeholder_text', 'stay_open_on_select', 'style', 'updatemode', 'with_full_screen_portal', 'with_portal'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDatePickerSingle <- function(id=NULL, calendar_orientation=NULL, className=NULL, clearable=NULL, date=NULL, day_size=NULL, disabled=NULL, disabled_days=NULL, display_format=NULL, first_day_of_week=NULL, initial_visible_month=NULL, is_RTL=NULL, loading_state=NULL, max_date_allowed=NULL, min_date_allowed=NULL, month_format=NULL, number_of_months_shown=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, placeholder=NULL, reopen_calendar_on_clear=NULL, show_outside_days=NULL, stay_open_on_select=NULL, style=NULL, with_full_screen_portal=NULL, with_portal=NULL) {
    
    props <- list(id=id, calendar_orientation=calendar_orientation, className=className, clearable=clearable, date=date, day_size=day_size, disabled=disabled, disabled_days=disabled_days, display_format=display_format, first_day_of_week=first_day_of_week, initial_visible_month=initial_visible_month, is_RTL=is_RTL, loading_state=loading_state, max_date_allowed=max_date_allowed, min_date_allowed=min_date_allowed, month_format=month_format, number_of_months_shown=number_of_months_shown, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, placeholder=placeholder, reopen_calendar_on_clear=reopen_calendar_on_clear, show_outside_days=show_outside_days, stay_open_on_select=stay_open_on_select, style=style, with_full_screen_portal=with_full_screen_portal, with_portal=with_portal)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DatePickerSingle',
        namespace = 'dash_core_components',
        propNames = c('id', 'calendar_orientation', 'className', 'clearable', 'date', 'day_size', 'disabled', 'disabled_days', 'display_format', 'first_day_of_week', 'initial_visible_month', 'is_RTL', 'loading_state', 'max_date_allowed', 'min_date_allowed', 'month_format', 'number_of_months_shown', 'persisted_props', 'persistence', 'persistence_type', 'placeholder', 'reopen_calendar_on_clear', 'show_outside_days', 'stay_open_on_select', 'style', 'with_full_screen_portal', 'with_portal'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDownload <- function(id=NULL, base64=NULL, data=NULL, type=NULL) {
    
    props <- list(id=id, base64=base64, data=data, type=type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Download',
        namespace = 'dash_core_components',
        propNames = c('id', 'base64', 'data', 'type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccDropdown <- function(id=NULL, className=NULL, clearable=NULL, disabled=NULL, loading_state=NULL, multi=NULL, optionHeight=NULL, options=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, placeholder=NULL, search_value=NULL, searchable=NULL, style=NULL, value=NULL) {
    
    props <- list(id=id, className=className, clearable=clearable, disabled=disabled, loading_state=loading_state, multi=multi, optionHeight=optionHeight, options=options, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, placeholder=placeholder, search_value=search_value, searchable=searchable, style=style, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Dropdown',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'clearable', 'disabled', 'loading_state', 'multi', 'optionHeight', 'options', 'persisted_props', 'persistence', 'persistence_type', 'placeholder', 'search_value', 'searchable', 'style', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccGraph <- function(id=NULL, animate=NULL, animation_options=NULL, className=NULL, clear_on_unhover=NULL, clickAnnotationData=NULL, clickData=NULL, config=NULL, extendData=NULL, figure=NULL, hoverData=NULL, loading_state=NULL, prependData=NULL, relayoutData=NULL, responsive=NULL, restyleData=NULL, selectedData=NULL, style=NULL) {
    
    props <- list(id=id, animate=animate, animation_options=animation_options, className=className, clear_on_unhover=clear_on_unhover, clickAnnotationData=clickAnnotationData, clickData=clickData, config=config, extendData=extendData, figure=figure, hoverData=hoverData, loading_state=loading_state, prependData=prependData, relayoutData=relayoutData, responsive=responsive, restyleData=restyleData, selectedData=selectedData, style=style)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Graph',
        namespace = 'dash_core_components',
        propNames = c('id', 'animate', 'animation_options', 'className', 'clear_on_unhover', 'clickAnnotationData', 'clickData', 'config', 'extendData', 'figure', 'hoverData', 'loading_state', 'prependData', 'relayoutData', 'responsive', 'restyleData', 'selectedData', 'style'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccInput <- function(id=NULL, autoComplete=NULL, autoFocus=NULL, className=NULL, debounce=NULL, disabled=NULL, inputMode=NULL, list=NULL, loading_state=NULL, max=NULL, maxLength=NULL, min=NULL, minLength=NULL, multiple=NULL, n_blur=NULL, n_blur_timestamp=NULL, n_submit=NULL, n_submit_timestamp=NULL, name=NULL, pattern=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, placeholder=NULL, readOnly=NULL, required=NULL, selectionDirection=NULL, selectionEnd=NULL, selectionStart=NULL, size=NULL, spellCheck=NULL, step=NULL, style=NULL, type=NULL, value=NULL) {
    
    props <- list(id=id, autoComplete=autoComplete, autoFocus=autoFocus, className=className, debounce=debounce, disabled=disabled, inputMode=inputMode, list=list, loading_state=loading_state, max=max, maxLength=maxLength, min=min, minLength=minLength, multiple=multiple, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, n_submit=n_submit, n_submit_timestamp=n_submit_timestamp, name=name, pattern=pattern, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, placeholder=placeholder, readOnly=readOnly, required=required, selectionDirection=selectionDirection, selectionEnd=selectionEnd, selectionStart=selectionStart, size=size, spellCheck=spellCheck, step=step, style=style, type=type, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Input',
        namespace = 'dash_core_components',
        propNames = c('id', 'autoComplete', 'autoFocus', 'className', 'debounce', 'disabled', 'inputMode', 'list', 'loading_state', 'max', 'maxLength', 'min', 'minLength', 'multiple', 'n_blur', 'n_blur_timestamp', 'n_submit', 'n_submit_timestamp', 'name', 'pattern', 'persisted_props', 'persistence', 'persistence_type', 'placeholder', 'readOnly', 'required', 'selectionDirection', 'selectionEnd', 'selectionStart', 'size', 'spellCheck', 'step', 'style', 'type', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccInterval <- function(id=NULL, disabled=NULL, interval=NULL, max_intervals=NULL, n_intervals=NULL) {
    
    props <- list(id=id, disabled=disabled, interval=interval, max_intervals=max_intervals, n_intervals=n_intervals)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Interval',
        namespace = 'dash_core_components',
        propNames = c('id', 'disabled', 'interval', 'max_intervals', 'n_intervals'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLink <- function(children=NULL, id=NULL, className=NULL, href=NULL, loading_state=NULL, refresh=NULL, style=NULL, target=NULL, title=NULL) {
    
    props <- list(children=children, id=id, className=className, href=href, loading_state=loading_state, refresh=refresh, style=style, target=target, title=title)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Link',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'href', 'loading_state', 'refresh', 'style', 'target', 'title'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLoading <- function(children=NULL, id=NULL, className=NULL, color=NULL, debug=NULL, fullscreen=NULL, loading_state=NULL, parent_className=NULL, parent_style=NULL, style=NULL, type=NULL) {
    
    props <- list(children=children, id=id, className=className, color=color, debug=debug, fullscreen=fullscreen, loading_state=loading_state, parent_className=parent_className, parent_style=parent_style, style=style, type=type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Loading',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'color', 'debug', 'fullscreen', 'loading_state', 'parent_className', 'parent_style', 'style', 'type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLocation <- function(id=NULL, hash=NULL, href=NULL, pathname=NULL, refresh=NULL, search=NULL) {
    
    props <- list(id=id, hash=hash, href=href, pathname=pathname, refresh=refresh, search=search)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Location',
        namespace = 'dash_core_components',
        propNames = c('id', 'hash', 'href', 'pathname', 'refresh', 'search'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccLogoutButton <- function(id=NULL, className=NULL, label=NULL, loading_state=NULL, logout_url=NULL, method=NULL, style=NULL) {
    
    props <- list(id=id, className=className, label=label, loading_state=loading_state, logout_url=logout_url, method=method, style=style)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'LogoutButton',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'label', 'loading_state', 'logout_url', 'method', 'style'),
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
dccRadioItems <- function(id=NULL, className=NULL, inline=NULL, inputClassName=NULL, inputStyle=NULL, labelClassName=NULL, labelStyle=NULL, loading_state=NULL, options=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, style=NULL, value=NULL) {
    
    props <- list(id=id, className=className, inline=inline, inputClassName=inputClassName, inputStyle=inputStyle, labelClassName=labelClassName, labelStyle=labelStyle, loading_state=loading_state, options=options, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, style=style, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RadioItems',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'inline', 'inputClassName', 'inputStyle', 'labelClassName', 'labelStyle', 'loading_state', 'options', 'persisted_props', 'persistence', 'persistence_type', 'style', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccRangeSlider <- function(id=NULL, allowCross=NULL, className=NULL, count=NULL, disabled=NULL, dots=NULL, drag_value=NULL, included=NULL, loading_state=NULL, marks=NULL, max=NULL, min=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, pushable=NULL, step=NULL, tooltip=NULL, updatemode=NULL, value=NULL, vertical=NULL, verticalHeight=NULL) {
    
    props <- list(id=id, allowCross=allowCross, className=className, count=count, disabled=disabled, dots=dots, drag_value=drag_value, included=included, loading_state=loading_state, marks=marks, max=max, min=min, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, pushable=pushable, step=step, tooltip=tooltip, updatemode=updatemode, value=value, vertical=vertical, verticalHeight=verticalHeight)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'RangeSlider',
        namespace = 'dash_core_components',
        propNames = c('id', 'allowCross', 'className', 'count', 'disabled', 'dots', 'drag_value', 'included', 'loading_state', 'marks', 'max', 'min', 'persisted_props', 'persistence', 'persistence_type', 'pushable', 'step', 'tooltip', 'updatemode', 'value', 'vertical', 'verticalHeight'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccSlider <- function(id=NULL, className=NULL, disabled=NULL, dots=NULL, drag_value=NULL, included=NULL, loading_state=NULL, marks=NULL, max=NULL, min=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, step=NULL, tooltip=NULL, updatemode=NULL, value=NULL, vertical=NULL, verticalHeight=NULL) {
    
    props <- list(id=id, className=className, disabled=disabled, dots=dots, drag_value=drag_value, included=included, loading_state=loading_state, marks=marks, max=max, min=min, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, step=step, tooltip=tooltip, updatemode=updatemode, value=value, vertical=vertical, verticalHeight=verticalHeight)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Slider',
        namespace = 'dash_core_components',
        propNames = c('id', 'className', 'disabled', 'dots', 'drag_value', 'included', 'loading_state', 'marks', 'max', 'min', 'persisted_props', 'persistence', 'persistence_type', 'step', 'tooltip', 'updatemode', 'value', 'vertical', 'verticalHeight'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccStore <- function(id=NULL, clear_data=NULL, data=NULL, modified_timestamp=NULL, storage_type=NULL) {
    
    props <- list(id=id, clear_data=clear_data, data=data, modified_timestamp=modified_timestamp, storage_type=storage_type)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Store',
        namespace = 'dash_core_components',
        propNames = c('id', 'clear_data', 'data', 'modified_timestamp', 'storage_type'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTab <- function(children=NULL, id=NULL, className=NULL, disabled=NULL, disabled_className=NULL, disabled_style=NULL, label=NULL, loading_state=NULL, selected_className=NULL, selected_style=NULL, style=NULL, value=NULL) {
    
    props <- list(children=children, id=id, className=className, disabled=disabled, disabled_className=disabled_className, disabled_style=disabled_style, label=label, loading_state=loading_state, selected_className=selected_className, selected_style=selected_style, style=style, value=value)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tab',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'disabled', 'disabled_className', 'disabled_style', 'label', 'loading_state', 'selected_className', 'selected_style', 'style', 'value'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTabs <- function(children=NULL, id=NULL, className=NULL, colors=NULL, content_className=NULL, content_style=NULL, loading_state=NULL, mobile_breakpoint=NULL, parent_className=NULL, parent_style=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, style=NULL, value=NULL, vertical=NULL) {
    
    props <- list(children=children, id=id, className=className, colors=colors, content_className=content_className, content_style=content_style, loading_state=loading_state, mobile_breakpoint=mobile_breakpoint, parent_className=parent_className, parent_style=parent_style, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, style=style, value=value, vertical=vertical)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Tabs',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'className', 'colors', 'content_className', 'content_style', 'loading_state', 'mobile_breakpoint', 'parent_className', 'parent_style', 'persisted_props', 'persistence', 'persistence_type', 'style', 'value', 'vertical'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccTextarea <- function(id=NULL, accessKey=NULL, autoFocus=NULL, className=NULL, cols=NULL, contentEditable=NULL, contextMenu=NULL, dir=NULL, disabled=NULL, draggable=NULL, form=NULL, hidden=NULL, lang=NULL, loading_state=NULL, maxLength=NULL, minLength=NULL, n_blur=NULL, n_blur_timestamp=NULL, n_clicks=NULL, n_clicks_timestamp=NULL, name=NULL, persisted_props=NULL, persistence=NULL, persistence_type=NULL, placeholder=NULL, readOnly=NULL, required=NULL, rows=NULL, spellCheck=NULL, style=NULL, tabIndex=NULL, title=NULL, value=NULL, wrap=NULL) {
    
    props <- list(id=id, accessKey=accessKey, autoFocus=autoFocus, className=className, cols=cols, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, disabled=disabled, draggable=draggable, form=form, hidden=hidden, lang=lang, loading_state=loading_state, maxLength=maxLength, minLength=minLength, n_blur=n_blur, n_blur_timestamp=n_blur_timestamp, n_clicks=n_clicks, n_clicks_timestamp=n_clicks_timestamp, name=name, persisted_props=persisted_props, persistence=persistence, persistence_type=persistence_type, placeholder=placeholder, readOnly=readOnly, required=required, rows=rows, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, value=value, wrap=wrap)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Textarea',
        namespace = 'dash_core_components',
        propNames = c('id', 'accessKey', 'autoFocus', 'className', 'cols', 'contentEditable', 'contextMenu', 'dir', 'disabled', 'draggable', 'form', 'hidden', 'lang', 'loading_state', 'maxLength', 'minLength', 'n_blur', 'n_blur_timestamp', 'n_clicks', 'n_clicks_timestamp', 'name', 'persisted_props', 'persistence', 'persistence_type', 'placeholder', 'readOnly', 'required', 'rows', 'spellCheck', 'style', 'tabIndex', 'title', 'value', 'wrap'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
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

# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dccUpload <- function(children=NULL, id=NULL, accept=NULL, className=NULL, className_active=NULL, className_disabled=NULL, className_reject=NULL, contents=NULL, disable_click=NULL, disabled=NULL, filename=NULL, last_modified=NULL, loading_state=NULL, max_size=NULL, min_size=NULL, multiple=NULL, style=NULL, style_active=NULL, style_disabled=NULL, style_reject=NULL) {
    
    props <- list(children=children, id=id, accept=accept, className=className, className_active=className_active, className_disabled=className_disabled, className_reject=className_reject, contents=contents, disable_click=disable_click, disabled=disabled, filename=filename, last_modified=last_modified, loading_state=loading_state, max_size=max_size, min_size=min_size, multiple=multiple, style=style, style_active=style_active, style_disabled=style_disabled, style_reject=style_reject)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'Upload',
        namespace = 'dash_core_components',
        propNames = c('children', 'id', 'accept', 'className', 'className_active', 'className_disabled', 'className_reject', 'contents', 'disable_click', 'disabled', 'filename', 'last_modified', 'loading_state', 'max_size', 'min_size', 'multiple', 'style', 'style_active', 'style_disabled', 'style_reject'),
        package = 'dashCoreComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
