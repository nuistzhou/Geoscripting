# Rodrigo Almeida, Ping
# Team Dragon Masters
# 16/01/2017

# Import necessary libraries
source('R/download.R')

# Downloads source files
railways <- download('http://www.mapcruzin.com/download-shapefile/netherlands-railways-shape.zip')
places <- download('http://www.mapcruzin.com/download-shapefile/netherlands-places-shape.zip')