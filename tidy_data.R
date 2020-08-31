library(tidyverse)

electoralvotes <- read.csv("source_data/electoral_college.csv");
polls <-read.csv("source_data/presidential_poll_averages_2020.csv");

# Do something here to clean things up.

write.csv(electoralvotes, "derived_data/electoralvotes.csv");
write.csv(polls, "derived_data/polls.csv");

