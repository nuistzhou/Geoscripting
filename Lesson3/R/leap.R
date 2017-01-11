# is.leap function definition

is.leap <- function(year) {
  if (is.numeric(year) && year > 0){
    if (year %% 4 != 0){
      return(FALSE)
    }
    else if (year %% 100 != 0){
      return(TRUE)
    }
    else if (year %% 400 != 0){
      return(FALSE)
    }
    else {
      return(TRUE)
    }
  }
  else if (is.numeric(0)) {
    return(paste("Warning:", year, "is out of the valid range."))
  }
  else {
    return("Error: argument of class numeric expected")
  }
}

