# Rodrigo Almeida, Ping
# Team Dragon Masters
# 16/01/2017
# Download and unzip

library(tools)

# Download files
download <- function(URL){
  
  # Creates data directory if not present
  dir.create(file.path('data'), showWarnings = FALSE)
  
  zip_file <- basename(URL)
  dataset_name <- file_path_sans_ext(zip_file)
  
  # Downloads the file in data directory
  download.file(URL, zip_file)

  # Unzips the file in the folder
  unzip(zip_file, exdir = paste0('data/',dataset_name))
  
  # Removes zip file
  file.remove(zip_file)
  
  # Returns dataset name
  return(dataset_name)
}
