---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Functions: Day 2 {data-background=#f7d754}

Welcome to class!

# The purrr Package {data-background=#f7d754}

## Who knows what a loop is?

## Loops vs. purrr

>- functions and purrr = GOOD
>- loops = BAD

> Loops are slow, but highly customizable. Most work can be done without them.

## purrr is group_by() on steroids

>- `group_by() %>% summarise()` worked well for repeating code on chunks of a vector
>- Similarly, `nest() %>% mutate(newvar = map())` will perform functions on chunks of a dataset (actually a list column)

## A visual example.

[See powerpoint.](https://byuistats.github.io/M335/presentations_class_palmer/day_15_purrr.pptx)

Then we'll do the task(s) together.


