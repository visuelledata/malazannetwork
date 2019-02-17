alias <- googlesheets::gs_title("malazan_alias") %>% 
  googlesheets::gs_read() %>% 
  mutate(aliases = stringr::str_split(aliases, ", ")) %>% 
  tidyr::unnest() %>% 
  mutate(name = str_replace(name, "’", "'")) %>% 
  mutate(aliases = str_replace_all(aliases, "’", "'"))

write.csv(alias, file = "data/alias.csv")
