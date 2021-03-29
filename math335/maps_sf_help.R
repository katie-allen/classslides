#------------------------------------------------------------------

# RESOURCES and EXAMPLES
#
# http://search.r-project.org/library/ggplot2/html/stat_sf_coordinates.html
# https://ggplot2.tidyverse.org/reference/stat_sf_coordinates.html
# https://stackoverflow.com/questions/58676661/geom-sf-mapping-points-shapes
# https://austinwehrwein.com/data-visualization/housing/

library(tidyverse)

#install.packages("sf")
nc <- sf::st_read(system.file("shape/nc.shp", package="sf"))

View(nc)

nc$geometry[1]
st_crs(nc)

plot(nc$geometry)

ggplot(nc) +
  geom_sf()

ggplot(nc) +
  stat_sf_coordinates()

ggplot(nc) +
  geom_sf() +
  stat_sf_coordinates()

ggplot(nc) +
  geom_sf() +
  geom_errorbarh(
    aes(geometry = geometry,
        xmin = after_stat(x) - 0.1,
        xmax = after_stat(x) + 0.1,
        y = after_stat(y),
        height = 0.04),
    stat = "sf_coordinates"
  )

#-----------------------------------------------------


ID_counties <- USAboundaries::us_counties(states = "ID")
st_crs(ID_counties)



my_proj <- "+proj=robin +datum=WGS84"
ID_tr <- ID_counties %>% st_transform(crs = my_proj)
st_crs(ID_tr)

#Note the change in the CRS, and the lack of an EPSG

#Compare the following two plots

ggplot() + geom_sf(data = ID_counties) + theme_bw()
ggplot() + geom_sf(data = ID_tr) + theme_bw()

#Now change the projection on the fly instead of the actual dataset

ggplot() + 
  geom_sf(data = ID_counties) + 
  theme_bw() +
  coord_sf(crs = st_crs(my_proj))

#Doing a similar thing, but with a predefined EPSG

ggplot() + 
  geom_sf(data = ID_counties) + 
  theme_bw() +
  coord_sf(crs = st_crs(5041))

