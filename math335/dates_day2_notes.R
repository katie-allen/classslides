library(tidyverse)
library(forcats)


######################################################
#        Getting factors in the right order          #
######################################################

# use this example data
head(msleep)

# boring, temporary data set
temp <- msleep %>% 
  group_by(vore) %>% 
  summarise(avg_sleep = mean(sleep_total))

# original plot
temp %>% 
  ggplot(aes(x = vore, y = avg_sleep)) +
  geom_col()

# behind the scenes, ggplot is switching "vore"
# from a character (text/string) variable to a factor.
#
# that means we can use factor functions from the "forcats"
# package to manipulate the order

# shortest to tallest
temp %>%
  ggplot(aes(x = fct_reorder(vore, avg_sleep), y = avg_sleep)) +
  geom_col()

# tallest to shortest
temp %>%
  ggplot(aes(x = fct_reorder(vore, -avg_sleep), y = avg_sleep)) +
  geom_col()

# pick a custom order
temp %>%
  ggplot(aes(x = vore, y = avg_sleep)) +
  geom_col() +
  scale_x_discrete(limits = c("insecti","herbi","omni",NA,"carni"))

# or like this:
temp %>%
  ggplot(aes(x = factor(vore, levels = c("insecti","herbi","omni",NA,"carni")),
             y = avg_sleep)) +
  geom_col()

# ok, cool, but what if want them in the order 
# they appear in the data?

# easiest way: turn it into a factor first,
# *then* summarize and graph

# What's the difference?
as.factor(msleep$vore)    # base r
as_factor(msleep$vore)    # from the forcats package

# try again
# this method would work for book of mormon
msleep %>% 
  mutate(vore2 = as_factor(vore)) %>% 
  group_by(vore2) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  ggplot(aes(x = vore2, y = avg_sleep)) +
  geom_col()

# we could also get the levels from the original data,
# and then applied it to our temporary dataset
vore_levels = unique(msleep$vore)
vore_levels
temp %>%
  ggplot(aes(x = vore, y = avg_sleep)) +
  geom_col() +
  scale_x_discrete(limits = vore_levels)




######################################################
#     Breaking a numerical variable into groups      #
######################################################

summary(msleep$sleep_total)
hist(msleep$sleep_total)

temp <- msleep %>% 
  mutate(sleep2 = cut(sleep_total, breaks = 0:20),
         
         sleep3 = cut(sleep_total, breaks = 3, labels = c("low","middle","high")),
         
         sleep4 = case_when(
           sleep_total < 3 ~ "wow really low",
           sleep_total < 7 ~ "this is me all the time",
           sleep_total < 10 ~ "must be nice",
           TRUE ~ "this is getting ridiculous"),
         
         sleep5 = floor(sleep_total)) %>% 
  select(name, vore, sleep_total, sleep2, sleep3, sleep4, sleep5)
head(temp)

# other resources:
# https://stackoverflow.com/questions/21714457/is-cut-style-binning-available-in-dplyr
# https://ggplot2.tidyverse.org/reference/cut_interval.html




######################################################
#                  Other questions??                 #
######################################################

# How to remove NAs from a data set
colSums(is.na(msleep))

msleep %>% 
  fitler(!is.na(vore)) %>% 
  group_by(vore) %>% 
  summarise(avg_rem = mean(sleep_rem, na.rm = TRUE))

# How to count things quickly
table(msleep$vore, useNA = "always")
msleep %>% count(vore)

table(msleep$genus, msleep$vore, useNA = 'always')
msleep %>% count(genus, vore)

# How to count number of unique items in a vector
unique(msleep$vore)
length(unique(msleep$vore))
msleep %>% pull(vore) %>% n_distinct()

# How to check if a value is inside a vector
5 %in% 1:5
5 %in% 1:4
"banana" %in% fruit

pets_i_own <- c("cat","cat","dog","parrot","cat")
"cat" %in% pets_i_own
"cat" == pets_i_own
sum("cat" == "pets_i_own")
