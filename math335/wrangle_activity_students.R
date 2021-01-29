#===== PART ONE ====================================

library(tidyverse)
?msleep
View(msleep)

# GOAL: For each "vore", find the animals with the greatest and the smallest brain-to-body weight ratio.

# INSTRUCTIONS: ***Without running any R code*** write out (in English) the steps
#               to create a table (a new data frame) that meets the goal above.

# STEPS:





#===== PART TWO ====================================

# GOAL: Which marital status had the greatest difference in average tv hours watched 
#       between people who make less than $1000 and people who make $25000 or more?

# INSTRUCTIONS: Follow the steps below to create a new data frame

# STEPS:
# 1. Load the tidyverse package
# 2. Start with the gss_cat dataset and only keep rows where the income is "Lt $1000" or "$25000 or more"
# 3. For each combination of marital status and income level, calculate the mean hours of tv watched
# 4. Keep only the columns with the marital, income, and mean tv hours information
# 5. Get rid of duplicate rows
# 6. Sort the rows by marital status, then income level, then mean tv hours
# 7. For each marital status, calculate the difference between mean tv hours for people 
#    who make "$25000 or more" and people who make "Lt $1000"
# 8. Sort the rows by the difference in mean tv hours, greatest to smallest







#===== PART THREE ====================================

# INSTRUCTIONS: Take a few minutes to discuss the following functions as a group.
#               Ensure you know what they are used for / how to use them.
#               Write a code example you can share with the class.

# Group 1: is.na()
# Group 2: case_when()
# Group 3: top_n()
# Group 4: %in%
# Group 5: distinct()
# Group 6: n_distinct()






