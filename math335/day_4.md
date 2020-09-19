---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---





# Visualizing Large Datasets {data-background=#f7d754}

Welcome to class!

## Today's Outline

> - [Case Study Presentations](https://byui.instructure.com/courses/105484/pages/presentation-and-discussion-lead-responsibilities?module_item_id=11970738)
> - Rmarkdown behind-the-scenes
> - Intro to "grammar of graphics" and ggplot2
> - Class Example


# Becoming the Critic. {data-background=#f7d754}

```r
vday <- params$day - 1
vlink <- paste0("http://www.perceptualedge.com/example", vday, ".php")
titlelink <- paste0('{data-background-iframe="', vlink, '"}')
```



## {data-background-iframe="http://www.perceptualedge.com/example1.php"}

[Visualization of the Day](http://www.perceptualedge.com/example1.php)

## Team Leader

Review what a team leader should do while reviewing case studies.



# Day 3 Lesson

## Lesson objectives

* Connect ggplot syntax to the concept of grammar of graphics and layering to create plots
  * introduce scale_*_continuous()
  * introduce coord_*()
* Practice using ggplot()
    *  geom_col vs. geom_bar
    *  geom_histogram, geom_point, geom_boxplot, geom_violin, geom_bswarm, geom_quasirandom, etc.
*  Strategies for visualizing large datasets: univariate and bivariate plots

# The Grammar of Graphics {data-background=#e8d725}

## Introduction to the Grammar

<iframe width="760" height="445" src="https://www.youtube.com/embed/uiTc55clwuA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Introduction to ggplot2 

<iframe width="760" height="445" src="https://www.youtube.com/embed/PiY9hwOkL8U" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

# Go to code example of Task 3, skip rest of slides

## beeswarm example

![](images\beeswarm2-1.png)


```r
library(ggbeeswarm)
gg_base + geom_quasirandom(alpha = .6, size = .75) + 
  coord_cartesian(ylim = c(-50, 500)) 
```


# Wrangling and ggplot with iris data

## ggplot2 and iris data

Use the `iris` data to create a faceted visualization. Encode data in a `color`, `shape`, and `size` layer or geometry.

Add a layer that pulls from a different data set
<!-- ggplot(iris) + geom_point(aes(x=Sepal.Length, y= Sepal.Width, color = Species, shape = Species, size = Petal.Length)) + facet_wrap(vars(Species)) + scale_shape_manual(values =  c(1, 5, 7)) + geom_hline(data = avgwid, aes(yintercept = avg)) -->