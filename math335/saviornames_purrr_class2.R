######################################
##              SET UP              ##
######################################

library(tidyverse)
library(downloader)

# scripture text
download("http://scriptures.nephi.org/downloads/lds-scriptures.csv.zip", "temp.zip")
unzip("temp.zip")
all_scriptures <- read_csv("lds-scriptures.csv", col_types = cols(book_subtitle = col_character(),
                                                                  volume_subtitle = col_character()))

# just the book of mormon
bom <- all_scriptures %>% 
  filter(volume_title == "Book of Mormon")

# savior names
savior_names <- read_rds(gzcon(url("https://byuistats.github.io/M335/data/BoM_SaviorNames.rds")))

# regex used to match savior names
names_of_christ <- savior_names$name %>% str_c(collapse = "|")





##############################################
##            COUNT SAVIOR NAMES            ##
##############################################

# I like to work with a smaller dataset when I'm 
# first writing a function
temp <- bom[1:5,]
temp

# what does this do?
temp %>% 
  summarise(text = str_c(scripture_text, collapse = " ")) 

# what does this do?
temp %>% 
  summarise(text = str_c(scripture_text, collapse = " ")) %>% 
  mutate(word_count = str_count(text, "Nephi"))

# what does this do?
temp %>% 
  summarise(text = str_c(scripture_text, collapse = " ")) %>% 
  mutate(word_count = str_count(text, names_of_christ))

# write the function
count_words_match <- function(df, my_string){
  df %>% 
    summarise(text = str_c(scripture_text, collapse = " ")) %>% 
    mutate(word_count = str_count(text, my_string))
}

# check results
count_words_match(temp, "Nephi")
count_words_match(temp, names_of_christ)





################################################
##     COUNT WORDS *between* SAVIOR NAMES     ##
################################################

# smaller practice data set
temp <- bom[1:5,]
temp

# what does this do?
temp %>% 
  summarise(text = str_c(scripture_text, collapse = " ")) %>% 
  str_split(names_of_christ)

# outputs a list
t1 <- temp %>% 
  summarise(text = str_c(scripture_text, collapse = " ")) %>% 
  str_split(names_of_christ)
t1

# outputs a vector
t1  <- temp %>% 
  summarise(text = str_c(scripture_text, collapse = " ")) %>% 
  str_split(names_of_christ) %>% 
  unlist()
t1

# now count the words
tibble(text = t1) %>% 
  mutate(word_count = str_count(text, "\\w+"))

# write the function
count_words_between <- function(df, my_string){
  t1 <- df %>% 
    summarise(text = str_c(scripture_text, collapse = " ")) %>% 
    str_split(my_string) %>% 
    unlist()
  tibble(text = t1) %>% 
    mutate(word_count = str_count(text, "\\w+"))
}

# check results
count_words_match(temp, names_of_christ)
count_words_between(temp, names_of_christ)





#############################################
##        A function that does BOTH        ##
#############################################

count_words <- function(){
  if(){

    
  } else if (){
    

  } else {
    
    
  }
}

# check results

count_words(temp)
count_words(temp, names_of_christ, "between")

count_words(temp, names_of_christ, "match")
count_words(temp, "Nephi", "match")




#############################################
##         Explore the scriptures!         ##
#############################################

# double check our function against the last case study
nested_bom <- bom %>% 
  group_by(book_title) %>% 
  nest()

nested_bom %>% 
  mutate(foo = map(data, count_words))

nested_bom %>% 
  mutate(foo = map(data, count_words)) %>% 
  select(-data) %>% 
  unnest(cols = foo)

# how can we calculate the AVERAGE numbers of 
# words between?

# Answer:





# and if we want to pass more arguments to "count words"....
nested_bom %>% 
  mutate(foo = map(data, count_words, my_string = "Nephi", type = "match")) %>% 
  select(-data) %>% 
  unnest(cols = foo)
      


############################################
##               Your turn.               ##
############################################

# Explore word counts ("match" and/or "between")
# in a volume of scripture that is NOT the Book of Mormon.

# Then make at least one graph that shows something interesting you learned.



