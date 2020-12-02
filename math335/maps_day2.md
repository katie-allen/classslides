---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Maps: Day 2 {data-background=#f7d754}

Welcome to class!

## Reading Discussion

## Tracking Progress

> - Don't forget to keep track of your tasks.
> - Semester project should be moving along (it is next week's case study).
>- If you need another class presentation, do it next week.

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


# Coordinate Reference System {data-background=#f7d754}

## [What is a CRS?](https://docs.qgis.org/3.16/en/docs/gentle_gis_introduction/coordinate_reference_systems.html#:~:text=Map%20projections%20try%20to%20portray,of%20paper%20or%20computer%20screen.&text=A%20coordinate%20reference%20system%20(CRS,real%20places%20on%20the%20earth.)

- "**Map projections** try to portray the surface of the earth, or a portion of the earth, on a flat piece of paper or computer screen."
- "A **coordinate reference system** (CRS) then defines how the two-dimensional, projected map in your GIS relates to real places on the earth."

## What is a CRS?



## CRS

* What is a CRS?
* What info is contained in a [CRS](https://mgimond.github.io/Spatial/coordinate-systems-in-r.html#assigning-a-coordinate-system)?
* What is an EPSG? ([find a EPSG](https://epsg.org/home.html))

<!-- EPSG is a set of pre-defined CRS's that is maintained by the IOGP Geomatic's Committee. (Some industry group) -->

* You can use a proj4 string to define a CRS, or a specific EPSG number.

## Using the sf package to work with CRS

Run the code below, what do you get?


```r
ID_counties <- USAboundaries::us_counties(states = "ID")
st_crs(ID_counties)
```

## Coding Example: Changing the projection

* Change the CRS associated with the dataset
* Change the projection on the fly when creating a visualization



## Convert to another projection

Go to class activity in I-learn to change your previous tasks's map to a different projection. (or advance to the next two slides). Let's have a few people share.

[Old activity instructions](https://byuistats.github.io/M335/spatial_class.html) 

## Method 1

Altering the projection by using an EPSG

* Search for an EPSG that works: https://epsg.org/home.html.

## Method 2

Altering the projection parameters of the CRS in the proj4string

* Here is a nice list of some standard examples (http://www.radicalcartography.net/?projectionref). Look in the "Name" column for names of differnet projections.
* Then we can 'search' for that name here: projection type (http://spatialreference.org/ref/).
    *  Click on "Proj4" to get the proj4string.
        * Look specifically at the input for the "+proj=" argument.
    *  The proj4 format information can be helpfull12.
* There are many online examples3 of using R for spatial as well.

Note the use of +lat_0=45 and +lon_0=-115 and what they do your map.
