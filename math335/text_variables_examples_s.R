################################################
#  Manipulating strings with base R functions  #
################################################

# One string

my_string <- "The Church of Jesus Christ of Latter-day Saints"

grep("Church", my_string)
grep("church", my_string)

grep("Church", my_string, value = TRUE)
grep("church", my_string, value = TRUE)

grepl("Church", my_string)
grepl("church", my_string)

# What happens if we have multiple strings?
# Remember, R is a "vectorized" language

my_strings <- c("The","quick brown fox", "jumped", "over the", "lazy dog.")

grep("fox", my_strings)
grep("foxes", my_strings)

grep("fox", my_strings, value = TRUE)
grep("foxes", my_strings, value = TRUE)

grepl("fox", my_strings)
grepl("foxes", my_strings)

# We can use the results from `grep` and `grepl` to index a vector

my_strings <- c("one", "one two", "three", "one one one")

my_strings[1]

grep("one", my_strings)
my_strings[grep("one", my_strings)]

grepl("one", my_strings)
my_strings[grepl("one", my_strings)]

# We can also use `grepl` to count things!
# How would you interpret this number?

sum(grepl("one", my_strings))



#######################################
#         REGULAR EXPRESSIONS         #
#######################################

# Let's start with a vector with multiple strings
# (Like a column of a dataset)

my_strings <- c("The woods are lovely, dark and deep,",
                "But I have promises to keep,",
                "And miles to go before I sleep,",
                "And miles to go before I sleep.")

# Goal: count the number of vowels

# Try searching for "a" first

grep("a", my_strings)
grepl("a", my_strings)

# This is a good time to switch over to the `stringr` package
# (which is a part of the tidyverse)
#library(tidyverse)

library(stringr)

# Look at the cheat sheet, and tell me how to count the number of vowels
# https://github.com/rstudio/cheatsheets/blob/master/strings.pdf

# New goal: Count all letters 
# (alphabet, not including white space, puncuation, or digits/numbers)


# How many non-alphabetical character do we have?


# Look at the cheat sheet....can you tell what to do?

# Let's google it
# And then test it on one of these websites:
# https://regexr.com/
# https://regex101.com/


# Using double escapes


# Quick example of why we have to use double escape (double backslash)

#my_string <- ""Hello!" she said."
my_string <- "\"Hello!\" she said."
my_string
cat(my_string)

# Want to search for a repeating pattern? Use quantifiers

str_count(my_strings, "[aeiou]")    # exactly one
str_view_all(my_strings, "[aeiou]")



######################################
#       OTHER USEFUL FUNCTIONS       #
######################################

my_strings <- c("The woods are lovely, dark and deep,",
                "But I have promises to keep,",
                "And miles to go before I sleep,",
                "And miles to go before I sleep.")


### SUBSET STRINGS

# subset
str_sub(my_strings, 1, 5)    # a bunch of letters
str_sub(my_strings, 1, 1)    # one letter
str_sub(my_strings, -5, -1)  # negative indices work too

# Does this work?
str_sub(my_strings, c(1,1,1), c(1,2,3)) # wait, what is this doing?
str_sub(my_strings[1], c(1,1,1), c(1,2,3)) # better

# extract
str_extract(my_strings, "a")
str_extract_all(my_strings, "a")
str_extract_all(my_strings, "a", simplify = TRUE)


###  MUTATE STRINGS

# substitute with set locations (indices)
temp <- my_strings
temp
str_sub(temp, 1, 3) <- "HELLO"
temp

# substitute, based on match
str_replace(my_strings, "a", "AAA")
my_strings %>% str_replace("a", "AAA")
my_strings %>% str_replace_all("a", "AAA")

# remove
str_replace_all(my_strings, "a", "")
str_remove(my_strings, "a")


### JOIN AND SPLIT

# If you have multiple columns or vectors or strings
# join
month.abb
month.name
str_c(month.abb, month.name)
str_c(month.abb, month.name, sep="BOO")

# collapse
str_c(my_strings, collapse="BOO!")

# split
str_split(my_strings, " ")
str_split_fixed(my_strings, " ")
str_split_fixed(my_strings, " ", n = 3)