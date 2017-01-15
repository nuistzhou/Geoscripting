# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017
# Download files and get files' date

# Download files
#In the dropbox link, please use ?dl=1 in the end of the URL instead of ?dl=0
download <- function(URL){
  
  # Creates data directory if not present
  dir.create(file.path('data'), showWarnings = FALSE)
  tar_file <- regmatches(URL, regexec('L.+.tar.gz', URL))
  scene_name <- regmatches(URL, regexec('L.{32}', URL))
  
  # Downloads the file in data directory
  download.file(URL, tar_file[[1]])

  # Untars the file in the folder
  untar(tar_file[[1]], exdir = paste0('data/',scene_name[[1]],sep=''))
  
  # Removes tar file
  file.remove (tar_file[[1]])
  
  # Returns downloaded file name
  return(scene_name[[1]])
}

# Get files' date
date_acquisition <- function(scene_name){
  # Uses the filename to capture the year of acquisition according to LANDSAT scene name convention
  # http://gisgeography.com/landsat-file-naming-convention/
  year <- substr(scene_name,10,13)
  # Uses the same process to capture the julian year of acquisition
  day_year <- substr(scene_name,14,16)
  # Returns the year and julian day of acquisition
  return(c(year,day_year))
}             
