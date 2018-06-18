FROM dashr-plotly
MAINTAINER Carson Sievert "cpsievert1@gmail.com"

RUN Rscript -e "install.packages('forecast')"

ARG CACHEBUST

# Copy over dashR source and run the tutorial
CMD ["Rscript", "-e", "source(system.file('tutorial', 'examples', 'htmlwidgets', 'plotly-forecast.R', package = 'dashR'))$value$run_heroku()"]
