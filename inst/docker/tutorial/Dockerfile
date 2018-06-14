FROM cpsievert/dashr-base
MAINTAINER Carson Sievert "cpsievert1@gmail.com"

## install dashR tutorial dependencies
RUN Rscript -e "install.packages(c('withr', 'here', 'styler', 'lubridate'))"

# Copy over dashR source and run the tutorial
ADD ./ /home/docker/dashR
WORKDIR /home/docker/dashR
CMD Rscript /home/docker/dashR/inst/tutorial/run.R
