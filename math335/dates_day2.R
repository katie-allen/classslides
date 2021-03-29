library(tidyverse)
library(lubridate)

# load the data
sales <- read_csv("https://byuistats.github.io/M335/data/sales.csv")

# check the time zone
head(sales); tz(sales$Time)

# convert time zones
sales$Time <- with_tz(sales$Time, "US/Mountain")
head(sales); tz(sales$Time)

# make sure you understand your data!
table(sales$Name)
table(sales$Name, sales$Type)
table(sales$Name, sales$Amount < 0)