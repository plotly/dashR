# I don't think this endpoint is very functional currently

# https://api.plot.ly/v2/dash-apps
# https://github.com/plotly/dash/blob/master/dash/plotly_api.py

create_or_overwrite_dash_app <- function(
  filename = NULL,
  sharing = c("public", "private", "secret"),
  app_url = NULL
  ) {

  try_library("plotly", "create_or_overwrite_dash_app")

  if (is.null(app_url)) {
    stop("`filename` and `app_url` must be non_NULL", call. = FALSE)
  }

  sharing <- match.arg(sharing)

  payload <- list(
    filename = filename,
    share_key_enabled = identical(sharing, "secret"),
    world_readable =  identical(sharing, "public"),
    app_url = app_url
  )

  # just like plotly:::api_lookup_file
  file <- tryNULL(plotly::api(paste0("files/lookup?path=", filename)))

  res <- if (is.null(file)) {
    # file likely doesn't exist, create a new one
    api("dash-apps", "POST", payload)
  } else {
    # update the existing file
    api(paste0("dash-apps/", file$file$fid), "PUT", payload)
  }

  res$file$fid %||% res$fid
}
