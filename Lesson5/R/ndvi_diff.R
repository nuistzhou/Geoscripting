# calculate NDVI difference between 2 date
diff_ndvi <- function(input1,input2){
  #RED band to be 1st and IR to be 2nd
  ndvi1 <- (input1[2]-input1[1])/(input1[2]+input1[1])
  ndvi2 <- (input2[2]-input2[1])/(input2[2]+input2[1])
  return ndvi2-ndvi1
}
