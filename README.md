BIOS611 Project 1
=================

Effect of Electoral College and Population Changes on 2020 Presdiential Election
-------------------------------------------------------------------------------

Usage
-----
You will need to build the container.

	> docker build . -t project1-env

You'll need Docker and the ability to run Docker as your current user.
This Docker container is based on rocker/verse. To connect, run Rstudio server:

	> docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=mypassword -t project1-env

Then connect to the machine on port 8787.


To run Python you'll need to connect to Docker as follows:

	> docker run -p 8765:8765 -v `pwd`:/home/rstudio -e -it project1-env sudo -H -u rstudio /bin/bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8765"

Then copy and paste the url given into a web browser to connect to Jupyter.
