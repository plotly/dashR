# this script uses regex to edit the DESCRIPTION file within each of the Dash core
# packages as required to test bleeding edge builds
#
# to avoid spurious versioning errors, we loosen the version restriction here so
# that it is >= rather than the == format currently applied to release packages for
# testing purposes only

# capture DESCRIPTION data for dash, dashTable, dashCoreComponents, dashHtmlComponents
dash_desc <- read.dcf("dashR/DESCRIPTION")
dt_version <- read.dcf("dash-table/DESCRIPTION")[,"Version"]
dcc_version <- read.dcf("dash-core-components/DESCRIPTION")[,"Version"]
dhc_version <- read.dcf("dash-html-components/DESCRIPTION")[,"Version"]

# capture Imports data for dashTable, dashCoreComponents, dashHtmlComponents,
# edit the Imports section of dash's DESCRIPTION as required, update dash_desc
imports <- dash_desc[,"Imports"][[1]]
imports <- gsub("((?<=dashHtmlComponents )(\\\\(.*?\\\\)))", paste0("(= ", dhc_version, ")"), imports, perl = TRUE)
imports <- gsub("((?<=dashCoreComponents )(\\\\(.*?\\\\)))", paste0("(= ", dcc_version, ")"), imports, perl = TRUE)
imports <- gsub("((?<=dashTable )(\\\\(.*?\\\\)))", paste0("(= ", dt_version, ")"), imports, perl = TRUE)

# loosen version restriction to prevent versioning errors at release time
imports <- gsub("==", ">=", imports, perl=TRUE)

dash_desc[,"Imports"][[1]] <- imports

# obtain the latest commit hash for dashTable, dashCoreComponents, dashHtmlComponents, and save
dhc_hash <- system("cd dash-html-components; git rev-parse HEAD | tr -d '\''\n'\''", intern=TRUE)
dcc_hash <- system("cd dash-core-components; git rev-parse HEAD | tr -d '\''\n'\''", intern=TRUE)
dt_hash <- system("cd dash-table; git rev-parse HEAD | tr -d '\''\n'\''", intern=TRUE)
remotes <- dash_desc[,"Remotes"][[1]]

# edit the Remotes section of dash's DESCRIPTION as required to update hashes, update dash_desc
remotes <- gsub("((?<=plotly\\\\/dash-html-components@)([a-zA-Z0-9]+))", dhc_hash, remotes, perl=TRUE)
remotes <- gsub("((?<=plotly\\\\/dash-core-components@)([a-zA-Z0-9]+))", dcc_hash, remotes, perl=TRUE)
remotes <- gsub("((?<=plotly\\\\/dash-table@)([a-zA-Z0-9]+))", dt_hash, remotes, perl=TRUE)
dash_desc[,"Remotes"][[1]] <- remotes

# write the updated DESCRIPTION back to the dash package directory for installation
write.dcf(dash_desc, "dashR/DESCRIPTION")