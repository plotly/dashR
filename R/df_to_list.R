#' df_to_list
#' @description
#' Helper function to convert a dataframe into the nested list format required for input into Dash DataTable.
#' @param df A data frame object to be coerced into a list of lists for DataTable.
#' @export
df_to_list <- function(df) {
  if(!(is.data.frame(df)))
    stop("df_to_list requires a data.frame object; please verify that df is of the correct type.")
  stats::setNames(lapply(split(df, seq(nrow(df))),
                  FUN = function (x) {
                    as.list(x)
                  }), NULL)
}
