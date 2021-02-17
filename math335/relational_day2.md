---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Relational Data: Day 2 {data-background=#e8c35d}

Welcome to class!

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

> - For each tailnumber in `planes` data table, you want to know which carrier is operating it (using the `flights` data).
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

>- Coding Challenge
>- Relational Case Study
