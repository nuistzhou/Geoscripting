# is.leap function definition, with year as a parameter

is.leap <- function(year) {
  # Checks is the parameter is of type numeric and in the algorithm range (>= 1582)
  if (is.numeric(year) && year >= 1582){
    # Wikipedia algorithm to determine leap year
    # Source: https://en.wikipedia.org/wiki/Leap_year
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
  # Returns a warning if the value is out of range (< 1582)
  else if (is.numeric(year)) {
    return(stop(paste(year, "is out of the valid range."), call. = FALSE))
  }
  # Returns an error if the value is not numeric
  else {
    return(stop("Argument of class numeric expected.", call. = FALSE))
  }
}

