library(tidyverse)
library(tidyquant)
library(lubridate)
library(dygraphs)
library(xts)
library(timetk)

# get stock prices
tickers_today <- c("AAPL", "DIS", "NKE")
stock <- tq_get(tickers_today, get = "stock.prices", from = today() - years(3))
stock

# take a close look at the dygraphs example
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths)

head(mdeaths)
head(fdeaths)
head(lungDeaths)

# huh.

# I don't know if the `xts()` function will work
?xts()
stock.xts <- xts(x = stock$adjusted, order.by = stock$date)
head(stock.xts)

# maybe this would help us?
?tk_xts()

# what do we need to change in our data?

# pivot
stock %>% 
  select(date, adjusted, symbol) %>% 
  pivot_wider(names_from = symbol, values_from = adjusted)

# convert it into a time series
stock.xts <- stock %>% 
  select(date, adjusted, symbol) %>% 
  pivot_wider(names_from = symbol, values_from = adjusted) %>% 
  tk_xts() 
head(stock.xts)

# plot it!
stock.xts %>% dygraph(main="Adjusted Closing Price of Stocks")

stock.xts %>%
  dygraph(main="Adjusted Closing Price of Stocks") %>% 
  dyLegend(width = 600) %>% 
  dyHighlight(highlightCircleSize = 3, 
              highlightSeriesBackgroundAlpha = 0.2,
              hideOnMouseOut = TRUE) %>% 
  dyRangeSelector()

#------------------------------

stock
