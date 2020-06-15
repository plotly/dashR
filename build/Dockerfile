FROM circleci/python:3.7-stretch-node-browsers
MAINTAINER Ryan Patrick Kyle "ryan@plotly.com"

RUN sudo apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF' \
 && sudo printf "deb http://cloud.r-project.org/bin/linux/debian stretch-cran35/" | sudo tee -a /etc/apt/sources.list \
 && sudo apt-get update \
 && sudo apt-get install -yq --no-install-recommends --allow-unauthenticated r-base r-base-dev libudunits2-dev libsodium-dev libgeos-dev gdal-bin libgdal-dev libjq-dev protobuf-compiler libprotobuf-dev \ 
 && sudo apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

RUN sudo R -e "install.packages('remotes', dependencies=TRUE, repos='http://cloud.r-project.org/')"

RUN sudo R -e "invisible(lapply(list('devtools', 'callr', 'data.table', 'plotly', 'ggplot2', 'scales', 'httr', 'jsonlite',  'magrittr', 'digest', 'viridisLite', 'base64enc', 'htmltools', 'htmlwidgets', 'tidyr', 'hexbin', 'RColorBrewer', 'dplyr', 'tibble', 'lazyeval', 'rlang', 'crosstalk', 'purrr', 'promises', 'R6', 'shiny', 'assertthat', 'glue', 'pkgconfig', 'Rcpp', 'tidyselect', 'BH', 'plogr', 'gtable', 'MASS', 'mgcv', 'reshape2', 'withr', 'lattice', 'yaml', 'curl', 'mime', 'openssl', 'later', 'labeling', 'munsell', 'cli', 'crayon', 'fansi', 'pillar', 'ellipsis', 'stringi', 'vctrs', 'lifecycle', 'nlme', 'Matrix', 'colorspace', 'askpass', 'utf8', 'plyr', 'stringr', 'httpuv', 'xtable', 'sourcetools', 'backports', 'zeallot', 'sys', 'fiery', 'uuid', 'future', 'reqres', 'routr', 'globals', 'listenv', 'urltools', 'brotli', 'xml2', 'webutils', 'codetools', 'triebeard', 'lubridate'), install.packages, dependencies=TRUE, repos='http://cloud.r-project.org/'))"
