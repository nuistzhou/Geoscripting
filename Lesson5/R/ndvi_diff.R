# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

# calculate NDVI difference between 2 date
# two input are stacks for 2 years
ndvi_diff <- function(input1,input2) {
  #RED band is 2nd layer and IR is 3rd layer
  ndvi1 <- (input1[[3]]-input1[[2]])/(input1[[3]]+input1[[1]])
  ndvi2 <- (input2[[3]]-input2[[2]])/(input2[[3]]+input2[[1]])
  return (c((ndvi1-ndvi2),ndvi1,ndvi2))
}
