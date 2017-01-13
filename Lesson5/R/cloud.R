cloud2NA <- function(br, fmask){
  br[fmask != 0] <- NA
  return(br)
}