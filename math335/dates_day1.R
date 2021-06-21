library(tidyverse)
library(lubridate)

mdy("January 21st, 2017")
ymd("2012-01-01")
myd("March 2016 - 23")


?make_date


# First try this.
date_cols <- tibble(month = c(1, 3, 7), 
                    day = c(23, 18, 1), 
                    year = c(2017, 2017, 2016))
date_cols

date_cols %>% mutate(my_date = make_date(year, month, day))
date_cols %>% mutate(my_date = make_datetime(year, month, day))


# Then try this. Will this one work in make_date()?
date_cols <- tibble(month = c("Jaunary", "March", "July"), 
                    day = c(23, 18, 1), 
                    year = c(2017, 2017, 2016))
date_cols

date_cols %>% mutate(my_date = make_date(year, month, day))




jan15 <- ymd("2013-01-15")
jan15
jan15 + months(1)

jan31 <- ymd("2013-01-31")
jan31
jan31 + months(1)

jan31 <- ymd("2013-01-31")
jan31
jan31 %m+% months(1)

jan31 <- mdy_hms("January 31st, 2013 06:35:27")
jan31
jan31 + hours(27) + minutes(15)




x <- ymd_hms("2009-07-01 2:01:59.23")
x
quarter(x)
floor_date(x, "quarter")
floor_date(x, "3 months")

with_tz(x, "US/Mountain")
quarter(with_tz(x, "US/Mountain"))
floor_date(with_tz(x, "US/Mountain"), "quarter")
floor_date(with_tz(x, "US/Mountain"), "3 months")

force_tz(x, "US/Mountain")
quarter(force_tz(x, "US/Mountain"))
floor_date(force_tz(x, "US/Mountain"), "quarter")
floor_date(force_tz(x, "US/Mountain"), "3 months")

