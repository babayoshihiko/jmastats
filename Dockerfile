FROM rocker/geospatial:3.6.0

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    qpdf && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN set -x && \
  install2.r --error \
    here \
    ggforce \
    janitor \
    lwgeom \
    usethis && \
  installGithub.r \
    "r-lib/pkgload" \
    "klutometis/roxygen" \
    "r-lib/roxygen2md" \
    "uribo/jpndistrict" && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
