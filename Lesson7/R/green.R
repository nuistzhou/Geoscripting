# Rodrigo Almeida, Ping
# Team Dragon Masters
# 17/01/2017

# Greenest regions(municipality/provinces)
green_data <- function(r_stack, regions){
  r_masked <- mask(r_stack, regions)
  green_index <- extract(r_masked, regions, fun = mean,df=T )
  result <- cbind(regions@data, green_index)
  result$year <- rowMeans(test[17:28], na.rm = T)
  return(result)
}

green_city <- function(dataframe, period){
  id <- which.max(dataframe[[period]])
  return(dataframe[id,]$NAME_2)
}