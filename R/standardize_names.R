standardize_names <- function(df){
  df %>% 
    group_by(book) %>% 
    mutate(line = if_else(book == 1, str_replace_all(line, "Adjunct", "Lorn"), line), 
           line = str_replace_all(line, "Lorn Lorn", "Lorn")) %>%
    mutate(line = if_else(book != 2 | book != 8, 
                          str_replace_all(line, "Gothos", "Noname"), 
                          line), 
           line = str_replace_all(line, "Lorn Lorn", "Lorn")) %>%
    ungroup()
}
