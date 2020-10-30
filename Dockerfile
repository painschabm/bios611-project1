FROM rocker/verse
MAINTAINER Matthew Painschab <mpain@med.unc.edu>
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('yaml')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('MLmetrics')"
RUN R -e "install.packages('ggfortify')"
RUN R -e "install.packages('caret')"

RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas sklearn plotnine matplotlib pandasql bokeh
