library(tidyverse)

electoralvotes <- read.csv("source_data/electoral_college.csv");
polls <-read.csv("source_data/presidential_poll_averages_2020.csv");

merged <- left_join(
  electoralvotes, 
  polls, 
  by = "state")

today <- Sys.Date()
merged_clean <- filter(merged, is.na(modeldate) | modeldate == "8/31/20")

merged_clean <- filter(merged_clean, 
                       is.na(candidate_name) |
                         candidate_name == "Joseph R. Biden Jr." |
                         candidate_name == "Donald Trump")

write.csv(merged, "derived_data/merged.csv")
write.csv(merged_clean, "derived_data/merged_clean.csv")
