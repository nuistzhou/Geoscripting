# Rodrigo Almeida, Ping
# Team Dragon Masters
# 17/01/2017

# Libraries needed
library(rgdal)
library(raster)

source('R/download.R')

# Download necessary files
modis_name <- download('https://raw.githubusercontent.com/GeoScripting-WUR/VectorRaster/gh-pages/data/MODIS.zip')
nlMunicipality <- getData('GADM',country='NLD', level=2, path = 'data')

modis_file <- list.files(paste0('data/',modis_name),'*.gri', full.names = T)
modis <- stack(modis_file)

