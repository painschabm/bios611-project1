.PHONY: clean
SHELL: /bin/bash

clean:
	rm derived_data/*
	rm figures/*
  
derived_data/headtohead.csv:\
 source_data/electoral_college.csv\
 source_data/presidential_poll_averages_2020.csv\
 tidy_data.R
	Rscript tidy_data.R
	
figures/state_shifts.png\
figures/2016_2010.png\
figures/2016_2020\
figures/votes_by_state_2010.png\
figures/votes_by_state_2020.png:\
 derived_data/headtohead.csv\
 figures.R
	Rscript figures.R
	
Analysis.pdf:\
	derived_data/headtohead.csv\
	Analysis.Rmd\
	rend_pdf.R
		Rscript rend_pdf.R