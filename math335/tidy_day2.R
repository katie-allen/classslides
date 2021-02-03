# The tidyverse includes...
# ggplot2
# dplyr
# tidyr
# tibble
# readr
library(tidyverse)
##
## Replace the NAs with -
##
# how Sister Larson replaces missing values
fish_encounters %>%
  mutate(seen = as.character(seen)) %>% 
  pivot_wider(names_from = station, 
              values_from = seen,
              values_fill = "-") # or values_fill = list(seen = "-")
# from the text book - gives lots of warnings
fish_encounters %>%
  pivot_wider(names_from = station, 
              values_from = seen) %>% 
  mutate_all(list(~replace_na(.,"-")))
##
## Fix the month names
##
# it is best/easier to fix names BEFORE you pivot
# Sister Larson uses case_when
fish_encounters %>% 
  mutate(station = as.character(station)) %>% 
  mutate(station2 = case_when(
    station == "Release" ~ "Bob",
    station == "BCE" ~ "Bob",
    fish == 4843 ~ "Susan",
    TRUE ~ station # the "TRUE" is for all remaining rows
  )) %>% 
  View()
# Gavin did it this way
# This creates a TRUE/FALSE vector, and then
# send that vector into the [] index
fish_encounters$station[fish_encounters$station == "BCE"] <- "Bob"
# Another way - not good, because we are "hard coding" the row numbers
fish_encounters$station[c(2,39,101)] <- "Bob"
##
## Separate vs. Extract
##
# separate "splits" your columns
# extract "pulls out" specific patterns (called "regex") from column
temp <- head(iris)
temp
temp %>% separate(col = Species, 
                  into = c("col1", "col2"), 
                  sep = "t")
temp %>% separate(col = Species, 
                  into = c("col1", "col2"), 
                  sep = -2)
temp <- msleep %>% extract(col = name,
                           into = "col1",
                           regex = "([a-z]*t)")
##
## Data Frames vs Tibbles
##
# They are basically the same...
# https://r4ds.had.co.nz/tibbles.html#tibbles-vs.-data.frame
iris
as_tibble(iris)
as.data.frame(iris)
##
## Attributes are not data...they are "data about the data"
##
attributes(iris)
attr(iris, "my_attribute") <- "Sister Larson"
attributes(iris)