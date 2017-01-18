# Rodrigo Almeida, Ping
# Team Dragon Masters
# 18/01/2017

# Libraries and sources
library(raster)

# Load necessary files (everything in data folder)
for (name in list.files('data/', full.names = T)){
  load(name)
}

# Creates a brick
gewata <- brick(GewataB1, GewataB2, GewataB3, GewataB4, GewataB5, GewataB7, vcfGewata)

# Gives names to layers in brick
names(gewata) <- c('band1', 'band2', 'band3', 'band4', 'band5', 'band7', 'VCF')

# Extract data to a data frame
gewataDF <- as.data.frame(getValues(gewata))

# Remove outliers and change scale
gewataDF[1:6] <- gewataDF[1:6]/10000
gewataDF$VCF[gewataDF[7] > 100] <- NA

# Plots relashionships between bands 
pairs(gewata)

