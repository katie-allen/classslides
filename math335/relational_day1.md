---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Relational Data: Day 1 {data-background=#e8c35d}

Welcome to class!

# Case Study Review {data-background=#e8c35d}

<!--------------
## On your own (5-ish minutes)

>- Post the link to your case study in slack.
>- Review case studies done by classmates and start writing issues.

## Case Study Presentations
---------------------------->

# Relational Data {data-background=#e8c35d}

## What are "relational data"?

<br>

Relational data are multiple tables of data that have defined relationships with each other.

Relational data make it easy to store information about many different base units.

## Example

<br>

```
library(tidyverse)
library(nycflights13)

?flights
?airports
```

## Why is learning to work with relational data important?

<br>

> "It's rare that a data analysis involves only a single table of data. Typically you have many tables of data, and you must combine them to answer the questions that you're interested in."

## Why is learning to work with relational data important?

<br>

> - There are many types of databases, but relational databases have [dominated since the 1980s](https://www.oracle.com/database/what-is-database.html). 
> - You will often have to combine data from different sources to answer business questions.

## [Keys](https://r4ds.had.co.nz/relational-data.html)

<br>

What could we use to connect the `flights` and `airports` datasets?

- The variables used to connect tables are called "keys"
- A **primary key** uniquely identifies an observation in its own table (one or more variables)
- A **foreign key** uniquely identifies an observation in another table
- A primary key and the corresponding foreign key in another table form a **relation**.

## [Keys](https://r4ds.had.co.nz/relational-data.html)

<br>

[Flight Keys](https://r4ds.had.co.nz/diagrams/relational-nycflights.png)

# Joining Datasets {data-background=#e8c35d}

## Example 

<br>

Join the `flights` and `airlines` datasets.

<br>

- What do we want the output to look like?
- What is the primary key?
- What is the foreign key?
- `flights %>% dplyr::left_join(airlines, by = "carrier")`
- What happens if I flip the data sets? `airlines %>% dplyr::left_join(flights, by = "carrier")`

## Your turn

<br>

How could we join the `flights` and `airports` data to show the full name of the airport in the `flights`? Post your code in slack.

- It depends. Do we want the origin or destination airport name? Or both?
- Origin: `flights %>% left_join(airports, by = c("origin" = "faa"))`
- Destination: `flights %>% left_join(airports, by = c("dest" = "faa"))`
- Both: `flights %>% left_join(airports, by=c("origin" = "faa")) %>% left_join(airports, by=c("dest" = "faa"))`

## How to make sure a key is unique

<br>


```r
planes %>% count(tailnum) %>% filter(n > 1)
```

```
## # A tibble: 0 x 2
## # ... with 2 variables: tailnum <chr>, n <int>
```

```r
flights %>% count(flight) %>% filter(n > 1)
```

```
## # A tibble: 3,493 x 2
##    flight     n
##     <int> <int>
##  1      1   701
##  2      2    51
##  3      3   631
##  4      4   393
##  5      5   324
##  6      6   210
##  7      7   237
##  8      8   236
##  9      9   153
## 10     10    61
## # ... with 3,483 more rows
```

## What happend if you have duplicate keys?

<br>

> - [One table w/ duplicates](http://r4ds.had.co.nz/diagrams/join-one-to-many.png)
> - [Both tables w/ duplicates](http://r4ds.had.co.nz/diagrams/join-many-to-many.png)

## In-depth example

<br>

<!----
**Partner-up**: 1 is a problem solver and tells what to do. The other is the coder and codes up the solution.
---->

> - For each tailnumber in `planes` data table, you want to know which carrier is operating it.
> - *Bonus*: Include the carrier's full name (in `airlines`), not just the 2 digit abbreviation.




## Mutating joins

<br>

The `left_join` we just practiced will be the most common join you use. In the `dplyr` package, it is called a *mutating join*.

>- [A venn diagram for mutating joins.](https://r4ds.had.co.nz/diagrams/join-venn.png)

## Other types of joins

<br>

> - [Filtering joins](http://r4ds.had.co.nz/relational-data.html#filtering-joins) don't add columns. They are an efficient way to filter on multiple columns.
>- [Set operations](https://r4ds.had.co.nz/relational-data.html#set-operations) work with individual rows, comparing each value in the rows.


# Upcoming {data-background=#e8c35d}

<br>

>- Task 13
>- Coding Challenge
