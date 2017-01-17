# Rodrigo Almeida, Ping
# Team Dragon Masters
# 16/01/2017

# Import necessary libraries
source('R/download.R')
library(sp)
library(rgdal)
library(rgeos)

# Downloads source files
railways_folder <- download('http://www.mapcruzin.com/download-shapefile/netherlands-railways-shape.zip')
places_folder <- download('http://www.mapcruzin.com/download-shapefile/netherlands-places-shape.zip')

# Read files
railways_dir_shp <- list.files(path = paste0('data/',railways_folder),pattern = '.*.shp', full.names = T)
railways <- readOGR(railways_dir_shp,ogrListLayers(railways_dir_shp))

places_dir_shp <- list.files(path = paste0('data/',places_folder),pattern = '.*.shp', full.names = T)
places <- readOGR(places_dir_shp,ogrListLayers(places_dir_shp))

# Project data into RD
prj_string_RD <- CRS("+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +units=m +no_defs")
railways <- spTransform(railways,prj_string_RD)
places <- spTransform(places,prj_string_RD)

# Subsets the railways to industrial railways
industrial_railways <- subset(railways, railways$type == 'industrial')

# Buffer the industrial railways to 1000 m
industrial_buffer <- gBuffer(industrial_railways, byid = T, width = 1000)

# Intersect with places
places_in_industrial <- gIntersection(places,industrial_buffer, id=as.character(places$osm_id),byid=T)

# Joined other data to intersection result by osm_id, creates spatial point data frame
places_in_industrial <- places[places$osm_id == rownames(places_in_industrial@coords),]

# plot city, buffer 
plot(industrial_buffer, col = 'blue',xlab="Lat", ylab="Lon", axes=T)
plot(places_in_industrial, add = T, col='red')
text(places_in_industrial@coords+130,as.character(places_in_industrial$name), col = 'black')
mtext('The city in Railway 1000m buffer', line = 1)

# places_in_industrial
  #city name    #Population
# Utrecht city     100000
