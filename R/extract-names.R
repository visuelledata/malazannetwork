library(tidyverse)
library(tidytext)

# This function filters the data by book and pulls out a character vector of text
pull_book_data <- function(book_data, i){
  book_data %>% 
    filter(book == i) %>% 
    pull(data)
}

# Assigning all of the books to different variables
book1 <- pull_book_data(temp0, 1)
book2 <- pull_book_data(temp0, 2)
book3 <- pull_book_data(temp0, 3)
book4 <- pull_book_data(temp0, 4)
book5 <- pull_book_data(temp0, 5)
book6 <- pull_book_data(temp0, 6)
book7 <- pull_book_data(temp0, 7)
book8 <- pull_book_data(temp0, 8)
book9 <- pull_book_data(temp0, 9)
book10 <- pull_book_data(temp0, 10)


library(future.apply)
#--------------------------------------------------------------
# This function pulls all of the co-occurrence data from a specific book and chapter
process_data <- function(datastuff, book_num, i){
  tictoc::tic() # For execution time
  plan(multiprocess, workers = 4) # To set parallelization parameters
  
  # Pulls out the co-occurrence data
  placeholder <- datastuff %>% #Change Here####
    future_apply(1, function(x){ 
                      map_chr(all_names,
                        function(pat){
                          name <- str_extract(x, pattern = fixed(pat)) # Finds the name
                          #The line below removes any matches from the string
                          if(!is.na(name)) x <<- str_remove(x, pattern = fixed(pat)) 
                          name # So the function returns the co-occurrence data
                         }
                        )
                      },
                 future.seed = TRUE)
  
  # Formats the data into a "tidy" format and does some basic cleaning
  placeholder %>% 
    t() %>% 
    as.tibble() %>% 
    unite("names", V1:V3080, sep = ";") %>% 
    remove_NAs() %>% 
    mutate(book = book_num, 
           chapter = i) %>%  #Change Here####
    write_rds(paste0("data/network_data/network_data", 
                     book_num, "-", i,   #Change Here####
                     ".rds"), 
              compress = "none")
  
  tictoc::toc() # Gets execution time
  
  return(NULL)
}

# Each book has a for loop and each loop iterates through every chapter in the book
for (i in seq_along(book1)){
  process_data(book1[[i]], 1, i) # Function is above, it extracts co-occurrences
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
