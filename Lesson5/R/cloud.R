# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

cloud2NA <- function(br, fmask){
  br[fmask != 0] <- NA
  return(br)
}