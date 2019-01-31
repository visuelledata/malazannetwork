alias <- googlesheets::gs_title("malazan_alias") %>% 
  googlesheets::gs_read() %>% 
  mutate(aliases = stringr::str_split(aliases, ", ")) %>% 
  tidyr::unnest()

write.csv(alias, file = "data/alias.csv")
