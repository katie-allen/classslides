---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Maps: Day 2 {data-background=#e8c35d}

Welcome to class!

## Reading Discussion

## Tracking Progress

> - Don't forget to keep track of your tasks.
> - Semester project should be moving along (it is next week's case study).
>- If you need another class presentation, do it next week.

## [xkcd](https://imgs.xkcd.com/comics/mercator_projection.png)

# Task 23 {data-background=#e8c35d}

# Prep for Task 24 {data-background=#e8c35d}

## Pro tip:

Actually read/watch the resources listed.

## What is a CRS?

- "**Map projections** try to portray the surface of the earth, or a portion of the earth, on a flat piece of paper or computer screen."
- "A **coordinate reference system** (CRS) then defines how the two-dimensional, projected map in your GIS relates to real places on the earth."

[source](https://docs.qgis.org/3.16/en/docs/gentle_gis_introduction/coordinate_reference_systems.html#)



<!----------------

## Prepping for Class Task

Write out in a sentence what this code is doing. Make sure to catch the key points in your sentence

Note: file_delete and dir_delete are part of the fs package 


```r
pacman::p_load(downloader, sf, fs, tidyverse)
dams_path <- "https://research.idwr.idaho.gov/gis/Spatial/Hydrography/streams_lakes/c_250k/hyd250.zip"
df <- tempfile(); uf <- tempfile()
download(dams_path, df, mode = "wb")
unzip(df, exdir = uf)
rivers <- read_sf(uf)
file_delete(df); dir_delete(uf)
```

---------------->

## How to define a CRS

>- What info is contained in a [CRS](https://mgimond.github.io/Spatial/coordinate-systems-in-r.html#assigning-a-coordinate-system)?
>- What is an EPSG? ([find a EPSG](https://epsg.org/home.html))
>- In R, you can use define a CRS with:
>   - a proj4 string
>   - a specific EPSG number

<!-- EPSG is a set of pre-defined CRS's that is maintained by the IOGP Geomatic's Committee. (Some industry group) -->

## Using the sf package to work with CRS

Run the code below, what do you get?


```r
ID_counties <- USAboundaries::us_counties(states = "ID")
st_crs(ID_counties)
```

## Coding Example: Changing the projection

>- Change the CRS associated with the dataset
>- Change the projection on the fly when creating a visualization



<!-------------------
## Convert to another projection

Go to class activity in I-learn to change your previous tasks's map to a different projection. (or advance to the next two slides). Let's have a few people share.

[Old activity instructions](https://byuistats.github.io/M335/spatial_class.html) 
-------------->

## Method 1

Altering the projection by using an EPSG

* Search for an EPSG that works: https://epsg.org/home.html.

## Method 2

Altering the projection parameters of the CRS in the proj4 string

* Here is a nice list of some standard examples (http://www.radicalcartography.net/?projectionref). Look in the "Name" column for names of differnet projections.
* Then we can 'search' for that name here: projection type (http://spatialreference.org/ref/).
    *  Click on "Proj4" to get the proj4string.
        * Look specifically at the input for the "+proj=" argument.
    *  The proj4 format information can be helpfull12.
* There are many online examples3 of using R for spatial as well.

<!---
Note the use of +lat_0=45 and +lon_0=-115 and what they do your map.
--->

# Task 24 {data-background=#e8c35d}

## Some helpful things

>- How to read in a shp file
>- `USAboundaries::state_plane()`
>- `sf::st_transform()`
