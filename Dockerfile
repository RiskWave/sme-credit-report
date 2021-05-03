FROM rocker/verse:4.0.3

LABEL maintainer="Piermattia Schoch <piermattia.schoch@riskwave.net>"
USER root

# Install debian packages
RUN apt-get update && \
  apt-get install -y \
  pandoc \
  libssl-dev \
  libcurl4-gnutls-dev \
  libxml2-dev
 
## copy necessary files
COPY . .

ENV RENV_VERSION 0.13.2
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
RUN R -e 'renv::restore()'


# Port
EXPOSE 8000

ENTRYPOINT ["R","-e", "library(plumber); plumb('api/plumber.R')$run(port=8000, host='0.0.0.0')"]
