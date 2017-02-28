var baseMap = {
	url : "http://192.168.1.113/ArcGIS/rest/services/basemap/MapServer",/* "http://192.168.1.105:6080/arcgis/rest/services/basemap/MapServer", */
	/* url:"http://192.168.1.105:6080/arcgis/rest/services/SampleWorldCities/MapServer", */
	layer : {
		className : "地理底图"
	}
}
var layers = [ {
	url : "http://192.168.1.105:6080/arcgis/rest/services/basin/MapServer/0",
	layer : {
		definitionExpression : "Name in ('鄂尔多斯盆地','松辽盆地','渤海湾盆地','塔里木盆地','准噶尔盆地','四川盆地','鄂西','北部湾盆地','东海陆架盆地')",
		mode : 0,
		className : "规划规模",
		outFields : [ "*" ],
		id : "basin"
	}
} ]
var projectParam = {
	url : "http://192.168.1.105:6080/arcgis/rest/services/Utilities/Geometry/GeometryServer",
	outSR : 'PROJCS["Lambert_Conformal_Conic",GEOGCS["GCS_Xian_1980",DATUM["D_Xian_1980",SPHEROID["Xian_1980",6378140.0,298.257]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Lambert_Conformal_Conic"],PARAMETER["False_Easting",0.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",102.0],PARAMETER["Standard_Parallel_1",25.0],PARAMETER["Standard_Parallel_2",47.0],PARAMETER["Scale_Factor",1.0],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]'
}
var renderLayerId = "Tree"