---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Welcome to class! {data-background=#e8c35d}

# This week I learned... {data-background=#e8c35d}

# How to Visualize Time {data-background=#e8c35d}

## Time Visualization examples

[Plotly Blog](https://plotlyblog.tumblr.com/post/117105992082/time-series-graphs-eleven-stunning-ways-you-can)

## The March Visualization

In his iconic flow map of Napoleon's catastrophic 1812 invasion of Russia, Charles Joseph Minard blends and bends temporal and spatial representations. The path and number of outward-bound soldiers is represented by an initially thick tan ribbon while the dwindling numbers of retreating survivors are represented by a narrowing black band. In this visualization, the time it took to march into Russia is not clear. The only time stamps shown are for the return trip and progressing from right to left. In a sense, time is "bent" to advance the impact of the visual narrative.

> - [The Image](http://uxmag.com/sites/default/files/uploads/whitney-its-about-time/Minard.png)
> - [In English](https://en.wikipedia.org/wiki/Charles_Joseph_Minard#/media/File:Minard_Update.png)

## The Walmart March Visualization

> - [Small multiples and time](http://excelcharts.com/wp-content/uploads/2012/06/walmart-growth-micromaps1.png)
> - [Without spatial](http://excelcharts.com/wp-content/uploads/2012/06/walmart-reorderable-matrix.png)

## The wind march

> - [Current Wind](http://hint.fm/wind/)

# Questions and Work Time {data-background=#e8c35d}

## Time Before Christ

Summary: It's harder than I thought. Don't worry about it unless you have to.

>- ?as.Date says: "Years before 1CE (aka 1AD) will probably not be handled correctly."
>- [lubridate issue](https://github.com/tidyverse/lubridate/issues/2)
>- [advice on stackoverflow](https://stackoverflow.com/questions/877366/what-is-the-best-way-to-handle-dates-before-christ-in-c-net)

## Dates in R: behind the scenes

[Unix time](https://en.wikipedia.org/wiki/Unix_time) is the number of seconds that have elapsed since the **Unix epoch**, which is January 1 1970.

```
library(lubridate)

as_date(9910)
## [1] "1997-02-18"

as_date(0)
## [1] "1970-01-01"

as_date(-678)
## [1] "1968-02-23"

as.numeric(date("1970-01-01"))
## [1] 0
```

<!----------
## default lubridate time zone: UTC

[Coordinated Universal Time (UTC)]() is the default time zone in lubridate. If you load date data or convert something to a date without specifiying the time zone, UTC is used.

## Move into R

[code](http://ktoutloud.github.io/classslides/math335/dates_day2_notes.R)
---------------------->
