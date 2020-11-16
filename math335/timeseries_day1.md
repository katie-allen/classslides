---
title: ''
author: ''
params:
  day: 2
  ptitle: yes
  pbackground: yes
  dtype: none
---



# Welcome to class! {data-background=#f7d754}

## Case Study Presentations

<!------------------------
# R-Studio Connect and Interaction {data-background=#f7d754}

## Setting up R-Studio

Time to set up our R-Studio to share interactive documents.

>- https://shiny.byui.edu/connect in R-Studio

Viewing on the website.

>- view with shiny.byui.edu/connect


## Example: library(DT) - DataTables

Make a new Rmd file that just has the following in it (including the default yaml). 




```r
library(DT)
datatable(iris)
```

----------------------->


<!-- Putting information in your file [My interactive](https://shiny.byui.edu/connect/#/apps/3/access) -->


<!------------------------------
## Try: library(DT) - DataTables

Look at the [DT: An R interface to the DataTables library](http://rstudio.github.io/DT/) website and find one or two modifications that you could make to your table output to move beyond the default.

> * Work as a group and push to R-Studio connect.
> * Make sure everyone at the table has the code saved on their computers.



```r
library(DT)
datatable(iris)
```



---------------->


<!--------------
# Being Readings {data-background=#f7d754}

## View Data at the Atomic Level

* "None of us would admit now that we didn't realize...there...had to be spread in the data; we...just didn't realize how big it could be."

* What key observations came by looking at the data
    *  small sample sizes
    *  values above 100%
    *  increasing # of patients at 100%

* The Mean is Not the Distribution
------------------>

# Time Series Data {data-background=#f7d754}

## What is a "time series"?




## ts and xts and zoos, oh my!

We are not going to take the time to get into the weeds of xt, xts, zoo.  Here are two locations where you can read till your heart is content - [1](https://faculty.washington.edu/ezivot/econ424/Working%20with%20Time%20Series%20Data%20in%20R.pdf), and [2](https://www.datacamp.com/courses/manipulating-time-series-data-in-r-with-xts-zoo).


> - [What is the difference in zoo, xts, and ts objects?](https://stackoverflow.com/questions/33714660/what-is-the-difference-the-zoo-object-and-ts-object-in-r)
<!-- ts is base r. ts objects are regularly spaced (quarters always 4, months always 12) -->

<!-- zoo is a separate package. Irregularly spaced time periods and can use most common index classes. has more functions -->
<!-- xts -->

> - [Why xts and FAQ?](http://joshuaulrich.github.io/xts/xts_faq.html)
<!-- xts offer additional functions beyond what zoo has by making reasonable constraints on the data types. -->


## Why xts?

**Q: Why should I use xts rather than zoo or another time-series package?**

The main benefit of xts is its seamless compatibility with other packages using different time-series classes (timeSeries, zoo, .). In addition, xts allows the user to add custom attributes to any object. See the main xts vignette for more information.


<!-- ## Matrix formats -->

<!-- **Q: Why is xts implemented as a matrix rather than a data frame?** -->

<!-- xts uses a matrix rather than data.frame because: 1) xts is a subclass of zoo, and that's how zoo objects are structured; and 2) matrix objects have much better performance than data.frames. -->



# The tidyquant Package

## tidyquant overview

https://business-science.github.io/tidyquant/

[Watch the video](https://www.youtube.com/embed/woxJZTL2hok)

What are the 3 core functions of tidy quant?

<!-- get: tq_get() -->
<!-- manipulate: tq_transmuate and tq_mutate() -->
<!-- analyze: tq_portfolio() and tq_performance() -->

## Getting Financial Data

`tq_get()`

## Manipulating Financial Data

`tq_transmute()` and `tq_mutate()`

## Performance Analysis

`tq_portfolio()` and `tq_performance()`

## tidyquant examples

Pick 4 stocks to look up.

<!-- THe video schowed how to get a list of all stocks in an index -->
<!-- do this part with a live demo only if there is time, or go through the "what does this command do" and then circle back for a live, full demo-->


```r
my_stocks <- c()
price_data <- tq_get(my_stocks,
       get = "stock.prices",
       from = "2020-09-14")
#You can add "to = " also
```


## tidyquant examples

Write out what this function is doing.
<!-- significance of tq_mutate vs. tq_transmute -->


```r
price_data %>% 
tq_transmute(select = adjusted,
               mutate_fun = periodReturn,
               period = "daily",
               type = "arithmetic")
```

**Hint:** Read about `quantmod::periodReturn()`

## tidyquant examples

Write out what this function is doing.


```r
return_data %>% 
  tq_portfolio(assets_col=symbol,
               returns_col=daily.returns,
               weights = tibble(asset.names = my_stocks, weight = c(0.190,.534,.207,.069)),
               wealth.index = T)
```

**Hint:** Read about `PerformanceAnalytics::Return.portfolio()`

## Task 19

# Settling In {data-background=#f7d754}

## Remember the Goal

"The most exciting phrase to hear in science, the one that heralds new discoveries, is not 'Eureka!' but 'That's funny...'" -Isaac Asimov

> - [Remembering Good Principles](https://youtu.be/fSgEeI2Xpdc)
> - [Rauser view on time and data](https://www.youtube.com/embed/coNDCIMH8bk?start=628) - 10:28 to 17:50

## Edward Tufte

> Graphical excellence is that which gives to the viewer the greatest number of ideas in the shortest time with the least ink in the smallest space

> Edward Tufte

<!--------------

# Next Class {data-background=#f7d754}

## dygraphs: R connection to dygraphs JavaScript charting library

Open the [dygraphs help website](http://rstudio.github.io/dygraphs/index.html) and implement one of their examples in your local R session.

---------------->
