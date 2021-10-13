% Auto-generated: do not edit by hand
\name{dccDownload}

\alias{dccDownload}

\title{Download component}

\description{
The Download component opens a download dialog when the data property changes.
}

\usage{
dccDownload(id=NULL, data=NULL, base64=NULL, type=NULL)
}

\arguments{
\item{id}{Character. The ID of this component, used to identify dash components in callbacks.}

\item{data}{Lists containing elements 'filename', 'content', 'base64', 'type'.
those elements have the following types:
  - filename (character; required): suggested filename in the download dialogue.
  - content (character; required): file content.
  - base64 (logical; optional): set to true, when data is base64 encoded.
  - type (character; optional): blob type, usually a mime-type.. On change, a download is invoked.}

\item{base64}{Logical. Default value for base64, used when not set as part of the data property.}

\item{type}{Character. Default value for type, used when not set as part of the data property.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

