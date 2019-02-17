standardize_names_book <- function(df){
  df %>% 
    group_by(book) %>% 
    mutate(line = if_else(book == 1, str_replace_all(line, 
                                                     "Adjunct Lorn|Adjunct|Lorn", 
                                                     "Lorn"), 
                          line)) %>%
    mutate(line = if_else(book != 5 | book != 7, str_replace_all(line, 
                                                     "Fear", 
                                                     "fear"), 
                          line)) %>%
    mutate(line = if_else(book != 1, 
                          str_replace_all(line, "Adjunct Tavore Paran|Adjunct Tavore|Adjunct", 
                                          "Tavore Paran"), 
                          line), 
           line = str_replace_all(line, "Lorn Lorn", "Lorn"),
           line = str_replace_all(line, "Lorn Lorn", "Lorn")) %>%
    mutate(line = if_else(book != 2 | book != 8, 
                          str_replace_all(line, "Gothos", "Noname"), 
                          line)) %>%
    mutate(line = if_else(book == 5 | book == 7, 
                          str_replace_all(line, 
                                          "Emperor Rhulad Sengar|Emperor Rhulad|Emperor|Rhulad", 
                                          "Rhulad Sengar"), 
                          line)) %>%
    mutate(line = if_else(book != 5 | book != 7, 
                          str_replace_all(line, 
                                          "Emperor Kellanved|Emperor", 
                                          "Ammanas"), 
                          line)) %>%
    mutate(line = if_else(book == 4,  
                          str_replace_all(line, 
                                          "Warleader", 
                                          "Karsa"), 
                          line)) %>%
    ungroup()
}

standardize_names_net <- function(df){
  df %>% 
    mutate(names = str_replace_all(names, "NA", ","), 
           names = str_replace_all(names, ",+", ","), 
           names = str_remove_all(names, "^,|,$"), 
           names = str_replace_all(names, "Empress", "Laseen"), 
           names = str_replace_all(names, "Imperial Historian Duiker|Imperial Historian|Historian|Duiker", "Duiker"),
           names = str_replace_all(names, "Laseen Laseen", "Laseen"),
           names = str_replace_all(names, "Emperor Kellanved|Kellanved|Shadowthrone", 
                                   "Ammanas"), 
           names = str_replace_all(names, "Surly", "Laseen"),
           names = str_replace_all(names, "Ganoes Paran|Paran", "Ganoes Stabro Paran"), 
           names = str_replace_all(names, "Korbolo", "Korbolo Dom"),
           names = str_replace_all(names, "Rake", "Anomander Rake"), 
           names = str_replace_all(names, "Anomander Anomander", "Anomander"),
           names = str_replace_all(names, "Dujek", "Dujek Onearm"), 
           names = str_replace_all(names, "Onearm Onearm", "Onearm"), 
           names = str_replace_all(names, "Quick Ben|Quick", "Ben Adaephon Delat"),
           names = str_replace_all(names, "Crokus Younghand|Crokus|Cutter", 
                                   "Crokus Younghand"),
           names = str_replace_all(names, "Iskaral", "Iskaral Pust"), 
           names = str_replace_all(names, "Pust Pust", "Pust"), 
           names = str_replace_all(names, "Pust", "Iskaral Pust"), 
           names = str_replace_all(names, "Iskaral Iskaral", "Iskaral"),
           names = str_replace_all(names, "Caladan|Brood|Warlord", "Caladan Brood"), 
           names = str_replace_all(names, "Caladan Brood Caladan Brood", 
                                   "Caladan Brood"),
           names = str_replace_all(names, "Sergeant ", ""), 
           names = str_replace_all(names, "Talo Krafar|Talo", "Talo Krafar"),
           names = str_replace_all(names, "Osserc", "Osseric"), 
           names = str_replace_all(names, "Hound Gear", "Gear"), 
           names = str_replace_all(names, "Salk Elan", "Pearl"), 
           names = str_replace_all(names, "Heboric Light Touch|
                                   Heboric Ghost Hands|Heboric", 
                                   "Heboric Light Touch"), 
           names = str_replace_all(names, "Prazek Goul|Prazek", "Prazek Goul"), 
           names = str_replace_all(names, "Mesker Setral|Mesker", "Mesker Setral"),
           names = str_replace_all(names, "Kadagar Fant|Kadagar|Fant", "Kadagar Fant"),
           names = str_replace_all(names, "Silchas Ruin|Silchas", "Silchas Ruin"), 
           names = str_replace_all(names, "Tavore Ganoes Stabro Paran|Tavore", 
                                   "Tavore Paran"), 
           names = str_replace_all(names, "Corporal Kalam Mekhar|Kalam Mekhar|Kalam", 
                                   "Kalam Mekhar"), 
           names = str_replace_all(names, "Rallick Nom|Rallick", "Rallick Nom"))
}  
