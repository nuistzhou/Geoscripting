#import necessary library
library(raster)
source('ndvi_diff.R')

#Download archives and untar



#Make brick
LT5_files <- list.files(path = 'LT5', pattern = '*.tif')
LC8_files <- list.files(path = 'LC8', pattern = '*.tif')

LT5 <- brick(LT5_files[1],LT5_files[4],LT5_files[5],LT5_files[10],LT5_files[11])
LT5 <- brick(LT5_files)
LT5 <- stack(LT5_files)
LT5_files[1]
LC8 <- brick(x=c(LT5_files[1],LT5_files[5],LT5_files[6],LT5_files[10],LT5_files[11]))

#Remove cloud






#NDVI changes over years
ndvi_diff <- calc(input1=, input2= )