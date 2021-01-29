---
title: ""
params:
  ptitle: true
  pbackground: true
  dtype: "none"
---

# Welcome to class! {data-background=#e8c35d}

## Task and Case Study Template

<br>

```
install.packages("devtools")
devtools::install_github("dylanjm/Rtemplates", subdir = "StatsBYUI")
```

# Data Wrangling and Structured Thinking  {data-background=#e8c35d}

## Structured Thinking

<br>

[Exact Instructions Challenge](https://www.youtube.com/watch?v=cDA3_5982h8)

## Pseudocode

<br>

What is pseudocode?

- [Lots of examples](https://www.google.com/search?q=pseudocode&rlz=1C1GCEJ_enUS882US882&sxsrf=ALeKk00d8X6NSlt-TYO_aUS-VSSVTNS5rA:1611944233024&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi7uKCb4MHuAhWPW80KHU1wAyIQ_AUoAXoECB0QAw&biw=1920&bih=969)
- [A step-by-step guide](https://www.google.com/imgres?imgurl=http%3A%2F%2Fcdn.differencebetween.net%2Fwp-content%2Fuploads%2F2017%2F06%2FWhat-is-the-difference-between-Pseudocode-and-Algorithm.jpg&imgrefurl=http%3A%2F%2Fwww.differencebetween.net%2Fmiscellaneous%2Fwhat-is-the-difference-between-pseudocode-and-algorithm%2F&tbnid=w30nrQi9StmntM&vet=12ahUKEwix6qSf4MHuAhXWa80KHbjQAMUQMyhGegUIARCDAQ..i&docid=LHMcWuHZ-_crBM&w=500&h=400&q=pseudocode&ved=2ahUKEwix6qSf4MHuAhXWa80KHbjQAMUQMyhGegUIARCDAQ)

## Let's practice!

<br>

[Class Activity](https://ktoutloud.github.io/classslides/math335/wrangle_activity_students.R)

<!------------------
## Practice reading code

<br>

With a partner (or in the Zoom chat), write this code out in an English paragraph.


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

## Pseudocode

* Pseudocode: A notation resembling a simplified programming language, used in program design.
* With your group, use data verbs and pseudocode to write your plan of attack for Task 6 and Case Study 3
  *   This may require you to do some initial data exploration to understand the dataset better

# HINT: You can learn about functions using the `?` command
# and from the dplyr cheatsheet.
# Almost every package we learn in this class has a "cheat sheet"
# A cheat sheet is a 1 or 2 page document that serves as a primer/reminder
# for all the most important basics of a function.
# Check out the cheatsheet for dplyr:
# https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf

# Take a few minutes to discuss the following functions as a group.
# Ensure you know what they are used for / how to use them.

is.na()
case_when()
top_n (especially with group_by())
%in%
distinct() and n_distinct()

------------------------->

# Reading Discussion  {data-background=#e8c35d}

