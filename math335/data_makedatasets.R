library(tidyverse)

dd <- read_csv("C:\\Users\\kalarson\\BYUI Version Control\\ktoutloud\\classslides\\math335\\data\\every_flavor_START.csv")

head(dd)



temp <- dd %>% 
  filter(grepl("chocolate", category)) %>% 
  mutate(Rhett_percent = Rhett / total,
         Link_percent = Link / total) %>% 
  filter(Rhett_percent > .5) %>% 
  arrange(total) %>% 
  select(food, category, flavor, total, Rhett_percent, Link_percent)
temp

write_csv(temp, "C:\\Users\\kalarson\\BYUI Version Control\\ktoutloud\\classslides\\math335\\data\\every_flavor_END.csv")
