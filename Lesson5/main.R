# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

#Import necessary library
source('R/down_untar.R')
library(raster)
source('R/ndvi_diff.R')
source('R/download.R')
source('R/cloud.R')

#Download archives and untar
LC8 <- download('https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz?dl=1')
LT5 <- download('https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz?dl=1')

#Make stack
LT5_files <- list.files(path = paste('data/',LT5, sep=''), pattern = '*.tif', full.names = TRUE)
LC8_files <- list.files(path = paste('data/',LC8, sep=''), pattern = '*.tif', full.names = TRUE)
#Red is band3(6th in list), Infre red is band 4(7th in list) in landsat 5
LT5_stack <-  subset(stack(LT5_files),c(1,6,7))
#Red is band 4(5th in list), infra red is band 5(6th in list) in landsat 8
LC8_stack <- subset(stack(LC8_files),c(1,5,6))

#Prints acquisition date - NOT WORKING
#dateLC8 <- date_acquisition(LC8)
#dateLT5 <- date_acquisition(LT5)
#print(LC8, 'was acquired in',dateLC8[1],'/',dateLC8[2])
#print(LT5, 'was acquired in',dateLT5[1],'/',dateLT5[2])

#set extent
crop_mask <- intersect(LT5_stack, LC8_stack)
LC8_extented <- crop(LC8_stack,crop_mask)
LT5_extented <- crop(LT5_stack,crop_mask)


#Get fmask layers
LT5_fmask <- LT5_extented[1]
LC8_fmask <- LC8_extented[1]

LT5_cloudfree <- cloud2NA(LT5_extented, LT5_fmask)
LC8_cloudfree <- cloud2NA(LC8_extented, LC8_fmask)


#NDVI dif

NDVI_diff <- ndvi_diff(LC8_cloudfree,LT5_cloudfree)
#NDVI_diff <- calc(c(LC8_cloudfree,LT5_cloudfree), fun = ndvi_diff)

# plot(NDVI_diff[[1]])
# plot(NDVI_diff[[2]])
plot(NDVI_diff[[3]])
