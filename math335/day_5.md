---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Github {data-background=#f7d754}

Welcome to class!

## Today's Outline

> - Reading Discussion
> - ggplot2 practice (prep for Case Study 2)
> - Introduction to "wrangling"

# Reading Discussion {data-background=#f7d754}

## Hans Rosling: Show Variation

- Hans showed that [Swedish top students know statistically significantly less about the world than the chimpanzees](https://www.youtube.com/embed/usdJgEwMinM?rel=0&amp;start=80)

- "*The problem was not ignorance it was preconceived ideas.*"

- According to Hans, what is driving these [false] preconceived ideas?
<!-- Relying on the mean too much -->
<!-- He shows this with Africa. Such a lot of difference within countries -->

- Can you think of instances in your own life where this occurs?

## Hans Rosling Thesis

- In one sentence, what would you say is Hans' thesis statement?

- Don't oversummarize the data. Showing variation is even better, but first and foremost, show the data (correctly).

## Stephen Few's Steps (Effectively Communicating Numbers)
<!-- This is good in theory, but I don't know if I believe it in practice. -->
<!-- It seems to work well for big presentations: conferences, papers, client meetings. But the lines get really blurry daily meetings with boss, stakeholders, etc. Where does exploratory data analysis fit in to this?(great question to ask students) -->
> 1. Determine your message and needed data
> 2. Table or graph? (Graph!)
> 3. Best means to encode the values (aka, type of chart?)
> 4. Where to display each variable (axes, color, shape, facets, etc.)
> 5. Remaining objects (scale, legends, text)
> 6. Featured data?


- How does this process differ from what may commonly be done?

- What will be the impact of following this process instead?

- Should this process always be used? Where does exploratory data analysis fit in?

## Stephen's Final Words

"Whenever you create a graph, you have a choice to make-to communicate or not. That's what it all comes down to. If you have something important to say, then say it clearly and accurately."

# Case Study 2 {data-background=#f7d754}

# Data Wrangling {data-background=#f7d754}

## Data Manipulation Verbs

> - `filter`  - 
> - `sort` - 
> - `select`  - 
> - `mutate`  - 

## Data Manipulation Verbs {data-transition="none"}

> - `filter`  - filter your data to a smaller set of important rows.
> - `sort` - Organize the row order of my data
> - `select`  - select specific columns to keep or remove 
> - `mutate`  - add new mutated (changed) variables as columns to my data.

## Data Manipulation Verbs for Summaries

> - `summarise` - 
> - `group by`  - 

## Data Manipulation Verbs for Summaries {data-transition="none"}

> - `summarise` - build summaries of the columns specified
> - `group by`  - divide your data into groups. Often used with `summarise`

## Data Manipulation to Reshape/Resturcture a Dataset

> - `stack` - 
> - `unstack`  - 
> - `seperate` - 
> - `unite` - 

## Data Manipulation to Reshape/Resturcture a Dataset {data-transition="none"}

> - `stack` - convert data from "wide" to "long" format by moving column names into a *key* column, *gathering* the column values into a single value column
> - `unstack`  - convert data from "long" to "wide" format by using unique values of a *key* column as new column names, and values being placed in one of the new columns based on its key value in the original data structure
> - `seperate` - parse, or break apart, each cell into several cells (usually applied to columns, but can be applied row wise as well)
> - `unite` - collapse or combine cells across several columns to make a single column

## Practice reading code

With your table, write this code out in an English paragraph.


```r
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")
```
