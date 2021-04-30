#####################################
##   Research and Creative WOrks   ##
#####################################

# the two packages you need (or load the tidyverse)
library(readr)
library(ggplot2)

# load the data
rcw <- read_csv("https://byuistats.github.io/M335/data/rcw.csv", 
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"), 
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))

# different ways to view your data
head(rcw)
View(rcw)



#####################################
# NYC Flights
#####################################

install.packages("nycflights13")
library(nycflights13)

# think - pair - share

?flights
View(flights)
glimpse(flights)

# QQ -----------------------
ggplot(flights) + geom_histogram(aes(dep_time))
ggplot(flights) + geom_histogram(aes(dep_delay))

ggplot(flights) + geom_boxplot(aes(dep_time))
ggplot(flights) + geom_boxplot(aes(dep_delay))


# how many points????
dim(flights)
ggplot(flights) + geom_point(aes(dep_time, dep_delay))

ggplot(flights) + geom_bin2d(aes(dep_time, dep_delay))
ggplot(flights) + geom_hex(aes(dep_time, dep_delay))



# QC -----------------------

ggplot(flights) + geom_histogram(aes(dep_delay))
ggplot(flights) + geom_bar(aes(origin))

ggplot(flights) + geom_point(aes(origin, dep_delay))

ggplot(flights) + geom_boxplot(aes(x=origin, y=dep_delay))
ggplot(flights) + geom_violin(aes(x=origin, y=dep_delay))



#####################################
# Case Study 
#####################################

install.packages("gapminder")
library(gapminder)

?gapminder
View(gapminder)
glimpse(gapminder)

gap <- filter(.data = gapminder, country != "Kuwait")



#










#####################################
##             TASK 6              ##
#####################################

# load packages
library(tidyverse)

# load the data
rcw <- read_csv("https://byuistats.github.io/M335/data/rcw.csv", 
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"), 
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))

rcw

# Let's rebuild Michael's graph layer by layer

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point()

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_line()

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point() +
  geom_line()

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point() +
  geom_line() +
  facet_wrap(~ Department, nrow = 2)

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point(show.legend = FALSE) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~ Department, nrow = 2)

# We've identified something we want to change. Now comes the hard part.

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point(show.legend = FALSE) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~ Department, nrow = 2) +
  scale_x_discrete(breaks = c("2016-04-01", "2016-09-01", "2017-01-01", "2017-04-01", "2017-09-01","2018-01-01"),
                   labels = c("S16", "F16", "W17", "S17", "F17", "W18"))

# https://www.google.com/search?rlz=1C1GCEJ_enUS882US882&sxsrf=ALeKk03hFLH3JJfL6N_JgMjALRqU2p7RmQ%3A1611333358158&ei=7v4KYIiHCZXrtQa9wb3IBA&q=ggplot+scale_x_Date+breaks&oq=ggplot+scale_x_Date+breaks&gs_lcp=CgZwc3ktYWIQAzIFCAAQyQMyBggAEBYQHjIGCAAQFhAeMgYIABAWEB46BwgAEEcQsAM6CggAEMkDEBQQhwI6BwgAEBQQhwI6AggAUKAkWOcnYNAoaAFwAngAgAF8iAHSBJIBAzYuMZgBAKABAaoBB2d3cy13aXrIAQjAAQE&sclient=psy-ab&ved=0ahUKEwiItrXD_K_uAhWVdc0KHb1gD0kQ4dUDCA0&uact=5
# https://ggplot2.tidyverse.org/reference/scale_Date.html
# https://www.statworx.com/at/blog/customizing-time-and-rcwe-scales-in-ggplot2/

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point(show.legend = FALSE) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~ Department, nrow = 2) +
  scale_x_date(breaks = c("2016-04-01", "2016-09-01", "2017-01-01", "2017-04-01", "2017-09-01","2018-01-01"),
                   labels = c("S16", "F16", "W17", "S17", "F17", "W18"))

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point(show.legend = FALSE) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~ Department, nrow = 2) +
  scale_x_date(breaks = as.Date(c("2016-04-01", "2016-09-01", "2017-01-01", "2017-04-01", "2017-09-01","2018-01-01")),
               labels = c("S16", "F16", "W17", "S17", "F17", "W18"))


#####


# https://www.google.com/search?q=ggplot+hide+legend&rlz=1C1GCEJ_enUS882US882&oq=ggplot+hide+legend&aqs=chrome..69i57j0l2j0i22i30j0i22i30i395l4.35959j1j4&sourceid=chrome&ie=UTF-8

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point() +
  geom_line() +
  facet_wrap(~ Department, nrow = 2) +
  scale_x_date(breaks = as.Date(c("2016-04-01", "2016-09-01", "2017-01-01", "2017-04-01", "2017-09-01","2018-01-01")),
               labels = c("S16", "F16", "W17", "S17", "F17", "W18")) +
  theme(legend.position = "none")

ggplot(rcw, aes(x = Semester_Date, y = Count, color = Department)) +
  geom_point() +
  geom_line() +
  scale_x_date(breaks = as.Date(c("2016-04-01", "2016-09-01", "2017-01-01", "2017-04-01", "2017-09-01","2018-01-01")),
               labels = c("S16", "F16", "W17", "S17", "F17", "W18"))





###############################################
###############################################





# What I did:

glimpse(rcw)
head(rcw)

# create new variable to show both semester and year
rcw <- rcw %>% 
  mutate(Semester_Year = paste0(substr(Semester, 1, 1), substr(Year, nchar(Year)-1, nchar(Year))))
head(rcw)

# ok, create a new graph!
rcw %>% 
  ggplot(aes(x = Semester_Date, y = Count, group = Department)) +
  geom_line()

rcw$Semester_Year2 <- reorder(rcw$Semester_Year, rcw$Semester_Date)
class(rcw$Semester_Year)
class(rcw$Semester_Year2)

rcw %>% 
  ggplot(aes(x=Semester_Year2, y=Count, group=Department, color=Department)) +
  geom_line(size=.75) +
  geom_point(size=2) +
  scale_color_hue(labels = c("CHEM","CCEE","DCM","GEO","MATH","ME","PHY")) + 
  labs(x="Semester",
       y="Student Count",
       title="Participation in Research and Creative Works Conference") +
  theme_bw(base_size = 13) +
  theme(panel.grid.major.x = element_blank())
