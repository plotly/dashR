% Auto-generated: do not edit by hand
\name{dccUpload}

\alias{dccUpload}

\title{Upload component}

\description{
Upload components allow your app to accept user-uploaded files via drag'n'drop
}

\usage{
dccUpload(children=NULL, id=NULL, contents=NULL, filename=NULL,
last_modified=NULL, accept=NULL, disabled=NULL,
disable_click=NULL, max_size=NULL, min_size=NULL,
multiple=NULL, className=NULL, className_active=NULL,
className_reject=NULL, className_disabled=NULL, style=NULL,
style_active=NULL, style_reject=NULL, style_disabled=NULL,
loading_state=NULL)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number | character. Contents of the upload component}

\item{id}{Character. The ID of this component, used to identify dash components
in callbacks. The ID needs to be unique across all of the
components in an app.}

\item{contents}{Character | list of characters. The contents of the uploaded file as a binary string}

\item{filename}{Character | list of characters. The name of the file(s) that was(were) uploaded.
Note that this does not include the path of the file
(for security reasons).}

\item{last_modified}{Numeric | list of numerics. The last modified date of the file that was uploaded in unix time
(seconds since 1970).}

\item{accept}{Character. Allow specific types of files.
See https://github.com/okonet/attr-accept for more information.
Keep in mind that mime type determination is not reliable across
platforms. CSV files, for example, are reported as text/plain
under macOS but as application/vnd.ms-excel under Windows.
In some cases there might not be a mime type set at all.
See: https://github.com/react-dropzone/react-dropzone/issues/276}

\item{disabled}{Logical. Enable/disable the upload component entirely}

\item{disable_click}{Logical. Disallow clicking on the component to open the file dialog}

\item{max_size}{Numeric. Maximum file size in bytes. If `-1`, then infinite}

\item{min_size}{Numeric. Minimum file size in bytes}

\item{multiple}{Logical. Allow dropping multiple files}

\item{className}{Character. HTML class name of the component}

\item{className_active}{Character. HTML class name of the component while active}

\item{className_reject}{Character. HTML class name of the component if rejected}

\item{className_disabled}{Character. HTML class name of the component if disabled}

\item{style}{Named list. CSS styles to apply}

\item{style_active}{Named list. CSS styles to apply while active}

\item{style_reject}{Named list. CSS styles if rejected}

\item{style_disabled}{Named list. CSS styles if disabled}

\item{loading_state}{Lists containing elements 'is_loading', 'prop_name', 'component_name'.
those elements have the following types:
  - is_loading (logical; optional): determines if the component is loading or not
  - prop_name (character; optional): holds which property is loading
  - component_name (character; optional): holds the name of the component that is loading. Object that holds the loading state object coming from dash-renderer}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

\examples{
if (interactive()) {
    library(dash)
    library(jsonlite)

    app <- Dash$new()

    app$layout(htmlDiv(list(
      dccUpload(
        id='upload-image',
        children=htmlDiv(list(
          'Drag and Drop or ',
          htmlA('Select Files')
        )),
        style=list(
          'height'= '60px',
          'lineHeight'= '60px',
          'borderWidth'= '1px',
          'borderStyle'= 'dashed',
          'borderRadius'= '5px',
          'textAlign'= 'center',
          'margin'= '10px'
        ),
        # Allow multiple files to be uploaded
        multiple=TRUE
      ),
      htmlDiv(id='output-image-upload')
    )))

    parse_content = function(contents, filename, date) {
      return(htmlDiv(list(
        htmlH5(filename),
        htmlH6(as.POSIXct(date, origin="1970-01-01")),
        htmlImg(src=contents),
        htmlHr(),
        htmlDiv('Raw Content'),
        htmlPre(paste(substr(toJSON(contents), 1, 100), "..."), style=list(
          'whiteSpace'= 'pre-wrap',
          'wordBreak'= 'break-all'
        ))
      )))
    }

    app$callback(
      output = list(id='output-image-upload', property = 'children'),
      params = list(input(id = 'upload-image', property = 'contents'),
                    state(id = 'upload-image', property = 'filename'),
                    state(id = 'upload-image', property = 'last_modified')),
      function(list_of_contents, list_of_names, list_of_dates) {
        if (!is.null(list_of_contents) && !is.null(list_of_names) && !is.null(list_of_dates[[1]])) {
          children = lapply(1:length(list_of_contents), function(x){
            parse_content(list_of_contents[[x]], list_of_names[[x]], list_of_dates[[x]])
          })
        }
        else {
          children = "Upload a file to see the raw data."
        }
        return(children)
      }
    )

  app$run_server()
}
}
