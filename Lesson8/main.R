# Rodrigo Almeida, Ping
# Team Dragon Masters
# 18/01/2017

# Libraries and sources
library(raster)

# Load necessary files (everything in data folder)
for (name in list.files('data/', full.names = T)){
  load(name)
}

#REMOVE LATER
load('data/trainingPoly.rda')


# Clean up data
vcfGewata[vcfGewata>100 | vcfGewata<0 ] <- NA
GewataB1[GewataB1>700 | GewataB1 <200] <- NA
GewataB2[GewataB2>700 | GewataB2 <200] <- NA
GewataB3[GewataB3>900 | GewataB3 <200] <- NA
GewataB4[GewataB4>3200 | GewataB4 <1500] <- NA
GewataB5[GewataB5>3000 | GewataB5 <900] <- NA
GewataB7[GewataB7>2000 | GewataB7 <300] <- NA

# Creates a brick
gewata <- brick(GewataB1, GewataB2, GewataB3, GewataB4, GewataB5, GewataB7, vcfGewata)

# Gives names to layers in brick
names(gewata) <- c('band1', 'band2', 'band3', 'band4', 'band5', 'band7', 'VCF')

# Plots relashionships between bands 
pairs(gewata)

# Extract data to a data frame
gewataDF <- as.data.frame(getValues(gewata))

# Create model
model <- lm(VCF ~ band1 + band2 + band3 + band4 + band5 + band7, data = gewataDF)
summary(model)

# Subset predictors
gewataDF_pred <- gewataDF[1:6]

# Get the predictions
VCF_pred <- predict(model, gewataDF_pred, na.rm = T)

# Gets the prediction in the brick
gewata$VCF_predict <- VCF_pred
gewataDF$VCF_predict <- VCF_pred

# Display 
par(mfrow = c(3,1))
plot(gewata$VCF, main = 'VCF')
plot(gewata$VCF_predict, main = 'Predicted VCF')

# Calculates and displays the difference
gewata$VCF_diff <- gewata$VCF_predict - gewata$VCF
plot(gewata$VCF_diff, main = 'VCF difference')
par(mfrow = c(1,1))

# Calculate global RMSE
RMSE <- sqrt(sum((gewataDF$VCF_predict - gewataDF$VCF)^2,na.rm = T)/nrow(gewataDF))
print(paste('The global RMSE is', RMSE))

# Prepare training data
trainingPoly@data$Code <- as.numeric(trainingPoly@data$Class)
trainingRaster <- rasterize(trainingPoly, gewata, field = 'Code')

# Create squared difference
gewata$VCF_diff2 <- (gewata$VCF_predict - gewata$VCF)^2

# Make zonal statistics
RMSE_classes <- zonal(gewata$VCF_diff2, trainingRaster, fun = mean)
RMSE_classes[,2] <- sqrt(RMSE_classes[,2])
print(RMSE_classes)
