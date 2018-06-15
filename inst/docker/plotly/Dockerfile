FROM cpsievert/dashr-base
MAINTAINER Carson Sievert "cpsievert1@gmail.com"

RUN apt-get update && apt-get install -y \
    libssl-dev

RUN Rscript -e "install.packages('plotly')"

# Copy over dashR source and run the tutorial
ADD ./app.R /home/docker/dashR-plotly-app.R
CMD Rscript /home/docker/dashR-plotly-app.R
