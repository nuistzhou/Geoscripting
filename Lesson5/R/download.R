# Rodrigo Almeida, Ping
# Team Dragon Masters
# 13/01/2017

#In the dropbox link, please use ?dl=1 in the end of the URL instead of ?dl=0
download <- function(URL){
  # Creates data directory if not present
  system('mkdir -p data')
  tar_file <- regmatches(URL, regexec('L.+.tar.gz', URL))
  scene_name <- regmatches(URL, regexec('L.{32}', URL))
  # Downloads the file in data directory
  download.file(URL, tar_file[[1]])
  # Untars the file in the folder
  untar(tar_file[[1]], exdir = paste('data/',scene_name[[1]],sep=''))
  # Removes tar file
  system(paste('rm',tar_file[[1]]))
  # Returns downloaded file name
  return(scene_name[[1]])
}

date_acquisition <- function(scene_name){
  # Uses the filename to capture the year of acquisition according to LANDSAT scene name convention
  # http://gisgeography.com/landsat-file-naming-convention/
  year <- regexpr('(?:L.{8})(.{4})(?:.*\\.tar\\.gz)', filename)
  # Uses the same process to capture the julian year of acquisition
  day_year <- regexpr('(?:L.{12})(.{3})(?:.*\\.tar\\.gz)', filename)
  # Returns the year and julian day of acquisition
  return(c(year,day_year))
}
