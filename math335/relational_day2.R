library(tidyverse)
library(nycflights13)

# if tables have the same columns and the same units
# (aka, rows are measuring the same thing)
# then we can simply row bind the tables

table1 <- tibble(id = c(1,2,3,4),
                 x = c(15,8,8,13),
                 y = c(2,9,4,5))
table2 <- tibble(id = c(5,6),
                 x = c(1,2),
                 y = c(10,11))

table1
table2

bind_rows(table1, table2)

# if the tables have the same rows
# (the same people, or the same observations)
# but one table contains new information,
# then bind the columns together

table1 <- tibble(name = c("Bob","Sally","Jane"),
              height = c(5.8, 5.7, 6.0),
              age = c(24, 19, 22))
table2 <- tibble(name = c("Bob","Sally","Jane"),
                 eye = c("brown","brown","green"),
                hair = c("black","brown","blond"))

table1
table2

bind_cols(table1, table2)

# if the tables have different units
# (are measuring different thigns)
# then we need to "join" them instead of simply binding

# example from yesterday

glimpse(flights)
glimpse(airlines)

glimpse(flights %>% left_join(airlines, by = "carrier"))
glimpse(airlines %>% left_join(flights, by = "carrier"))

table(flights$carrier %in% airlines$carrier)
table(airlines$carrier %in% flights$carrier)

# when does the order matter?

table1 <- tibble(a = c(15,8,8,13),
                 b = c(2,9,4,5))
table2 <- tibble(b = c(1,2),
                 c = c(10,11))

table1
table2

table1 %>% left_join(table2)
table2 %>% left_join(table1)

# inner join
# how many rows will this table have?

table1 %>% inner_join(table2)

# full join
# how many rows will this table have?

table1 %>% full_join(table2)
