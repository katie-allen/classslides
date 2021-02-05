---
title: ""
params:
  ptitle: true
  pbackground: true
  dtype: "none"
---

# Welcome to class! {data-background=#e8c35d}

Tidy Data: Day 3




# Reading Discussion {data-background=#e8c35d}

## John Rauser: How Humans See Data

## 3 visual operations

<br>

1. Detection
2. Assumbly
3. Estimation

## 7 methods of encoding data, ordered by accuracy of perceptual estimation

<br>

1. Position along a common scale
2. Position on common, non-aligned scale
3. Length
4. Angle or slope
5. Area
6. Volume/density/saturation of "color"
7. Color hue







<!----------------------------

# Vectors {data-background=#e8c35d}

## Vectors vs. Lists

<p style="text-align: left;">
A vector is a sequence of data elements of the same basic type. This is called "atomic" in R.
A list is a sequence of data elements of any type. 

The chief difference between atomic vectors and lists is that atomic vectors are homogeneous, while lists can be heterogeneous. One of the elements within a list can be another list, so they are recursive.

On a related note, there is NULL. NULL is often used to represent the absence of a vector (as opposed to NA which is used to represent the absence of a value in a vector). NULL typically behaves like a vector of length 0. 
</p>

## Checking Truths
Checking the type of data:

|                  | lgl | int | dbl | chr | list |
|------------------|-----|-----|-----|-----|------|
| `is_logical()`   |  x  |     |     |     |      |
| `is_integer()`   |     |  x  |     |     |      |
| `is_double()`    |     |     |  x  |     |      |
| `is_numeric()`   |     |  x  |  x  |     |      |
| `is_character()` |     |     |     |  x  |      |
| `is_atomic()`    |  x  |  x  |  x  |  x  |      |
| `is_list()`      |     |     |     |     |  x   |
| `is_vector()`    |  x  |  x  |  x  |  x  |  x   |


## Scalars and recycling rules

Write out this line of code and then map the full process to get to the output

**Input**

`1:10 + 1:2`

**Output**

`#>  [1]  2  4  4  6  6  8  8 10 10 12`

## Accessing elements of a list

- There is an important variation of [ called [[. [[ only ever extracts a single element, and always drops names. It's a good idea to use it whenever you want to make it clear that you're extracting a single item, as in a for loop. The distinction between [ and [[ is most important for lists, as we'll see shortly.


## Lists

While understanding and using functions is probably more important. Understanding how lists work and the power of lists is a very important key to becoming a master R programmer.  

> - [Lists and condiments](http://r4ds.had.co.nz/vectors.html)

```
a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, list(-5, "fish")))

```

**Compare:**

`a[[c(4,2,2)]]`

to

`a[c(4,2,2)]`

Describe what is happening in each one.

## Is a data.frame a list?

Data frames are lists as well, but they have a few restrictions:

> - you can't use the same name for two different variables
> - all elements of a data frame are vectors
> - all elements of a data frame have an equal length.

Due to these restrictions and the resulting two-dimensional structure, data frames can mimick some of the behaviour of matrices: You can select rows and do operations on rows. You can't do that with lists, as a row is undefined there.
-------------------------------------->

<!-- Show video of why is a raven like a writing desk? -->

<!------------------------------------------
## Trouble with tibbles


Tibbles, not to be confused with tribbles
https://www.youtube.com/watch?v=dwG6MO92xtI



## data.frame and tbl (1)

**What is the difference between tibbles and data frames?**

* Never coerces inputs (i.e. strings stay as strings!).
* Never adds row.names.
* Never munges column names.
* Only recycles length 1 inputs.
* Evaluates its arguments lazily and in order.
* Adds tbl_df class to output.
* Automatically adds column names.

## data.frame and tbl (2)

**What is the difference between tibbles and data frames?**

* When printed, the tibble reports the class of each variable. data.frame objects do not.
* When printing a tibble to screen, only the first ten rows are displayed. The number of columns printed depends on the window size.

## Trouble with factors

Hypothesize what you think will happen for each line of code before running it


```r
(f<-factor(5:10))
levels(f)[f]
levels(f)[[f]]
levels(f)[[3]]

as.numeric(f) # not what you'd expect
parse_number(f)

# what you typically meant and want:
as.numeric(as.character(f))
parse_number(as.character(f))

# the same, considerably more efficient (for long factors):
as.numeric(levels(f))[f]
```

-------------------------------->

# Importing Data {data-background=#e8c35d}


<!-----------

## Data formats

> - Consider these tidyverse packages for other data types
>   - **haven** reads SPSS, Stata, and SAS files
>   - **readxl** reads both .xls and .xlsx files
> - Non-tidyverse packages
>   - **foreign** reads .dbf files
>   - **DBI** and **obdc** (or other packages for backends) can work together to query databases
>     - Go to [db.rstudio.com](https://db.rstudio.com/getting-started/connect-to-database)


## Data Import (task 5)

* What is the difference between `read.csv()` and `read_csv()`?
* Read [this link (5.3.1)](https://csgillespie.github.io/efficientR/5-3-importing-data.html) and take some time to make a note in your task 5 `README.md` in your repository about the benefits.
* Push your updated `README.md` for me to read in class.
* [Good Image](https://csgillespie.github.io/efficientR/_main_files/figure-html/readr-vs-base-1.png)

------------------->



## `parse_` commands

<br>

Load the `tidyverse`, then run this code:

```
money <- c('4,554,25', '$45', '8025.33cents', '288f45')
```

<br>

>- Apply `as.numeric(money)`. What happens?
>- Apply `parse_number(money)` and compare the results.



## Using `read_csv()` with parsers

<br>


```r
challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)
```

> 1. Run the code above.
> 2. Look at the errors using `problems(challenge)`.
> 3. Find more clues using the `head()`, and `tail()` of your `challenge` object.  What formats should they be?
> 4. Now review [11.4.2 of our textbook](http://r4ds.had.co.nz/data-import.html#problems) and `?read_csv()` to fix the read in.



# Work Time {data-background=#e8c35d}
