library(tidyverse)

electoralvotes <- read.csv("source_data/electoral_college.csv");
polls <-read.csv("source_data/presidential_poll_averages_2020.csv");

merged <- left_join(
  electoralvotes, 
  polls, 
  by = "state")

today <- Sys.Date()
merged_clean<- filter(merged, modeldate == "8/31/20"
                      & (candidate_name == "Joseph R. Biden Jr."
                         | candidate_name == "Donald Trump"))

write.csv(merged_clean, "derived_data/merged.csv")

