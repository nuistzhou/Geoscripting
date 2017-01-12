#!/bin/bash

echo 'Dragon Master - Rodrigo & Ping'
echo '12 January 2016'
echo 'Welcome to the NDVI calculator for LandSat imagery!'

#Changes the directory to the data folder from the Bash folder
cd ../data

#Gets the name of the tif file in data into variable input
input=$(ls *.tif)

#Names the output file to NDVI.tif
output='NDVI.tif'

#Calculate the NDVI index
gdal_calc.py -A $input --A_band=4 -B $input --B_band=3 --outfile=$output --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'

#Resamples the file to 60 m pixels
gdal_translate -ot 'Float32' -b 1 -tr 60 60 -r 'average' $output 'NDVI_60m'

