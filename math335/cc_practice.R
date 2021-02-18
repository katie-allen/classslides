###
### Option 1: 
###   - You know about (or found) the skip option
###

my_data <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/We%20Tried%20EVERY%20Flavor.csv")
View(my_data)

# hmmm...this isnt' doing what I want it to.
# what other options do I have with this function?
?read_csv()

my_data <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/We%20Tried%20EVERY%20Flavor.csv",
               skip = 1)
View(my_data)

# ah, that's better

my_data %>% 
  ggplot(aes(x = Rhett, y = Link, color = X1)) +
  geom_point() +
  theme_bw() +
  labs(title = "We Tried EVERY Flavor!",
       subtitle = "How do Rhett and Link compare on flavor scores?",
       color = "Food") +
  scale_x_continuous(limits = c(0,100)) +
  scale_y_continuous(limits = c(0,100))




###
### Option 2: 
###   - Without the skip option
###   - Using base R functions to wrangle
###

my_data <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/We%20Tried%20EVERY%20Flavor.csv")
View(my_data)

# hmmm...this isnt' doing what I want it to.
# I don't know how to fix the import,
# But I do have some wrangling skills I can show off.

# get rid of annoying first row
my_data2 <- my_data[-1,]
View(my_data2)

# change column names
colnames(my_data2) <- c("food","flavor","Rhett","Link")

# fix the data types
my_data2$Rhett <- as.numeric(my_data2$Rhett)
my_data2$Link <- as.numeric(my_data2$Link)

# and finally...make the plot!
my_data2 %>% 
  ggplot(aes(x = Rhett, y = Link, color = food)) +
  geom_point() +
  theme_bw() +
  labs(title = "We Tried EVERY Flavor!",
       subtitle = "How do Rhett and Link compare on flavor scores?",
       color = "Food")





###
### Option 3: 
###   - Without the skip option
###   - Using tidyverse to wrangle
###

my_data <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/We%20Tried%20EVERY%20Flavor.csv")
View(my_data)

# hmmm...this isnt' doing what I want it to.
# I don't know how to fix the import,
# But I do have some wrangling skills I can show off.

# Practice reading and understanding documentation!!
?slice()
?rename()

my_data2 <- my_data %>% 
  slice(-1) %>% # drop the first row
  rename(food = `We Tried EVERY Flavor`,
         flavor = X2,
         Rhett = X3,
         Link = X4) %>% # change the column names
  mutate(Rhett = as.numeric(Rhett),
         Link = as.numeric(Link)) # fix the data types

glimpse(my_data2)

# and finally...make the plot!
my_data2 %>% 
  ggplot(aes(x = Rhett, y = Link, color = food)) +
  geom_point() +
  theme_bw() +
  labs(title = "We Tried EVERY Flavor!",
       subtitle = "",
       color = "Food")
