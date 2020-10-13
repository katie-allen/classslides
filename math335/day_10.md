---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Tidy Data {data-background=#f7d754}

Welcome to class!

# Case Study Presentations {data-background=#f7d754}

##   Issues

## Group Presentations

## Class Presentations

# Tidy Data  {data-background=#f7d754}

## What is tidy data?

[Assigned reading.](https://r4ds.had.co.nz/tidy-data.html)

## tidyr Functions: Pivoting

- `pivot_longer()` pivots data from wide to long
- `pivot_wider()` pivots data from long to wide


## tidyr Functions: Character vectors

- `extract()` extracts a character column into mulitple columns using regular expression groups
- `separate()` separates a character column into multiple columns with a regular expression or numeric locations
- `unite()` unites multiple columns into one by pasting strings together

## regular expressions

A **regular expression** is a sequence of characters that define a search pattern.

Usually such patterns are used by string-searching algorithms for "find" or "find and replace" operations on strings, or for input validation.

[regex101.com](https://regex101.com/)

## dyplr and tidyr

The six data verbs from `dyplr` and the tidy tools from `tidyr` should be used hand-in-hand to wrangle data until it is tidy.

[class practice]()

## Task 7

Two problems you are going to run into:

>- Month names are not always spelled correctly 
>- Getting the months in the correct order for the table