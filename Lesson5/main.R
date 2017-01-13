# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

#Import necessary library
library(raster)
source('R/ndvi_diff.R')
source('R/download.R')
source('R/cloud.R')

#Download archives and untar
LC8 <- download('https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz?dl=1')
LT5 <- download('https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz?dl=1')

#Make brick
LT5_files <- list.files(path = paste('data/',LT5, sep=''), pattern = '*.tif', full.names = TRUE)
LC8_files <- list.files(path = paste('data/',LC8, sep=''), pattern = '*.tif', full.names = TRUE)
LT5_brick <- stack(LT5_files)
LC8_brick <- stack(LC8_files)

#Prints acquisition date - NOT WORKING
#dateLC8 <- date_acquisition(LC8)
#dateLT5 <- date_acquisition(LT5)
#print(LC8, 'was acquired in',dateLC8[1],'/',dateLC8[2])
#print(LT5, 'was acquired in',dateLT5[1],'/',dateLT5[2])

#Get fmask layers
LT5_fmask <-LT5_brick[[1]]
LC8_fmask <-LC8_brick[[1]]

LT5_cloudfree <- cloud2NA(LT5_brick, LT5_fmask)
LC8_cloudfree <- cloud2NA(LC8_brick, LC8_fmask)

#set extent
LT5_i <- intersect(LT5_cloudfree, LC8_cloudfree)
LC8_i <- intersect(LC8_cloudfree,LT5_i)

#NDVI dif
NDVI_diff <- ndvi_diff(LC8_i,LT5_i,)
