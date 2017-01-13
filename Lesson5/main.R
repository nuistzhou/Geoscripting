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

#Remove extreme abnormal values
LT5_cloudfree[LT5_cloudfree > 1 ] <- 1
LT5_cloudfree[LT5_cloudfree < 0 ] <- 0

LC8_cloudfree[LC8_cloudfree  > 1 ] <- 1
LC8_cloudfree[LC8_cloudfree < 0 ] <- 0


#set extent
LT5_i <- intersect(LT5_cloudfree, LC8_cloudfree)
LC8_i <- intersect(LC8_cloudfree,LT5_i)

#NDVI dif
<<<<<<< HEAD

NDVI_diff <- calc(c(LC8_i,LT5_i,LC8_brick[6],LC8_brick[5],LT5_brick[7],LT5_brick[6]),fun = ndvi_diff)

NDVI_diff <- ndvi_diff(LC8_i,LT5_i,6,5,7,6)
LT5_files
LC8_files



#Remove cloud





#NDVI changes over years
ndvi_diff <- calc(input1=, input2= )
=======
NDVI_diff <- ndvi_diff(LC8_i,LT5_i)
>>>>>>> origin/master
