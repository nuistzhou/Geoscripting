# Rodrigo Almeida, Ping
# Team Dragon Masters
# 17/01/2017

# Greenest municipality

green_month <- function(month, r_stack, regions){
  r_subset <- subset(r_stack, month)
  r_subset_masked <- mask(r_subset, regions)
  green_index <- extract(r_subset_masked, regions, fun = mean,df=T )
  result <- cbind(regions@data, green_index)
  return(result)
}

green_city <- function(dataframe, month){
  id <- which.max(dataframe[[month]])
  return(dataframe[id,]$NAME_2)
}