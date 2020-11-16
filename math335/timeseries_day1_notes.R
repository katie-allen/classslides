#------------- TIME SERIES -------------

?ts()

myvector <- runif(72) + (1:72)/100
myvector

# save a numeric vector containing 72 monthly observations
# from Jan 2009 to Dec 2014 as a time series object
myts <- ts(myvector, start=c(2009, 1), end=c(2014, 12), frequency=12)
myts

# subset the time series (June 2014 to December 2014)
myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12))
myts2

# plot series
plot(myts)

class(myts)
frequency(myts)

# Seasonal decomposition
fit <- stl(myts, s.window="period")
plot(fit)

# additional plots
monthplot(myts)
library(forecast)
seasonplot(myts)


#----------------- TIDYQUANT -----------------

library(tidyverse)
library(tidyquant)


my_stocks <- c("BA", "GILD", "AAPL","DOMO")
price_data <- tq_get(my_stocks,
                  get = "stock.prices",
                  from = "2020-09-14")
price_data

# difference between "arithmetic" and "log" returns:
# https://chandlerfang.com/2017/01/09/arithmetic-vs-logarithmic-rates-of-return/

price_data %>% 
  group_by(symbol) %>% 
  tq_mutate(select = adjusted,
               mutate_fun = periodReturn,
               period = "daily",
               type = "arithmetic")

price_data %>% 
  group_by(symbol) %>% 
  tq_mutate(select = adjusted,
            mutate_fun = periodReturn,
            period = "monthly",
            type = "arithmetic")

price_data %>% 
  group_by(symbol) %>% 
  tq_transmute(select = adjusted,
            mutate_fun = periodReturn,
            period = "monthly",
            type = "arithmetic")




return_data <- price_data %>% 
  group_by(symbol) %>% 
  tq_transmute(select = adjusted,
               mutate_fun = periodReturn,
               period = "daily",
               type = "arithmetic")

return_data %>% 
  tq_portfolio(assets_col=symbol,
               returns_col=daily.returns,
               weights = tibble(asset.names = my_stocks, weight = c(0.190,.534,.207,.069)),
               wealth.index = F)

return_data %>% 
  tq_portfolio(assets_col=symbol,
               returns_col=daily.returns,
               weights = tibble(asset.names = my_stocks, weight = c(0.190,.534,.207,.069)),
               wealth.index = T)

