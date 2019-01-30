library(dplyr)
library(purrr)
library(stringr)

books <- map(list.files("data/books"),
             function(file_name){
               readr::read_lines(paste0("data/books/", file_name))
             })

books <- map(books,
             function(book){
               book[book != ""]
             })

books <- map(books,
              function(book){
                book %>%
                 str_squish() %>% 
                 str_trim
             })

strip_front_matter <- function(book, i){
  if(any(map_lgl(c(2,3,7,8,10), ~i == .x))) {string = "PROLOGUE"}
    else {string = "Prologue"}
  if(i == 9) {string = "CHAPTER ONE"}
  book[which(book == string):length(book)]
}

strip_back_matter <- function(book, i){
  if(i != 3) {
    book[1:which(str_detect(book, "This ends the")) - 1]}
  else {book}
}

books <- books %>% 
  imap(strip_front_matter) %>% 
  imap(strip_back_matter)

books <- books %>%
  map(as_tibble) 

books[[1]] <- mutate(books[[1]], book = 2)
books[[2]] <- mutate(books[[2]], book = 9)
books[[3]] <- mutate(books[[3]], book = 1)
books[[4]] <- mutate(books[[4]], book = 4)
books[[5]] <- mutate(books[[5]], book = 3)
books[[6]] <- mutate(books[[6]], book = 5)
books[[7]] <- mutate(books[[7]], book = 7)
books[[8]] <- mutate(books[[8]], book = 6)
books[[9]] <- mutate(books[[9]], book = 10)
books[[10]] <- mutate(books[[10]], book = 8)

books <- books %>% 
  map(mutate, chapter = cumsum(str_detect(value, "^(?i)chapter"))) %>% 
  map(mutate, chapter = chapter + cumsum(str_detect(value, "^(?i)epilogue"))) %>% 
  reduce(bind_rows) %>% 
  rename(line = value)

