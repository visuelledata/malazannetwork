source("R/import_books.R")
source("R/import_characters.R")
source("R/import_alias.R")

books %>% 
  filter(str_detect(line, " Watch"))

# Remove titles from character names
# Replace aliases with names
# Remove dialogue
# Replace pronouns with names??
# Replace titles with names??
# 

books %>% 
  unnest_tokens(bigram, line, token = "ngrams", n = 2) %>% 
  separate(bigram, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  count(word1, word2, sort = TRUE) %>% View

books %>% 
  unnest_tokens(trigram, line, token = "ngrams", n = 3) %>%
  separate(trigram, c("word1", "word2", "word3"), sep = " ") %>%
  filter(!word1 %in% stop_words$word,
         !word2 %in% stop_words$word,
         !word3 %in% stop_words$word) %>%
  count(word1, word2, word3, sort = TRUE) %>% View

#method 1
books %>% 
  unnest_tokens(ngram, line, token = "ngrams", n = 8) %>% 
  group_by(book, chapter) %>% 
  mutate(section = row_number() %/% 3) %>% 
  ungroup() %>% 
  View()
#only keep ngrams with names
#reduce the number of columns until there are only collections of 2 columns of names


#Modeling through dialouge? 
#remove all non dialogue
#have dialogue | Speaker | Listener data format 
#algorithm for finding out who the speakers / listeners are? 
#graph network


