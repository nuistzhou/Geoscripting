# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

download_date <- function(URL){
  # Creates data directory if not present
  system('mkdir -p data')
  # Downloads the file in data directory
  system(paste('curl -o', getwd(), '/data', URL))
  #Uses the URL to capture the year of acquisition according to LANDSAT scene name convention
  #
  year <- grep(pattern = '(?:L.{8})(\d{4})(?:.*\.tar\.gz)', URL)
  #Uses the Usame process to capture the julian year of acquisition
  day_year <- grep(pattern = '(?:L.{12})(\d{3})(?:.*\.tar\.gz)', URL)
  #Returns the year and julian day of acquisition
  return(c(year,day_year))
}