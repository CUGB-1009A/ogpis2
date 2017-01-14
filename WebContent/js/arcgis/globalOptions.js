var baseMap={
	url:"http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer",
	layer:{
		className:"地理底图"
	}
}
var layers=[{
	url:"https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0",
	layer:{
		className:"Tree",
		outFields : [ "*" ],
		id:"Tree"
	}
},{
	url:"http://services.arcgis.com/V6ZHFr6zdgNZuVG0/ArcGIS/rest/services/WorldCities/FeatureServer/0",
	layer:{
		className:"人口",
		outFields : [ "*" ],
		id:"人口"
	}
}]
var renderLayerId="Tree"