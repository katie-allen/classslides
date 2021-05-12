---
title: ""
params:
  ptitle: true
  pbackground: true
  dtype: "none"
---

# Welcome to class! {data-background=#e8c35d}

# This Week I Learned {data-background=#e8c35d}

# Task 7 {data-background=#e8c35d}

## Task 7

<br>

> - Take two minutes to review your work for Task 7. Answer one of these questions:
>   - What new skill did you learn? or
>   - What question do you have about the task?
> - In pairs, share what you learned or what question you have.

## Task 7

<br>

pivots, case_when, and factors

# Task 8 {data-background=#e8c35d}

## Data frame vs Tibble

<br>

What are the [main differences](https://r4ds.had.co.nz/tibbles.html#tibbles)?

Compare the output:

```r
library(tidyverse)

iris
as_tibble(iris)
```

## Attributes

<br>

Attributes are used to store [metadata](https://www.google.com/search?q=metadata&rlz=1C1GCEJ_enUS882US882&oq=metadata&aqs=chrome.0.0i67i131i433j0i67l4j69i60l3.694j0j7&sourceid=chrome&ie=UTF-8) about an object.

```r
attributes(iris)

comment(iris) <- "This is my favorite data."
attributes(iris)

attr(iris, "my_attribute") <- 42
attributes(iris)
```

## readr package

<br>

The [readr package](https://readr.tidyverse.org/) provides "a fast and friendly way to read rectangular data."

How is `read.csv()` different from `read_csv()`? And [why do we care](https://r4ds.had.co.nz/data-import.html#compared-to-base-r)?

## What does it mean for two data sets to be equal?

<!-----------
## regular expressions

A **regular expression** is a sequence of characters that define a search pattern.

Usually such patterns are used by string-searching algorithms for "find" or "find and replace" operations on strings, or for input validation.

[regex101.com](https://regex101.com/)
------------->
