---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Tidy Data, Tibbles, and Vectors {data-background=#f7d754}

Welcome to class!

# Data frames vs. Tibbles {data-background=#f7d754}

## [Data frames](https://www.tutorialspoint.com/r/r_data_frames.htm#:~:text=A%20data%20frame%20is%20a,of%20values%20from%20each%20column.&text=The%20data%20stored%20in%20a,numeric%2C%20factor%20or%20character%20type.)

A data frame is a table or a two-dimensional array-like structure in which each column contains values of one variable and each row contains one set of values from each column.

>- The column names should be non-empty.
>- The row names should be unique.
>- The data stored in a data frame can be of numeric, factor or character type.
>- Each column should contain same number of data items.

## Data frame example


```r
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

## [Tibbles](https://r4ds.had.co.nz/tibbles.html)

Tibbles are data frames, but they tweak some older behaviours to make life a little easier. R is an old language, and some things that were useful 10 or 20 years ago now get in your way. Tibbles:

>- Never change the type of inputs
>- Never change the names of variables
>- Never create row names

## Tibble example


```
## # A tibble: 32 x 11
##      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
##  1  21       6  160    110  3.9   2.62  16.5     0     1     4     4
##  2  21       6  160    110  3.9   2.88  17.0     0     1     4     4
##  3  22.8     4  108     93  3.85  2.32  18.6     1     1     4     1
##  4  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1
##  5  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
##  6  18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
##  7  14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
##  8  24.4     4  147.    62  3.69  3.19  20       1     0     4     2
##  9  22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2
## 10  19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4
## # ... with 22 more rows
```
## [Tidy data and tibbles](https://r4ds.had.co.nz/tidy-data.html)

Tidy data should be stored in a tibble (or a data frame) with each variable in a column.

There's a specific advantage to placing variables in columns because it "allows R's vectorised nature to shine".

<!--- ![](images\tidy-1.png) --->
<img src="images/tidy-1.png"  height="300">

## R is "vectorised"

A vector is a collection of values. Most built-in R functions are vectorised, meaning that they can operate on a vector.


```r
c(1,2,3,4,5) + c(0,0,10,10,10)
```

```
## [1]  1  2 13 14 15
```

```r
c(1,2,3,4,5) + 100
```

```
## [1] 101 102 103 104 105
```


## [Vector types](https://r4ds.had.co.nz/vectors.html)

>- **Atomic vectors** are homogeneous. There are 6 types: logical, integer, double, character, complex, and raw.
>- A **list** is a heterogeneous vector, and can also contain other lists.

<!--- ![](images/data-structures-overview.png) --->
<img src="images/data-structures-overview.png"  height="350">

## [Vector properties and attributes](https://r4ds.had.co.nz/vectors.html)

Every vector has two key properties: its type `typeof()` and length `length()`.

Vectors can also contain "attributes" which build on additional behaviour.

>- Factors are built on top of integer vectors
>- Dates and date-times are built on top of numeric vectors
>- Data frames and tibbles are built on top of lists

## [Tibbles and vectors](https://r4ds.had.co.nz/vectors.html)

Vectors provide the underlying structure of tibbles (and data frames). A tibble is a list of vectors. Each "column" that we use is a vector with a specific data type.

The difference between a tibble and a list is that all the elements of a tibble (or a data frame) must be vectors with *the same length*.


## Example: read.csv

`read.csv()` is a base R function that will load a .csv file into a data frame. Base R used to automatically convert strings to factors, although I believe this has changed with [recent updates](https://developer.r-project.org/Blog/public/2020/02/16/stringsasfactors/index.html).


```r
dat1 <- read.csv("./data/heights.csv", stringsAsFactors = TRUE)
head(dat1)
```

```
##    earn   height    sex ed age  race
## 1 50000 74.42444   male 16  45 white
## 2 60000 65.53754 female 16  58 white
## 3 30000 63.62920 female 16  29 white
## 4 50000 63.10856 female 16  91 other
## 5 51000 63.40248 female 17  39 white
## 6  9000 64.39951 female 15  26 white
```

## Example: read_csv

`read_csv()` comes from the `readr` package, which is a part of the tidyverse. This will load the .csv file into a tibble. What has changed from before?


```r
dat2 <- read_csv("./data/heights.csv")
head(dat2)
```

```
## # A tibble: 6 x 6
##    earn height sex       ed   age race 
##   <dbl>  <dbl> <chr>  <dbl> <dbl> <chr>
## 1 50000   74.4 male      16    45 white
## 2 60000   65.5 female    16    58 white
## 3 30000   63.6 female    16    29 white
## 4 50000   63.1 female    16    91 other
## 5 51000   63.4 female    17    39 white
## 6  9000   64.4 female    15    26 white
```

## Example: Are they equal?


```r
str(dat1)
```

```
## 'data.frame':	1192 obs. of  6 variables:
##  $ earn  : num  50000 60000 30000 50000 51000 9000 29000 32000 2000 27000 ...
##  $ height: num  74.4 65.5 63.6 63.1 63.4 ...
##  $ sex   : Factor w/ 2 levels "female","male": 2 1 1 1 1 1 1 2 2 2 ...
##  $ ed    : int  16 16 16 16 17 15 12 17 15 12 ...
##  $ age   : int  45 58 29 91 39 26 49 46 21 26 ...
##  $ race  : Factor w/ 4 levels "black","hispanic",..: 4 4 4 3 4 4 4 4 2 4 ...
```

```r
str(dat2)
```

```
## tibble [1,192 x 6] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ earn  : num [1:1192] 50000 60000 30000 50000 51000 9000 29000 32000 2000 27000 ...
##  $ height: num [1:1192] 74.4 65.5 63.6 63.1 63.4 ...
##  $ sex   : chr [1:1192] "male" "female" "female" "female" ...
##  $ ed    : num [1:1192] 16 16 16 16 17 15 12 17 15 12 ...
##  $ age   : num [1:1192] 45 58 29 91 39 26 49 46 21 26 ...
##  $ race  : chr [1:1192] "white" "white" "white" "other" ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   earn = col_double(),
##   ..   height = col_double(),
##   ..   sex = col_character(),
##   ..   ed = col_double(),
##   ..   age = col_double(),
##   ..   race = col_character()
##   .. )
```

# Height Case Study  {data-background=#f7d754}

## [Jenny Bryan](https://twitter.com/JennyBryan)

"Classroom data are like teddy bears and real data are like a grizzly bear with salmon blood dripping out its mouth."

## [Hadley Wickham](http://jstatsoft.org/v59/i10)

"Up to 80% of data analysis is spent on the process of cleaning and preparing data"




