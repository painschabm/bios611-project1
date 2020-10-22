library(tidyverse)

electoralvotes <- read.csv("source_data/electoral_college.csv");
polls <-read.csv("source_data/presidential_poll_averages_2020.csv");

# Join polling data with electoral college votes data
merged <- left_join(
  electoralvotes, 
  polls, 
  by = "state")

# Filter for most recent polling data for only Biden and Trump and eliminate 
  # irrelevant columns
merged_clean <- merged %>% 
  filter(is.na(modeldate) | modeldate == "10/7/2020") %>% 
  select(-pct_estimate, -cycle, -modeldate) %>% 
  filter(is.na(candidate_name) | candidate_name == "Joseph R. Biden Jr." |
                         candidate_name == "Donald Trump")

# Given absence of polling data, will estimate missing data for: 
  # DC based on 2016 presidential election and 

  merged_clean[17, 9] = "Joseph R. Biden Jr."
  merged_clean[17, 10] = 90.9
  merged_clean <- add_row(merged_clean, state = "DC", votes_2010 = 3, 
        votes_2020 = 3, pop_2010 = 601723, pop_2019 = 705749, 
        poppervote_2010 = 200574, poppervote_2020 = 235250, 
        trump_clinton = "clinton", candidate_name = "Donald Trump", 
        pct_trend_adjusted = 4.1, .after = 17)

  # NE-3 (Nebraska 3rd district) based on 2018 congressional election
  
  merged_clean[65, 9] = "Joseph R. Biden Jr."
  merged_clean[65, 10] = 23.3
  merged_clean <- add_row(merged_clean, state = "NE-3", votes_2010 = 1, 
        votes_2020 = 1, pop_2010 = 365268, pop_2019 = 386882, 
        poppervote_2010 = 365268, poppervote_2020 = 386882, 
        trump_clinton = "trump", candidate_name = "Donald Trump", 
        pct_trend_adjusted = 76.7, .after = 65)
  
# Pivot wider to allow head to head comparison in each electoral college voting
  # block (state/district)
headtohead <- pivot_wider(merged_clean, names_from = "candidate_name", 
                          values_from = "pct_trend_adjusted")
  
# Simplify column names
headtohead <- rename(headtohead, biden = "Joseph R. Biden Jr.", 
                                  trump = "Donald Trump")

# Add column comparing Trump vs Biden
headtohead <- mutate(headtohead, winner = ifelse(biden > trump,
                                                 "Biden", "Trump"))

# Save tidy data  
write.csv(headtohead, "derived_data/headtohead.csv")
