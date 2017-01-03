# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

cloud2NA <- function(sta, fmask){
  sta[fmask != 0] <- NA
  return(sta)
}