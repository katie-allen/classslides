---
title: ''
author: ''
params:
  day: 2
  ptitle: yes
  pbackground: yes
  dtype: none
---



# Welcome to class! {data-background=#f7d754}

## Reading Discussion


## View Data at the Atomic Level

"None of us would admit now that we didn't realize...there...had to be spread in the data; we...just didn't realize how big it could be."

> - What key observations came by looking at the data
>   - small sample sizes
>   - values above 100%
>   - increasing # of patients at 100%
> - The Mean is Not the Distribution

# Interactive Graphs {data-background=#f7d754}

## Example: `library(DT)`

Make a new Rmd file that just has the following in it (including the default yaml). 


```r
knitr::opts_chunk$set(echo = TRUE)
```


```r
library(DT)
datatable(iris)
```

Then, try knitting and pushing the files to GitHub

## Setting up R-Studio

> - Visit https://shiny.byui.edu/connect and log-in
> - Click on the publish button and choose "Manage Accounts"
> - Click the "connect" button and ensure the "Enable publishing to RStudio Connect" is checked
> - Use shiny.byui.edu as the server name.
> - Then knitting the .rmd file they click on the publish button

## Example: `library(DT)`

Look at the [DT: An R interface to the DataTables library](http://rstudio.github.io/DT/) website and find one or two modifications that you could make to your table output to move beyond the default.

<!-- Putting information in your file [My interactive](https://shiny.byui.edu/connect/#/apps/3/access) -->






# Task 20 {data-background=#f7d754}

# Remember the Goal {data-background=#f7d754}

##

"The most exciting phrase to hear in science, the one that heralds new discoveries, is not 'Eureka!' but 'That's funny...'" -Isaac Asimov

> - [Remembering Good Principles](https://youtu.be/fSgEeI2Xpdc)
> - [Rauser view on time and data](https://www.youtube.com/embed/coNDCIMH8bk?start=628) - 10:28 to 17:50

## Edward Tufte

> Graphical excellence is that which gives to the viewer the greatest number of ideas in the shortest time with the least ink in the smallest space

> Edward Tufte
