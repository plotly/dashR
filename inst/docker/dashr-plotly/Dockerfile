FROM dashr-base
MAINTAINER Carson Sievert "cpsievert1@gmail.com"

# system requirements for openssl (needed for httr and thus plotly)
RUN apt-get update && apt-get install -y \
    libssl-dev

ARG CACHEBUST

RUN Rscript -e "remotes::install_github('ropensci/plotly')"

# Copy over dashR source and run the tutorial
CMD ["Rscript", "-e", "source(system.file('tutorial', 'examples', 'htmlwidgets', 'plotly-inputs.R', package = 'dashR'))$value$run_heroku()"]
