from osgeo import ogr, osr
import os

os.chdir(os.path.dirname(__file__))

driverName = "ESRI Shapefile"
drv = ogr.GetDriverByName( driverName )

a_file = 'data/points.shp'
layername = 'a_layer'

ds = drv.CreateDataSource(a_file)

spatialReference = osr.SpatialReference()
spatialReference.ImportFromEPSG(4326)

layer = ds.CreateLayer(layername, spatialReference, ogr.wkbPoint)

kml_file = ogr.Open('data/points.kml')

for lay in kml_file:
    for feat in lay:
        geom = feat.GetGeometryRef()
        if geom != None:
            point = []
            for i in range(0, geom.GetPointCount()):
                coords = geom.GetPoint(i)
                point = ogr.Geometry(ogr.wkbPoint)
                point.SetPoint(0,coords[0],coords[1])
                layerDef = layer.GetLayerDefn()
                feature = ogr.Feature(layerDef)
                feature.SetGeometry(point)
                layer.CreateFeature(feature)

ds.Destroy()
