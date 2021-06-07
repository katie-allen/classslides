#################################################
##          Functions: Class Examples          ##
#################################################

## How to write a function

count_threes <- function(a_number_vector){
  is_three <- a_number_vector == 3
  sum(is_three)
}


my_vector <- c(3,3,3,3,5,8,10,2)
count_threes(my_vector)


#-------------------------------------------------

## What do these functions do?

f1 <- function(string, prefix) {
  substr(string, 1, nchar(prefix)) == prefix
}

f1("unhappy", "un")




f2 <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
}

f2(c(1,2,3,4,5))


#-------------------------------------------------

## Some more examples of functions

# example one
say_hello <- function(name){
  paste0("Hello ", name, "!")
}

say_hello("Jane")

# example two
hello_bob <- function(string){
  if(grepl("Bob", string)){
    return("Hello Bob!")
  } else {
    return("Hello.")
  }
}

hello_bob("abc_Bob_xyz")
hello_bob("Jane")

# example three
calculate_avg <- function(num1, num2){
  mean(c(num1, num2))
}

calculate_avg(c(1,2,3,4,5), c(11,12,13,14,15))


#-------------------------------------------------
#-------------------------------------------------

## Task 17: Waitlisted

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
#
# Go ahead, I'll wait.

# Goal: Get the most current status.
# Think: do two rows ever have the same time stamp?
#        why would that happen?
#        what else do we need to sort on?
current_status <- class_data_18 %>% 
  arrange() %>% 
  group_by() %>% 
  slice_head() %>% 
  ungroup() %>% 
  select()

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

# Test your function tomake sure it works!
my_function_1()
