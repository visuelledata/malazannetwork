library(tidyverse)
library(tidytext)

pull_book_data <- function(book_data, i){
  book_data %>% 
    filter(book == i) %>% 
    pull(data)
}

library(future.apply)
##############################################################
process_data <- function(datastuff, book_num, i){
tictoc::tic()
plan(multiprocess, workers = 4) 

placeholder <- datastuff %>% #Change Here####
  future_apply(1, function(x){
    map_chr(all_names,
            function(pat){
              name <- str_extract(x, pattern = fixed(pat))
              if(!is.na(name)) x <<- str_remove(x, pattern = fixed(pat))
              name
            })
  }, 
  future.seed = TRUE)

placeholder %>% 
  t() %>% 
  as.tibble() %>% 
  unite("names", V1:V3080, sep = ";") %>% 
  remove_NAs() %>% 
  mutate(book = book_num, 
         chapter = i) %>%  #Change Here####
  write_rds(paste0("data/network_data/network_data", 
                   book_num, "-", i,   #Change Here####
                   ".rds"), compress = "none")

tictoc::toc()
}

for (i in seq_along(book1)){
  process_data(book1[[i]], 1, i)
}

for (i in seq_along(book2)){
  process_data(book2[[i]], 2, i)
}

for (i in seq_along(book3)){
  process_data(book3[[i]], 3, i)
}

for (i in seq_along(book4)){
  process_data(book4[[i]], 4, i)
}

for (i in seq_along(book5)){
  process_data(book5[[i]], 5, i)
}

for (i in seq_along(book6)){
  process_data(book6[[i]], 6, i)
}

for (i in seq_along(book7)){
  process_data(book7[[i]], 7, i)
}

for (i in seq_along(book8)){
  process_data(book8[[i]], 8, i)
}

for (i in seq_along(book9)){
  process_data(book9[[i]], 9, i)
}

for (i in seq_along(book10)){
  process_data(book10[[i]], 10, i)
}



process_data(temp0[[1]], 1)
process_data(temp0[[2]], 2)
process_data(temp0[[3]], 3)
process_data(temp0[[4]], 4)
process_data(temp0[[5]], 5)
process_data(temp0[[6]], 6)
process_data(temp0[[7]], 7)
process_data(temp0[[8]], 8)
process_data(temp0[[9]], 9)
process_data(temp0[[10], 10)


