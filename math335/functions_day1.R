count_threes <- function(a_number_vector){
  is_three <- a_number_vector == 3
  sum(is_three)
}


my_vector <- c(3,3,3,3,5,8,10,2)
count_threes(my_vector)

#--------------------------------------------------------
#--------------------------------------------------------

f1 <- function(string, prefix) {
  substr(string, 1, nchar(prefix)) == prefix
}

f1("unhappy", "un")




f2 <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
}

f2(c(1,2,3,4,5))

#--------------------------------------------------------
#--------------------------------------------------------

say_hello <- function(name){
  paste0("Hello ", name, "!")
}

say_hello("Jane")


hello_bob <- function(string){
  if(grepl("Bob", string)){
    return("Hello Bob!")
  } else {
    return("Hello.")
  }
}

hello_bob("abc_Bob_xyz")
hello_bob("Jane")


calculate_avg <- function(num1, num2){
  mean(c(num1, num2))
}

calculate_avg(c(1,2,3,4,5), c(11,12,13,14,15))


#--------------------------------------------------------
#--------------------------------------------------------

library(tidyverse)

# load data
class_data <- read_csv("https://byuistats.github.io/M335/data/waitlist_DP_108.csv")
glimpse(class_data)

# convert date column
class_data <- class_data %>% mutate(date = lubridate::mdy_hm(`Registration Date`))
glimpse(class_data)

# filter
class_data_18 <- class_data %>% filter(`Course Sec` == "FDMAT108-18")
View(class_data_18)

# Take a good, long look at the data to 
# figure out what is going on


# Get the most current status.
#   think: do two rows ever have the same time stamp?
#          why would that happen?
#          what else do we need to sort on?
current_status <- class_data_18 %>% 
  arrange(`Person ID`, desc(date), desc(Status)) %>% 
  group_by(`Person ID`) %>% 
  slice_head(n = 1) %>% 
  ungroup() %>% 
  select(`Person ID`, Status, `Waitlist Reason`, date)
head(current_status)

# How many students are currently registered?
table(current_status$Status)

# How do we know which of those students came from the waitlist?
table(current_status$Status, current_status$`Waitlist Reason`)

# Calculate the numerator (top of fraction) 
# and the denominator (bottom of fraction)
n_current_registered <- sum(current_status$Status == "Registered")
n_registered_from_waitlist <- sum(current_status$`Waitlist Reason` == "Waitlist Registered", na.rm = TRUE)

# And the final percentage:
n_registered_from_waitlist / n_current_registered

# Your turn.
# Make a function that follow the same steps as above.
# Bonus: can you think of a better function name?

my_function_1 <- function(input1, input2, etc){
  # How many inputs do you need?
  
  # Follow the same steps as above
  
  # And then return the percentage
  return(put_something_here)
}

# Test your function to make sure it works!

#---------------------------------------------------------
#---------------------------------------------------------


























# how many registered students are there? 
# 77
class_data_18 %>% count(Status)

# are you sure?
# 77
class_data_18 %>% distinct(`Person ID`, Status) %>% count(Status)

# what about now?
# 66
class_data_18 %>% 
  group_by(`Person ID`) %>% 
  arrange(date) %>% 
  slice_tail(n = 1) %>% 
  ungroup() %>% 
  count(Status)


# how many students have ever been on the waitlist?
# 62
class_data_18 %>% 
  filter(Status == "Wait List") %>% 
  distinct(`Person ID`) %>% 
  nrow()

# overlap
# 14
class_data_18 %>% 
  group_by(`Person ID`) %>% 
  arrange(date) %>% 
  slice_tail(n = 1) %>% 
  ungroup() %>% 
  filter(Status == "Registered") %>% 
  count(`Waitlist Reason`)









# num who had been waitlist and are currently registered (14)
temp <- class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>%
  mutate(ever_waitlisted = "Wait List" %in% Status) %>% 
  slice_tail() %>% 
  filter(Status == "Registered") %>%
  filter(ever_waitlisted == TRUE) %>% 
  pull('Person ID') %>% 
  n_distinct()



# The % of those who were ever on the waitlist that ended up registering for the class (and staying registered)

# total # of waitlisted studnets than ended up registering
# --------------------------------------------------------
#         total # of students ever on waitlist








#-----------------------
#-----------------------
#-----------------------


class_data_all <- read_csv("https://byuistats.github.io/M335/data/waitlist_DP_108.csv")
class_data_all <- class_data_all %>% mutate(date = lubridate::mdy_hm(`Registration Date`))

class_data18 <- class_data_all %>% filter(`Course Sec` == "FDMAT108-18")



#---------------------------------------------------------------------
#---------------------------------------------------------------------

# Ok, let's figure out how to count things 
# BEFORE trying to make a function



# num waitlisted (62)
class_data18 %>% 
  filter(Status == "Wait List") %>% 
  distinct(`Person ID`, Status) %>% 
  nrow()

# num currently registered currently (66)
class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>% 
  slice_tail() %>% 
  ungroup() %>% 
  count(Status)
  
class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>% 
  slice_tail() %>% 
  filter(Status == "Registered") %>% 
  pull('Person ID') %>% 
  n_distinct()


class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>% 
  slice_tail() %>% 
  filter(Status == "Registered") %>% 
  nrow()


# num who had been waitlist and are currently registered (14)
temp <- class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>%
  mutate(ever_waitlisted = "Wait List" %in% Status) %>% 
  slice_tail() %>% 
  filter(Status == "Registered") %>%
  filter(ever_waitlisted == TRUE) %>% 
  pull('Person ID') %>% 
  n_distinct()


14/62 # percent of waitlisted that made it in
14/66 # percent of current class that was on the waitlist


#----------------------------------------------------------
#----------------------------------------------------------

# Ok, now how do we calculate the percentages we want?

# percent of waitlist that are current students
class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>%
  mutate(ever_waitlisted = "Wait List" %in% Status,
         in_class = "Registered" == Status[n()]) %>%
  #ungroup() %>% 
  filter(ever_waitlisted == TRUE) %>% 
  distinct(`Person ID`, ever_waitlisted, in_class) %>% 
  #summarize(prop = mean(in_class))
  pull(in_class) %>% 
  mean()

# Brother Palmer's code:
dat1 <- class_data18 %>% 
  arrange(`Person ID`, desc(date), desc(Status)) %>% 
  #We sorted the dataset so that we could take the top row as the most recent transaction
  distinct(`Person ID`, .keep_all = TRUE) %>% 
  #count up the people whose most recent transaction was to be registered
  summarise(registered = sum(Status == "Registered"), 
            #count of the people who came from the waitlist
            reg_from_wl = sum(`Waitlist Reason` == "Waitlist Registered", na.rm = TRUE)) 
dat1$reg_from_wl / dat1$registered


# percent of current students that were once waitlisted
class_data18 %>% 
  arrange(`Person ID`, date, Status) %>% 
  group_by(`Person ID`) %>%
  mutate(ever_waitlisted = "Wait List" %in% Status,
         in_class = "Registered" == Status[n()]) %>%
  #ungroup() %>% 
  filter(in_class == TRUE) %>% 
  distinct(`Person ID`, ever_waitlisted, in_class) %>% 
  #summarize(prop = mean(ever_waitlisted))
  pull(ever_waitlisted) %>% 
  mean()



#----------------------------------------------------------
#----------------------------------------------------------


# Now put everything into a function:

# Brother Palmer's code
registered_from_waitlist <- function(transaction_data){
  
  
  dat1 <- transaction_data %>% arrange(person_id, desc(date), desc(Status)) %>% 
    distinct(person_id, .keep_all = TRUE) %>% #We sorted the dataset so that we could take the top row as the most recent transaction
    summarise(registered = sum(Status == "Registered"), #count up the people whose most recent transaction was to be registered
              reg_from_wl = sum(waitlist_reason == "Waitlist Registered", na.rm = TRUE)) #count of the people who came from the waitlist
  
  dat1$reg_from_wl / dat1$registered
  
}


# First question

registered_div_waitlist <- function(df){
  df %>% 
    arrange(`Person ID`, date, Status) %>% 
    group_by(`Person ID`) %>%
    mutate(ever_waitlisted = "Wait List" %in% Status,
           in_class = "Registered" == Status[n()]) %>%
    filter(ever_waitlisted == TRUE) %>% 
    distinct(`Person ID`, ever_waitlisted, in_class) %>% 
    pull(in_class) %>% 
    mean()
}

registered_div_waitlist(class_data18)

# Second Question

waitlist_div_registered <- function(df){
  df %>% 
    arrange(`Person ID`, date, Status) %>% 
    group_by(`Person ID`) %>%
    mutate(ever_waitlisted = "Wait List" %in% Status,
           in_class = "Registered" == Status[n()]) %>%
    filter(in_class == TRUE) %>% 
    distinct(`Person ID`, ever_waitlisted, in_class) %>% 
    pull(ever_waitlisted) %>% 
    mean()
}

waitlist_div_registered(class_data18)




### Cody's function
popPercent <- function(dataset, colname, groupCol, condition){
  
  colname <- enquo(colname)
  groupCol <- enquo(groupCol)
  did_wait <- dataset %>%
    group_by(!!colname) %>%
    summarise(percent = mean((!!colname) == condition))
  did_wait
}

popPercent(class_data18, Status, `Person ID`, "Wait List")

class_data18 %>% popPercent(colname = Status, groupCol = `Person ID`, condition = "Wait List")




#-----------------------------------------------------------------
#-----------------------------------------------------------------

# Ok, now let's run the function on EVERY section! 

temp <- class_data_all %>% 
  group_by(`Course Sec`) %>% 
  nest() %>% 
  mutate(prop_waitlist = purrr::map(data, registered_div_waitlist))
temp

temp <- class_data_all %>% 
  group_by(`Course Sec`) %>% 
  nest() %>% 
  mutate(prop_waitlist = purrr::map(data, registered_div_waitlist)) %>% 
  unnest(cols = c(data, prop_waitlist))
temp

temp <- class_data_all %>% 
  group_by(`Course Sec`) %>% 
  nest() %>% 
  mutate(prop_waitlist = purrr::map(data, registered_div_waitlist)) %>% 
  select(-data) %>% 
  unnest(cols = c(prop_waitlist))
temp

temp <- class_data_all %>% 
  group_by(`Course Sec`) %>% 
  nest() %>% 
  mutate(prop_waitlist = purrr::map_dbl(data, registered_div_waitlist))
temp




temp <- class_data_all %>% 
  group_by(`Course Sec`) %>% 
  nest() %>% 
  mutate(prop_waitlist = purrr::map_dbl(data, registered_div_waitlist),
         prop_registered = purrr::map_dbl(data, waitlist_div_registered)) %>% 
  unnest(cols = data) %>% 
  distinct(`Course Sec`, `Semester Term Code`, prop_waitlist, prop_registered)
temp

temp %>% 
  pivot_longer(cols = c(prop_waitlist, prop_registered),
               names_to = "cat",
               values_to = "prop") %>% 
  ggplot(aes(x = `Semester Term Code`, 
             y = prop, 
             color = `Course Sec`, 
             shape = cat)) +
  geom_point()

temp %>% 
  ggplot(aes(x = prop_waitlist, 
             y = prop_registered, 
             color = `Course Sec`,
             shape = `Semester Term Code`)) +
  geom_point()
