.PHONY: clean
SHELL: /bin/bash

clean:
	rm derived_data/*
	rm figures/*
  
derived_data/merged.csv:\
 source_data/electoral_college.csv\
 source_data/presidential_poll_averages_2020.csv\
 tidy_data.R
	Rscript tidy_data.R
	
figures/votes_by_state_2010.png\
figures/votes_by_state_2020.png\
figures/polling_averages.png:\
 derived_data/merged.csv\
 figures.R
	Rscript figures.R