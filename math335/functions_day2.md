---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Welcome to class! {data-background=#f7d754}

# Functions and purrr {data-background=#f7d754}

![](images/programming_cat.gif)

## What I want you to get out of this week:

- If you copy/paste more than once, consider writing a function.
- If you copy/page a function more than once, consider using `purrr`

## Loops vs. purrr

- Loops are slow, but highly customizable. Most work can be done without them.
  - functions and purrr = GOOD
  - loops = BAD

```r
for(i in 1:10){
  print(i)
}
```

## purrr is group_by() on steroids

- `group_by() %>% summarise()` worked well for repeating code on chunks of a vector
- Similarly, `group_by() %>% nest() %>% mutate(newvar = map())` will perform functions on chunks of a dataset
