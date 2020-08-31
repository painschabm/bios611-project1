BIOS611 Project 1
=================

Electoral College and Congressional District Swings
---------------------------------------------------

This repo will eventually contain an analysis of how projected changes in
the census from 2010-2020 distort the electoral college and congressional 
districts in 2020 election.

Usage
-----

You'll need Docker and the ability to run Docker as your current user.
This Docker container is based on rocker/verse. To connect, run Rstudio server:

    > docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=mypassword -t project1-env

Then connect to the machine on port 8787.
