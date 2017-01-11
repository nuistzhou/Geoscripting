# Note: RUnit package required

test.is.leap <- function(){
  checkEquals(is.leap(2000), TRUE)
  checkEquals(is.leap(2002), FALSE)
  checkException(is.leap(1581) )
  checkException(is.leap('Rodrigo & Ping'))
}