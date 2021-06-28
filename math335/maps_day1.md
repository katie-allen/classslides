---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Welcome to class! {data-background=#e8c35d}

Maps and Spatial Data

## Case Study Sharing

<!---------------------
## Reading Discussion

<br>

> - How to Become a Data Scientist in 2020
> - Do I need to code in my free time to be a good developer?
----------------------->

<!-------------

# "Big" Data (Josh Wills) {data-background=#e8c35d}

## Scientists Vs. Analysts (Josh Wills)

> - Best way to differentiate a data scientist from a data analyst. 
>    - **Data Analyst:** If my tools and data can't answer a question, then the question doesn't get answered.
>    - **Data Scientist:** If my tools and data can't answer a question, then I go get better tools and data.

## Leaving your little computer (Josh Wills)

> - [The science is the idea and then data moving to answer](https://www.youtube.com/embed/Ewd5PXgLXlU?start=488)
> - [Big is different in many ways](https://www.youtube.com/embed/Ewd5PXgLXlU?start=690)

------------------->

<!------------

# Geospatial Data {data-background=#e8c35d}

## McNamara on Mapping

> - Minute 2:45 - [Gelman on maps and variables](http://www.stat.columbia.edu/~gelman/research/published/allmaps.pdf)
> - Minute 11:15 - [Modifiable areal unit problem](https://en.wikipedia.org/wiki/Modifiable_areal_unit_problem)
> - **Minute 12:15** - [Histogram example](https://tinlizzie.org/histograms/)
> - **Minute 14:20** - [John Oliver on Gerrymandering](https://www.youtube.com/watch?v=A-4dIImaodQ) has some crude language after 6 minutes.
> - Minute 14:20 - [Washinton Post on Gerrymandering](https://www.washingtonpost.com/news/wonk/wp/2015/03/01/this-is-the-best-explanation-of-gerrymandering-you-will-ever-see/?utm_term=.21dbb215a861)
> - Minute 17:00 - [The redistring game](http://www.redistrictinggame.org/)
> - Minute 18:00 - [Talismanic Redistricting](http://cho.pol.illinois.edu/wendy/papers/talismanic.pdf)
> - Minute 20:00 - [Dasymetric Maps](https://www.e-education.psu.edu/geog486/node/1866)
> - **Minute 21:20** - [Mapping upscaling interactive example](https://tinlizzie.org/spatial/)
> - Minute 22:25 - [Side Scaling: Nested Polygons and redrawing the states](https://kevinhayeswilson.com/redraw/)
> - Minute 23:20 - [Misaligned Polygons and Flint](http://theconversation.com/how-zip-codes-nearly-masked-the-lead-problem-in-flint-65626).  Zipcodes are problematic.
> - Minute 26:19 - [Tobler's First Law](https://gisgeography.com/tobler-first-law-of-geography/)
> - Minute 26:30 - [Pycno Package](https://cran.r-project.org/web/packages/pycno/pycno.pdf)

----------->

<!-----------
## [Gelman's Conclusion](http://www.stat.columbia.edu/~gelman/research/published/allmaps.pdf)

Mapping raw data can lead to spurious spatial features. For example, regions can appear highly variable because of small sample sizes in spatial sub-units (as in the radon example) or small populations [(as in the cancer example)](https://cdn.cnn.com/cnnnext/dam/assets/170124123712-01-cancer-cluster-maps--exlarge-169.jpg), and these apparently variable regions contain a disproportionate number of very high (or low) observed parameter values

Furthermore, maps really do make convenient look-up tables (what is the cancer rate, or mean radon level, in my county?). Unfortunately, even maps that are intended to be used only as look-up tables are almost sure to be used for identifying spatial features – we find it very hard to suppress this instinct ourselves
-------------->

# Geospatial Data {data-background=#e8c35d}

## Is the earth flat?

<br>

<blockquote class="twitter-video" data-lang="en"><p lang="en" dir="ltr">Kyrie Irving was trending on Twitter today because he believes the Earth is flat. I asked him about it. <a href="https://t.co/ODe9aP9qmK">pic.twitter.com/ODe9aP9qmK</a></p>&mdash; Arash Markazi (@ArashMarkazi) <a href="https://twitter.com/ArashMarkazi/status/832770937078571008?ref_src=twsrc%5Etfw">February 18, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

## Do people believe him?

<br>

<blockquote class="twitter-video" data-lang="en"><p lang="en" dir="ltr">Uh oh: Draymond is a Flat Earth/Kyrie Truther. <a href="https://t.co/icJThyG7hx">pic.twitter.com/icJThyG7hx</a></p>&mdash; The Crossover (@TheCrossover) <a href="https://twitter.com/TheCrossover/status/833014995583643649?ref_src=twsrc%5Etfw">February 18, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

https://www.boston.com/sports/boston-celtics/2017/08/23/heres-why-kyrie-irving-thinks-the-earth-is-flat

## Which area is larger?

<br>

The continental 48 states or the country of Brazil?

- [Answer](http://www.comparea.org/USA48+BRA)
- Is education teaching us stuff that isn't true?
- [Boston has concerns about our map education](https://www.theguardian.com/education/2017/mar/19/boston-public-schools-world-map-mercator-peters-projection)


## When we make a map, what is our goal?

<br>

- Your goal will change which projection you use.
- [Can you make an accurate map?](https://www.youtube.com/watch?v=8I_VpC6IuJs)
- [Why all world maps are wrong](https://www.youtube.com/watch?v=kIID5FDi2JQ)
<!-------------
* ![](../images/cahill-keyes.jpg){ width=80% }
* The [cahill-keyes projection looks pretty good](https://xkcd.com/977/) or [check this out](https://www.youtube.com/watch?v=sD7ED12XGFo).
---------->

<!------------
## What is GDAL?

The Geospatial Data Abstraction Library (GDAL) is a C/C++ geospatial data format translation programming library and associated set of utility programs built using the library. GDAL is one of the jewels of the open source community, and I want to help you understand how to leverage its power to process spatial data. 

https://en.wikipedia.org/wiki/GDAL
http://www.gdal.org
-------------->

# Maps Vs. Variables {data-background=#e8c35d}

## What is wrong?

<br>

<!-----------"Here, you can take that, that's the final map of the numbers," Trump said, according to Reuters.  "It's pretty good, right? The red is obviously us." [1](http://www.businessinsider.com/trump-2016-electoral-map-reuters-interview-xi-jinping-china-2017-4)----------->

![](images/Ch7_maps_area_trump.png)

## Montana-Manhattan Problem

<br>

![](images/Ch7_maps_area_combined.png)

## How could we spatially depict the variable of interest?

<br>

- [Chloropleth Map](https://en.wikipedia.org/wiki/Choropleth_map)
- [Cartograms](https://en.wikipedia.org/wiki/Cartogram)
- [geofacets](https://hafen.github.io/geofacet/)

## Different views of the 2016 election numbers

<br>

>- [Check these out](http://www.businessinsider.com/2016-election-results-maps-population-adjusted-cartogram-2016-11/#heres-the-basic-electoral-college-map-with-states-that-hillary-clinton-won-in-blue-and-states-that-donald-trump-won-in-red-assuming-that-trumps-narrow-lead-in-michigan-continues-to-hold-1)

# Geospatial data in R {data-background=#e8c35d}

## sp and sf

<br>

In R, there are two main lineages of tools for dealing with spatial data: `sp` and `sf`.

>- `sp` has been around for a while, but is complex and difficult to use
>- `sf` was first released in 2016. Much easier to use with the tidyverse

## USAboundaries

<br>

The `USAboundaries` package contains functions that return `sf` files for US states, counties, and cities.

## Demo

<br>

Start by installing the packages:

```
install.packages("sf")
install.packages("USAboundaries")
```

## Demo

<br>

```
idaho <- us_states(states = "Idaho")
View(idaho)
```
<br>

What do you notice about the [structure of the data](https://r-spatial.github.io/sf/articles/sf1.html)?

## Demo

<br>

```
plot(idaho$geometry)

ggplot() + geom_sf(data = idaho)
```


