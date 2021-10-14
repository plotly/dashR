#' Create HTML tags
#'
#' Create an HTML tag to place in a Dash app layout. All tags are available
#' in the `html` list, and some common tags have shortcuts as functions for
#' convenience (e.g. `h1()` produces `<h1>` and is equivalent to `html$h1()`).
#'
#' @name tags
#' @param ... Any named arguments become tag attributes, and any unnamed
#' arguments become children. A named argument with a value of `NULL` will
#' be removed, and a named argument with a value of `NA` will be rendered
#' as a boolean argument. See 'Special attributes' below for more information.
#' @param tag_name The name of the HTML tag.
#' @param content List of attributes and children.
#'
#' @section Special attributes:
#' There are a few HTML attributes that are treated in a special way:
#' - To add a `class` attribute, use the `className` parameter
#' - To add a `for` attribute, use the `htmlFor` parameter
#' - The `style` attribute is not provided as a string. Instead, it's provided
#' as a named list, where the name and value of each element correspond to the
#' CSS property and value. Each CSS property should be written in camelCase.
#' - A special property `n_clicks` is automatically added to every HTML tag.
#' This property represents the number of times that this element has been
#' clicked on. If not explicitly initialized to a certain integer, its default
#' value is `NULL` initially.
#'
#' @examples
#' if (interactive()) {
#'     app <- dash_app()
#'     app %>% set_layout(
#'       html$div(
#'         h1(
#'           "title",
#'           style = list(
#'             "color" = "red",
#'             "backgroundColor" = "blue"
#'           )
#'         ),
#'         "some text",
#'         button(
#'           "can't click me",
#'           disabled = NA,
#'           className = "mybtn"
#'         )
#'       )
#'     )
#'     app %>% run_app()
#'}
NULL

#' @rdname tags
#' @format NULL
#' @export
html <- lapply(all_tags, function(tag_name) {
  rlang::new_function(
    args = alist(... = ),
    body = rlang::expr({
      dash_tag(!!tag_name, list(...))
    }),
    env = asNamespace("dash")
  )
})

#' @rdname tags
#' @export
h1 <- html$h1

#' @rdname tags
#' @export
h2 <- html$h2

#' @rdname tags
#' @export
h3 <- html$h3

#' @rdname tags
#' @export
h4 <- html$h4

#' @rdname tags
#' @export
div <- html$div

#' @rdname tags
#' @export
span <- html$span

#' @rdname tags
#' @export
p <- html$p

#' @rdname tags
#' @export
strong <- html$strong

#' @rdname tags
#' @export
br <- html$br

#' @rdname tags
#' @export
button <- html$button

#' @rdname tags
#' @export
a <- html$a

#' @rdname tags
#' @export
img <- html$img

#' @rdname tags
#' @export
dash_tag <- function(tag_name, content = list()) {
  content_names <- rlang::names2(content)
  content_named_idx <- nzchar(content_names)
  attributes <- remove_empty(content[content_named_idx])
  children <- unname(content[!content_named_idx])

  # Try to match the exact level of nesting of children as original {dash}
  if (length(children) == 0) {
    children <- NULL
  } else if (length(children) == 1) {
    children <- children[[1]]
  }

  # Support boolean attributes
  attributes[is.na(attributes)] <- names(attributes[is.na(attributes)])
  attributes[attributes == ""] <- names(attributes[attributes == ""])

  tag_params <- attributes
  tag_params[["children"]] <- children

  dash_html_fx <- paste0("html", toupper(substring(tag_name, 1, 1)), substring(tag_name, 2))
  if (tag_name %in% c("map", "object")) {
    dash_html_fx <- paste0(dash_html_fx, "El")
  }

  do.call(dash_html_fx, tag_params)
}
