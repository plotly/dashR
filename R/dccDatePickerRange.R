# AUTO GENERATED FILE - DO NOT EDIT

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
