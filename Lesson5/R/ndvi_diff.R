# calculate NDVI difference between 2 date
diff_ndvi <- function(input1,input2,r1,r2,i1,i2){
  #RED band to be 1st and IR to be 2nd
  ndvi1 <- (input1[i1]-input1[r1])/(input1[i1]+input1[r1])
  ndvi2 <- (input2[i2]-input2[r2])/(input2[i2]+input2[r2])
  return (ndvi2-ndvi1)
}
