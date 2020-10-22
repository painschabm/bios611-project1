FROM rocker/verse
MAINTAINER Matthew Painschab <mpain@med.unc.edu>
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('yaml')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('gum')"
