---
title: ""
params:
  day: 3
  ptitle: true
  pbackground: true
  dtype: "none"
---

# Welcome to class! {data-background=#e8c35d}

The Data Science Process: Day 1

## Today's Outline:

>- Case Study 1
>- Saving and sharing your work
>- R Programming
>- Exploratory Data Analysis

## Case Study 1

## Other questions?

# Saving and Sharing Your Work {data-background=#e8c35d}

## R vs R Scripts

What parts of you analysis do you want to preserve?

## R vs R Scripts

[What is real?](https://r4ds.had.co.nz/workflow-projects.html?q=real#what-is-real)

> As a beginning R user, it's OK to consider your environment (i.e. the objects listed in the environment pane) "real". However, in the long run, you'll be much better off if you consider your R scripts as "real".

## R vs R Scripts

[What is real?](https://r4ds.had.co.nz/workflow-projects.html?q=real#what-is-real)

> With your R scripts (and your data files), you can recreate the environment. It's much harder to recreate your R scripts from your environment! You'll either have to retype a lot of code from memory (making mistakes all the way) or you'll have to carefully mine your R history.

## R Scripts

Mostly code, with a little bit of dialogue (comments)

## Markdown

All dialogue, maybe with some static code examples

[What is Markdown?](https://blog.bit.ai/what-is-markdown/)

## R Markdown

A beautiful blend of dialogue, code, and code output

[What is R Markdown?](https://rmarkdown.rstudio.com/lesson-1.html)

## Possibilities with R Markdown

- Word document
- Html page
- Website or blog
- PowerPoint Slide show
- Html slides
- PDF report
- Interactive dashboard

## R Script vs. R Markdown

Which one should I use?

# R Programming {data-background=#e8c35d}

## [Data Types](https://www.geeksforgeeks.org/r-data-types/)

- Each variable in R has an associated data type
- Each data type requires different amounts of memory
- Each data type has some specific operations which can be performed over it
  - **Numeric:** Set of all real numbers
  - **Integer:** Set of all integers
  - **Logical:** TRUE and FALSE
  - **Complex:** Set of complex numbers
  - **Character:** "a", "BYU-Idaho", "lions and tigers and bears", "@", "3"

## [Vectors](http://adv-r.had.co.nz/Data-structures.html)

- The basic data structure in R is the vector
- Vectors come in two flavors: atomic vectors and lists
- Atomic vectors and lists have three common properties:
  - **Type:** typeof(), what it is.
  - **Length:** length(), how many elements it contains.
  - **Attributes:** attributes(), additional arbitrary metadata.
- They differ in the types of their elements: 
  - All elements of an atomic vector must be the same type
  - The elements of a list can have different types.

## Dataframes

# Exploratory Data Analysis {data-background=#e8c35d}

## What is EDA?

EDA is not a formal process, but a [state of mind](https://r4ds.had.co.nz/exploratory-data-analysis.html).

1. Generate questions about your data.
2. Search for answers
3. Use what you learn to refine your questions and/or generate new questions
4. Repeat

## Goal of EDA

Like one of those awkward ice breakers on the first day of school, you're trying to learn enough about the data that you can introduce it to other people. Try asking:

- What are the data types? (numeric, character, etc.)
- What is the distribution of each variable?
- Are there any extreme values?
- Is there missing data? Where? Why?
- Are there any obvious relationships between variables?

## Where does EDA fit in the data science process?

A client sets up a meeting with you to discuss an upcoming project. She also sends you multiple csv files with data she has collected. Before the meeting, you use EDA to answer some important questions:

- *What type of information is stored in this data?*
- *What can I do with this data?*
- *What can I not do with this data?*
- *Does anything look suspicious?*

## Where does EDA fit in the data science process?

You're working on a project with some very specific questions that need answering. A coworker from another department sends you data with "everything you need" to find the answers. You should use EDA to figure out:

- *Do I actually have all the information I need?*
- *Do I trust the quality of this data?*
- *What is the best way to combine data sets?*
- *What wrangling is needed to get the data in the right format?*

## Generate Questions

What questions do we have about this data?

```
library(tidyverse)
View(gss_cat)
```

## Find Answers


# Looking Ahead  {data-background=#e8c35d}

## What are we doing the rest of the week?

>- Wednesday: Have every one on GitHub
>- Friday: "Reproducible Research"
>   - R Projects
>   - Sharing code
>   - Semester project