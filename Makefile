.PHONY: clean
.PHONY: states
SHELL: /bin/bash

# Clean the repository of any artifacts
clean:
	rm derived_data/*
	rm figures/*
	rm Analysis.pdf
	
# Create Shiny File
states:\
	derived_data/headtohead.csv\
	states.R
		Rscript states.R ${PORT}

# Make final report
Analysis.pdf:\
 derived_data/headtohead.csv\
 Analysis.Rmd
	R -e "rmarkdown::render('Analysis.Rmd', 'pdf_document')"

# Merge source data and tidy up the data
derived_data/headtohead.csv:\
 source_data/electoral_college.csv\
 source_data/presidential_poll_averages_2020.csv\
 tidy_data.R
	Rscript tidy_data.R
	
# Make figures outside of the report
figures/state_shifts.png\
figures/2016_2010.png\
figures/2016_2020\
figures/votes_by_state_2010.png\
figures/votes_by_state_2020.png:\
 derived_data/headtohead.csv\
 figures.R
	Rscript figures.R
	
