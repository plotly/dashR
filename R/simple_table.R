#' Simple HTML table
#'
#' @param data A data.frame
#' @param colnames _(logical)_ Whether or not to show the column names (a header row)
#' @param rownames _(logical)_ Whether or not to show the row names
#' @examples
#' if (interactive()) {
#'     app <- dash_app() %>%
#'       set_layout(
#'         dccChecklist(
#'           id = "table_params",
#'           labelStyle = list(display = "block"),
#'           options = list(
#'             list(label = "Header", value = "colnames"),
#'             list(label = "Row names", value = "rownames")
#'           )
#'         ),
#'         br(),
#'         div(id = "table")
#'       )
#'
#'     app %>% add_callback(
#'       output(id = 'table', property = 'children'),
#'       input(id = 'table_params', property = 'value'),
#'       function(val) {
#'         simple_table(mtcars, colnames = "colnames" %in% val, rownames = "rownames" %in% val)
#'       }
#'     )
#'
#'     app %>% run_app()
#' }
#' @export
simple_table <- function(data, colnames = TRUE, rownames = FALSE) {
  if (!is.data.frame(data)) {
    stop("simple_table: `data` must be a data.frame", call. = FALSE)
  }
  if (ncol(data) == 0) {
    return(NULL)
  }

  header <- NULL
  if (isTRUE(colnames) && !is.null(colnames(data))) {
    header <- lapply(colnames(data), html$th)
    if (isTRUE(rownames)) {
      header <- c(list(html$th("")), header)
    }
    header <- html$tr(header)
  }

  rows <- lapply(seq(nrow(data)), function(rownum) {
    row <- lapply(as.character(data[rownum, ]), html$td)
    if (isTRUE(rownames)) {
      row <- c(list(html$td(rownames(data[rownum, ]))), row)
    }
    html$tr(row)
  })
  html$table(c(list(header), rows))
}
