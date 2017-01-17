# Rodrigo Almeida, Ping
# Team Dragon Masters
# 17/01/2017

# Calculate NDVI
ndvi <- function(red,nir) {
  #RED band and Infra Red layer
  value <- ((nir-red)/(red+nir))
  return (value)
}
