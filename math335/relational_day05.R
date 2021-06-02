########################################
##  Relational Data - Class Examples  ##
########################################

library(tidyverse)
library(nycflights13)

?flights
glimpse(flights)

?airlines
glimpse(airlines)

# are these two different?

glimpse(flights %>% left_join(airlines, by = "carrier"))
glimpse(airlines %>% left_join(flights, by = "carrier"))

# do these two tables contain the same carriers?

table(flights$carrier %in% airlines$carrier)
table(airlines$carrier %in% flights$carrier)

#-----------------------------------------------

?airports
glimpse(airports)

View(flights[1,])

glimpse(flights %>% left_join(airports, by = c("origin" = "faa")))
glimpse(flights %>% left_join(airports, by = c("dest" = "faa")))
