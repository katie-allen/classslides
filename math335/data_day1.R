library(tidyverse)

dd <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/data/every_flavor_START.csv")

head(dd)


dd1 <- filter(dd, grepl("chocolate", category))
dd1$Rhett_percent = dd1$Rhett / dd1$total
dd1$Link_percent = dd1$Link / dd1$total
dd2 <- filter(dd1, Rhett_percent > .5)
dd3 <- arrange(dd2, total)
dd4 <- select(dd3, food, category, flavor, total, Rhett_percent, Link_percent)
dd4

#












dd %>% 
  filter(grepl("chocolate", category)) %>% 
  mutate(Rhett_percent = Rhett / total,
         Link_percent = Link / total) %>% 
  filter(Rhett_percent > .5) %>% 
  arrange(total) %>% 
  select(food, category, flavor, total, Rhett_percent, Link_percent)
