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

modis_file <- list.files(paste0('data/',modis_name),'*.gri', full.names = T)
modis <- stack(modis_file)

# Transforms the municipality dataset into the CRS of modis ndvi
nlMunicipality <- spTransform(nlMunicipality, CRS(proj4string(modis)))

# Crops to the nhetherlands extent for efficency 
modis <- crop(modis, nlMunicipality)

# TO FUNCTION
# Greenest municipality in January
green_jan <- green_month('January',modis, nlMunicipality)
print(paste('The greenest municipality in January is',green_city(green_jan, 'January')))

# Greenest municipality in January
green_aug <- green_month('August',modis, nlMunicipality)
print(paste('The greenest municipality in August is',green_city(green_aug, 'August')))



