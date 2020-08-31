.PHONY: clean

clean:
	rm derived_data/*
  
derived_data/electoralvotes.csv derived_data/polls.csv:\
 source_data/electoral_college.csv\
 source_data/presidential_poll_averages_2020.csv\
 tidy_data.R
	Rscript tidy_data.R