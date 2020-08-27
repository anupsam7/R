# Load packages
library(openintro)
library(dplyr)

#Load county data
data(county)

# Removing DC
county_noDC <- county %>%
  filter(state != "District of Columbia") %>%
  droplevels()

# Simple Random Sampling of 100 counties
county_srs <- county_noDC %>%
  sample_n(size = 100)
glimpse(county_srs)

# State distribution of SRS counties
county_srs %>%
  group_by(state) %>%
  count()

# Stratified sampling of 100 counties, each state is a stratum
county_str <- county_noDC %>%
  group_by(state) %>%
  sample_n(size = 2)

# State distribution of Stratified Sampling
county_str %>%
  group_by(state) %>%
  count()
