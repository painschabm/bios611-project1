FROM rocker/verse
MAINTAINER Matthew Painschab <mpain@med.unc.edu>
RUN R -e "install.packages('tidyverse')"

