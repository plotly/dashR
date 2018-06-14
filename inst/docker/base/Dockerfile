FROM rocker/r-ver:latest
MAINTAINER Carson Sievert "cpsievert1@gmail.com"

## Install some basic system/R dependencies
RUN apt-get update && apt-get install -y \
  # for curl (many packages need this)
    libcurl4-openssl-dev \
  # for xml2 (which reqres depends on)
    libxml2-dev \
  # for V8 (which dashRtranspile depends on)
  # NOTE: we don't really need this...get rid of it!
    libv8-3.14-dev

## TODO: remove when we release dashR
ARG GITHUB_PAT

## install dashR from GitHub
RUN Rscript -e "install.packages('remotes'); remotes::install_github('plotly/dashR')"

## Assuming the fiery server wants to run on this port
EXPOSE 8080

## Create a default user (docker). Same as rocker-org/r-base
## https://github.com/rocker-org/rocker/blob/bdea37/r-base/Dockerfile#L10
RUN useradd docker \
    && mkdir /home/docker \
    && chown docker:docker /home/docker \
    && addgroup docker staff

# Copy over dashR source and run the tutorial
ADD ./app.R /home/docker/dashR-example-app.R
CMD Rscript /home/docker/dashR-example-app.R
