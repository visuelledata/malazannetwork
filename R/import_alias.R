library(dplyr)
library(tidyr)
library(stringr)
library(googlesheets)

alias <- gs_title("malazan_alias") %>% 
  gs_read() %>% 
  mutate(aliases = str_split(aliases, ", ")) %>% 
  unnest() %>% 
  mutate(name = str_replace(name, "’", "'")) %>% 
  mutate(aliases = str_replace_all(aliases, "’", "'"))

write.csv(alias, file = "data/alias.csv")
