#!/bin/bash

echo 'Dragon Master - Rodrigo & Ping'
echo '12 January 2016'
echo 'Welcome to the NDVI calculator for LandSat imagery!'

#Gets the name of the tif file in data into variable input
input=$(ls ../data/[!NDVI]*.tif)

#Names the output file to NDVI.tif
output='../data/NDVI.tif'

#Calculate the NDVI index
gdal_calc.py -A $input --A_band=4 -B $input --B_band=3 --outfile=$output --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'

#Resamples the file to 60 m pixels
gdal_translate -ot 'Float32' -b 1 -tr 60 60 -r average $output '../data/NDVI_60m.tif'

#Reproject resampled file to Lat/Long WGS84
gdalwarp -t_srs 'EPSG:4326' -r cubic '../data/NDVI_60m.tif' '../data/NDVI_60m_reproj.tif'



