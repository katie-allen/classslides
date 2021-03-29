library(tidyverse)




################################################################
##                                                            ##
##          The purrr function: Example with iris             ##
##                                                            ##
################################################################

# Creating a "nested" data set ---------------------------------

head(iris)

nested_iris <- iris %>% group_by(Species) %>% nest()
nested_iris




# Example 1 ----------------------------------------------------

# Calculate the mean of Sepal.Width for each Species
# Note that this function takes an *entire dataset* as input

my_mean <- function(input_data){
  mean(input_data$Sepal.Width)
}

# we can use "map_dbl" from the purrr package because
# we know the function is only going to return a single number

nested_iris %>% mutate(sepal_width_mean = map_dbl(data, my_mean))




# Example 2 ----------------------------------------------------

# calculate a linear regression of Sepal.Width on Sepal.Length

my_model <- function(df){
  lm(formula = Sepal.Width ~ ., data = df)
}

# what does this output look like?
# now we are using the "map" function from purrr, because
# this function return more than a single number

nested_iris %>% mutate(model = map(data, my_model))

# how can we access the linear models inside of the "model" column??

iris_models <- nested_iris %>% mutate(model = map(data, my_model))
iris_models

iris_models$model[[1]]




# How to simplify results --------------------------------------


# If your function returns a single value (mean)...

#...just get rid of the "data" column with the mini-datasets

nested_iris %>%
  mutate(sepal_width_mean = map_dbl(data, my_mean))  %>%
  select(-data)

#...or you can choose to "unnest" the mini-datasets

View(nested_iris %>%
       mutate(sepal_width_mean = map_dbl(data, my_mean))  %>%
       unnest(cols = c(data)))


# If your function returns a list (linear model)
# then....you're stuck with a complicated, nested dataset







################################################################
##                                                            ##
##                 Task 17: The first function                ##
##                                                            ##
################################################################

# load data
class_data <- read_csv("https://byuistats.github.io/M335/data/waitlist_DP_108.csv")

# convert date column
class_data <- class_data %>% mutate(date = lubridate::mdy_hm(`Registration Date`))

# filter
class_data_18 <- class_data %>% filter(`Course Sec` == "FDMAT108-18")



# STEP ONE -----------------------------------------------------

# Before you can solve these problems, it is *critical* for
# you do understand the data.
#  - What does one row represent?
#  - Can a student have multiple rows?
#  - Why would a student have multiple rows?
#  - What are the options for "Status"
#  - Can two status updates happen at the same time? Why?

View(class_data_18)



# STEP TWO -----------------------------------------------------

# What do we need to count to calculate the first percentage/fraction?

# We need:
#   - numer of currently registered students that came from waitlist (top number)
#   - number of currently registered students (bottom number)

# I might run into problems if a student registered for the class
# and then dropped the class.

# I want to find the CURRENT status of each student:


current_status <- class_data_18 %>%                     # starting data
  arrange(`Person ID`, desc(date), desc(Status)) %>%    # forces current status to be top row
  group_by(`Person ID`) %>%                             # for each student...
  slice_head(n = 1) %>%                                 # ...keep only the top row
  ungroup() %>%                                         #
  select(`Person ID`, Status, `Waitlist Reason`, date)  # these are the only columns we care about now

head(current_status)




# STEP THREE ---------------------------------------------------

# Q: How many students are currently registered?
# A: 66
table(current_status$Status)

# Q: How many students are currently registered, that used to be on the waitlist?
# A: 14
table(current_status$Status, current_status$`Waitlist Reason`)

# Now we're ready to calculate the percentage!

n_registered <- sum(current_status$Status == "Registered")

n_registered_from_waitlist <- sum(current_status$`Waitlist Reason` == "Waitlist Registered", na.rm = TRUE)

n_registered_from_waitlist / n_registered



# STEP FOUR ----------------------------------------------------

# Your turn.
# Make a function that follow the same steps as above.
# Bonus: can you think of a better function name?

my_function_1 <- function(df){
  
  # find current status
  current_status <- df %>%
    arrange(`Person ID`, desc(date), desc(Status)) %>%
    group_by(`Person ID`) %>%
    slice_head(n = 1) %>%
    ungroup() %>%
    select(`Person ID`, Status, `Waitlist Reason`, date)
  
  # count students
  n_registered <- sum(current_status$Status == "Registered")
  n_registered_from_waitlist <- sum(current_status$`Waitlist Reason` == "Waitlist Registered", na.rm = TRUE)
  
  # return percentage
  return(n_registered_from_waitlist / n_registered)
}


# Test your function to make sure it works!
my_function_1(class_data_18)


##
## YOUR TURN:
## Write a function that calculate this percentage:
##
##  number of waitlisted students that made it into class (are currently registered)
## ----------------------------------------------------------------------------------
##                           number of waitlist students
##




################################################################
##                                                            ##
##                 Task 18: The first function                ##
##                                                            ##
################################################################

class_data %>%
  group_by(`Course Sec`) %>%
  nest() %>%
  mutate(the_output = map_dbl(data, my_function_1))

# or try this.....

class_data %>%
  group_by(`Course Sec`) %>%
  nest() %>%
  mutate(the_output = map_dbl(data, my_function_1)) %>% 
  select(-data)

# or this.....

class_data %>%
  group_by(`Course Sec`) %>%
  nest() %>%
  mutate(the_output = map_dbl(data, my_function_1)) %>% 
  unnest(data)

##
## YOUR TURN:
## Calcualte the second percentage for every section.
## Then, make some plots. 
##
## How to these two percentages relate to one another?
## Are there any other variables in the dataset that affect the waitlist percentages?
##