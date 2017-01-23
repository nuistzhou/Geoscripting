# Module pyshp needed

import folium
import os

# From @frankrowe/shp2gj.py
import shapefile
# read the shapefile
reader = shapefile.Reader("data/points.shp")
fields = reader.fields[1:]
field_names = [field[0] for field in fields]
buffer = []
for sr in reader.shapeRecords():
    atr = dict(zip(field_names, sr.record))
    geom = sr.shape.__geo_interface__
    buffer.append(dict(type="Feature",geometry=geom, properties=atr)) 
   
# write the GeoJSON file
from json import dumps
geojson = open("data/points.json", "w")
geojson.write(dumps({"type": "FeatureCollection","features": buffer}, indent=2) + "\n")
geojson.close()
   
pointsGeo = os.path.join("data/points.json")
map_points = folium.Map(location=[51.97,5.66],tiles='Stamen Terrain', zoom_start=14)
map_points.choropleth(geo_path=pointsGeo)
map_points.save('data/points.html')