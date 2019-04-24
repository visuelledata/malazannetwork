# The character point of view data here is originally from this
# https://www.reddit.com/r/Malazan/comments/a1ukxk/main_series_character_pov_data/) 
# Reddit post. 

library(googlesheets)
library(purrr)
library(stringr)
library(dplyr)

pov_data <- 
  map_df(1:10, 
         function(x){
           pov_spreadsheet <- gs_title("Malazan POV data")
           gs_read(pov_spreadsheet, x, col_names = TRUE, range = cell_cols(1:4)) %>% 
             mutate(book = x)
   }
  ) %>% 
  janitor::clean_names() %>% 
  rename(chapter = chapter_number, 
         names = character) %>% 
  mutate(chapter = if_else(chapter == "P", "Ch0", chapter), 
         chapter = str_remove(chapter, "[A-Za-z]{2}"), 
         chapter = if_else(chapter == "E1", "25", chapter), 
         chapter = if_else(chapter == "E2", "26", chapter), 
         chapter = if_else(chapter == "E" & (book == 3 | book == 5), "26", chapter), 
         chapter = if_else(chapter == "E" & book == 4, "27", chapter), 
         chapter = if_else(chapter == "E", "25", chapter), 
         chapter = as.integer(chapter), 
         names = if_else(str_detect(names, "Sorry") & book == 1, 
                         "Sorry", 
                         names), 
         names = if_else(str_detect(names, "Sorry") & book != 1, 
                         "Apsalar", 
                         names)) %>% 
  remove_NAs() %>% 
  standardize_names_net() %>% 
  filter(!is.na(order)) %>% 
  rename(name = names) %>% 
  write_rds("data/pov-data.rds") %>% 
  write_csv("data/pov-data.csv")
