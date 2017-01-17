# Rodrigo Almeida, Ping
# Team Dragon Masters
# 17/01/2017

# Libraries needed
library(rgdal)
library(raster)
source('R/download.R')
source('R/green.R')
 
# Download necessary files
modis_name <- download('https://raw.githubusercontent.com/GeoScripting-WUR/VectorRaster/gh-pages/data/MODIS.zip')
nlMunicipality <- getData('GADM',country='NLD', level=2, path = 'data')
nlProvince <- getData('GADM',country='NLD', level=1, path = 'data')

modis_file <- list.files(paste0('data/',modis_name),'*.gri', full.names = T)
modis <- stack(modis_file)

# Transforms the municipality dataset into the CRS of modis ndvi
nlMunicipality <- spTransform(nlMunicipality, CRS(proj4string(modis)))
nlProvince <- spTransform(nlProvince, CRS(proj4string(modis)))

# Crops to the netherlands extent for efficency 
modis <- crop(modis, nlMunicipality)

# Create the data frame with NDVI for 12 months in whole regions
green_municipality <- green_data(modis,nlMunicipality)
green_province <- green_data(modis, nlProvince)

# Greenest municipality in January
print(paste('The greenest municipality in January is',green_district(green_municipality, 'January')))

# Greenest municipality in August
print(paste('The greenest municipality in August is',green_district(green_municipality, 'August')))

# Greenest municipality in the year
print(paste('The greenest municipality in the year is',green_district(green_municipality, 'year')))

# Greenest Provice in January
print(paste('The greenest province in January is',green_district(green_province, 'January')))

# Greenest Province in August
print(paste('The greenest province in August is',green_district(green_province, 'August')))

# Greenest Province in the year
print(paste('The greenest province in the year is',green_district(green_province, 'year')))

# Gets the values of NDVI into the polygons data set
nlMunicipality@data$year <- green_municipality$year
nlMunicipality@data$January <- green_municipality$January
nlMunicipality@data$August <- green_municipality$August
nlProvince@data$year <- green_province$year
nlProvince@data$January <- green_province$January
nlProvince@data$August <- green_province$August

# Plots
opar <- par(mfrow=c(2,3))
spplot(nlMunicipality, 'year', main = 'Year NDVI avg')
spplot(nlMunicipality, 'January', main = 'January NDVI avg')
spplot(nlMunicipality, 'August', main = 'August NDVI avg')
spplot(nlProvince, 'year', main = 'year NDVI avg province')
spplot(nlProvince, 'January', main = 'January NDVI avg province')
spplot(nlProvince, 'August', main = 'August NDVI avg province')
par(opar)
