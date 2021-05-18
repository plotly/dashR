# AUTO GENERATED FILE - DO NOT EDIT

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
