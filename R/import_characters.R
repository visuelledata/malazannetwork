library(purrr)
library(stringr)
library(dplyr)

characters <- map(list.files("data/characters"),
                  function(file_name){
                    readr::read_lines(paste0("data/characters/", file_name), 
                                      locale = locale(encoding = "windows-1252"))
                   }) %>% 
  map(as.tibble) %>% 
  reduce(bind_rows)

characters <- characters$value[characters$value != ""]

characters <- as.tibble(characters)

characters <- characters %>% 
  mutate(description = str_remove(value, pattern = "[^,]+")) %>% 
  mutate(description = if_else(description == "", value, description)) %>% 
  mutate(value = str_remove(value, pattern = coll(description))) %>% 
  mutate(value = if_else(value == "", description, value)) %>% 
  mutate(description = if_else(description == value, NA_character_, description)) %>% 
  mutate(description = str_remove(description, fixed(","))) %>% 
  mutate(description = str_trim(description)) %>% 
  mutate(value = str_remove(value, fixed("(the Grey Swords)"))) %>% 
  mutate(value = str_remove(value, " \\(Priest.*")) %>% 
  mutate(value = str_remove(value, " \\(Bridgeburner.*")) %>% 
  mutate(value = str_remove(value, " \\(Shake.*")) %>%
  mutate(value = str_remove(value, " \\(.*")) %>%  
  mutate(value = str_remove(value, "/.*")) %>% 
  bind_rows(data_frame(value = c("Keeper", "Twilight", "Watch", "Jamber Bole", 
                                 "Gall's wife", "Elan", "Errastas", "Sechul Lath", 
                                 "Studious Lock", "Strings", "Gimlet", "Cotillion", 
                                 "Ammanas"), 
                       description = rep(NA_character_, 13))) %>% 
  distinct(value, .keep_all = TRUE) %>% 
  rename(name = value)
