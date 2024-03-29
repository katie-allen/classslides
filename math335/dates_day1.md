---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Working with Time {data-background=#e8c35d}

Welcome to class!

## Case Studies


<!---------
## The movie march

What do we like? dislike?

> - [Movie Performance over Time](http://www.nytimes.com/interactive/2008/02/23/movies/20080223_REVENUE_GRAPHIC.html?_r=0)
---------------->



<!--------------
# The truthful Art by Alberto Cairo {data-background=#e8c35d}

## Data Ethics

> We live in a world with a surfeit of information at our service. It is our choice whether we seek out data that reinforce our biases or choose to look at the world in a critical, rational manner, and allow reality to bend our preconceptions. In the long run, the truth will work better for us than our cherished fictions. [-Razib Khan, "The Abortion Stereotype,"](https://books.google.com/books?id=8dKKCwAAQBAJ&pg=PT153&lpg=PT153&dq=We+live+in+a+world+with+a+surfeit+of+information+at+our+service.+It+is+our+choice+whether+we+seek+out+data+that+reinforce+our+biases+or+choose+to+look+at+the+world+in+a+critical,+rational+manner,+and+allow+reality+to+bend+our+preconceptions.+In+the+long+run,+the+truth+will+work+better+for+us+than+our+cherished+fictions.&source=bl&ots=8S-rNM2MHH&sig=ACfU3U181wRraZCUG1660FODaAj6p0xHSA&hl=en&sa=X&ved=2ahUKEwjhz-iog9jgAhWKsp4KHdi-DBEQ6AEwAHoECAoQAQ#v=onepage&q=We%20live%20in%20a%20world%20with%20a%20surfeit%20of%20information%20at%20our%20service.%20It%20is%20our%20choice%20whether%20we%20seek%20out%20data%20that%20reinforce%20our%20biases%20or%20choose%20to%20look%20at%20the%20world%20in%20a%20critical%2C%20rational%20manner%2C%20and%20allow%20reality%20to%20bend%20our%20preconceptions.%20In%20the%20long%20run%2C%20the%20truth%20will%20work%20better%20for%20us%20than%20our%20cherished%20fictions.&f=false)


## Paul's Version

> For the time will come when people will not put up with sound doctrine. Instead, to suit their own desires, they will gather around them a great number of teachers to say what their itching ears want to hear. They will turn their ears away from the truth and turn aside to myths. [- Paul (2 Timothy 4:3-4 **NIV**)](https://www.biblegateway.com/passage/?search=2+Timothy+4%3A3-4&version=NIV)

## John A Widstoe's Version

> Intelligent people cannot long endure ... doubts.  It must be resolved ... We set about to remove doubt by gathering information and making tests concerning the subject in question... [- Evidences and Reconciliations, pg. 31](http://www.cumorah.com/etexts/evidencesreconciliations.txt)

## Scientific Discovery

## Defining the terms

1. conjecture
2. hypothesis
3. data/test
4. conclusions

## The process

These steps may open researchers' eyes to new paths to explore, so they don't constitute a process with a beginning and an end point but a loop. ...

* **Good answers lead to more good questions.**
* The scientific stance will never take us all the way to an absolute, immutable truth.
* What it may do-and it does it well-is to move us further to the right in the truth continuum.

## The Big Idea

Data always vary randomly because the object of our inquiries, nature itself, is also random. We can analyze and predict events in nature with an increasing amount of precision and accuracy, thanks to improvements in our techniques and instruments, **but a certain amount of random variation, which gives rise to uncertainty, is inevitable.**

## The suspects (Intro)

> * Always be suspicious of studies whose samples have not been randomly chosen
> * Not all scientific research is based on random sampling, but analyzing a random sample of the population will yield more accurate results than a cherry-picked or self-selected sample.

## The suspects (confounding)

> * Some researchers distinguish between two kinds of extraneous variables. Sometimes we can identify an extraneous variable and incorporate it into our model, in which case we'd be dealing with a **confounding variable**.
>    * I know that it may affect my results, so I consider it for my inquiry to minimize its impact.
>    * For example, we could control for population change and for variation in number of motor vehicles when analyzing deaths in traffic accidents.

## The suspects (lurking)

> * There's a second, more insidious kind of extraneous variable. Imagine that I don't know that my friends are indeed geeky. If I were unaware of this, I'd be dealing with a **lurking variable**.
>    * A lurking variable is an extraneous variable that we don't include in our analysis for the simple reason that its existence is unknown to us, or because we can't explain its connection to the phenomenon we're studying.

--------------->

# Dates and Times {data-background=#e8c35d}

## Can you answer these questions?

<br>

- Does every year have 365 days?
- Does every day have 24 hours?
- Does every minute have 60 seconds?

## Other fun things to consider

<br>

- Hawaii does not observe Daylight Saving Time and neither does Arizona (although the Navajo Nation, in northeastern Arizona, does). 
- For many years, most of Indiana did not observe Daylight Saving Time with the exception of 10 counties. 
- Beginning in 2006, all of Indiana now observes Daylight Saving Time. 

<!-------
## The challenge question

In 2005, we want to know how much electricity is being consumed at 4:00 pm on Monday April 4th in commercial buildings.  We are looking at suburbs of Louisville, Kentucky.  **What concerns do you have?**

> - [A little history on daylight saving time](https://www.msn.com/en-us/news/us/10-things-you-might-not-know-about-daylight-saving-time/ss-BBK4azQ#image=9)
---------->

# The lubridate package {data-background=#e8c35d}

## Types of Time

<br>

- A date
- A time within a day (`hms` package)
- A date-time

## Creator Functions

<br>

For dates:

> - `ymd()`, `mdy()`, `dmy()`, `ydm()`
> - `make_date()`

<br>

For date-times:

> - `ymd_hms()`, etc.
> - `make_datetime()`

## Creator Functions

<br>

Open R-Studio and convert the following strings to date objects.

Try using `ymd()`, `mdy()`, `dmy()`, `ydm()`

<br>

> - "January 21st, 2017"
> - "2012-01-01"
> - "March 2016 - 23"

## Creator Functions

<br>

Try `make_date()` and `make_datetime()`.


```r
library(tidyverse)
library(lubridate)
?make_date

# Try this one first.
date_cols <- tibble(month = c(1, 3, 7), 
                    day = c(23, 18, 1), 
                    year = c(2017, 2017, 2016))

# Then try this one. Will it work in make_date()?
date_cols <- tibble(month = c("Jaunary", "March", "July"), 
                    day = c(23, 18, 1), 
                    year = c(2017, 2017, 2016))
```


## Accessor Functions

<br>

You can pull out individual parts of the date with the accessor functions:

> - `year()`, `month()`
> - `mday()`, `yday()`, `wday()`
> - `hour()`, `minute()`, `second()`

**Challenge**

> - Tell me what weekday "March 23, 2016" falls on.
> - What day of the year was it?

## Rounding Functions

<br>

Read the help files to figure out what unit you want to round to.

> - `floor_date()`
> - `round_date()`
> - `ceiling_date()`

<!--------
## Challenge

**Tackle the Following**


```r
jan31 <- ymd("2013-01-31")
```

- Add one month to "January 31st".  
- Add 27 hours and 15 minutes to "January 31st, 2013 06:35:27" 
----------->


## Time Zones

<br>

> - Your computer's time zone: `Sys.timezone(location = TRUE)`
> - List of timezones: `OlsonNames()`
> - `with_tz()`: Changes the time to match the new timezone.
> - `force_tz()`: Keeps the time, but forces a new timezone label.

<!--------

```r
meeting <- ymd_hms("2020-11-01 09:00:00", tz = "Pacific/Auckland")
with_tz(meeting, "America/Chicago")
```

```
## [1] "2020-10-31 15:00:00 CDT"
```

```r
force_tz(meeting, "America/Chicago")
```

```
## [1] "2020-11-01 09:00:00 CST"
```
------------>

## Challenge

<br>

> 1. Convert this datetime to "US/Mountain" time zone and tell me what quarter it is in.

2. Now suppose that the time read into R as UTC but that you know those times are actually recorded in the mountain time zone.


```r
x <- ymd_hms("2009-07-01 2:01:59.23")
```

## Just in case:

<br>

Note that when you use date-times in a numeric context (like in a histogram), 1 means 1 second, so a binwidth of 86400 means one day. For dates, 1 means 1 day.

<!-------------
# How to Visualize Time

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

------------------>
