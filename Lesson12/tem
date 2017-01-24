# Import modules
import os
from osgeo import gdal
from osgeo.gdalconst import GA_ReadOnly, GDT_Float32
import numpy as np
import urllib
import tarfile

# Set working directory to path of main.py
working_path = os.path.dirname(os.path.realpath("__file__"))
os.chdir(working_path)
# Create data folder if not exists
if not os.path.exists('data'):
    os.makedirs('data')
# Download and unzip files
url = "https://www.dropbox.com/s/zb7nrla6fqi1mq4/LC81980242014260-SC20150123044700.tar.gz?dl=1"
urllib.urlretrieve (url,"data/LC8.tar.gz")
tar = tarfile.open("data/LC8.tar.gz")
#tar.extract(".*band4.*",path = "data/LC8")
#tar.extract("*band5.tif",path = "data/LC8")
tar.extractall("data/LC8")
tar.close()
# Define the function to derive NDWI
def ndwi(band4,band5):
    return (band4-band5)/(band4+band5)
    
