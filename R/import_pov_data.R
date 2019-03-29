# The character point of view data here is originally from this
# https://www.reddit.com/r/Malazan/comments/a1ukxk/main_series_character_pov_data/) 
# Reddit post. 

library(googlesheets)

pov_spreadsheet <- gs_title("Malazan POV data")

pov_data <- 
  map_df(1:10, ~gs_read(pov_spreadsheet, ., col_names = TRUE, range = cell_cols(1:4))) %>%
  janitor::clean_names()

pov_data %>% 
  rename()