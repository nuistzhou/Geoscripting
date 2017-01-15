# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

# calculate NDVI difference between 2 date
# two inputs are stacks of 2 date
ndvi_diff <- function(c(input1,input2)) {
  #RED band is 1st layer and Infra Red is 2nd layer
  ndvi1 <- ((input1[[2]]-input1[[1]])/(input1[[2]]+input1[[1]]))
  ndvi2 <- ((input2[[2]]-input2[[1]])/(input2[[2]]+input2[[1]]))
  return (c(ndvi1,ndvi2,(ndvi1-ndvi2)))
}
