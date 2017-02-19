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
},{
	url:"https://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer/3",
	layer:{
		/*mode: FeatureLayer.MODE_SNAPSHOT,*/
		definitionExpression:"POP2007=8760",
        outFields: ["*"],
		className:"地区",
		id:"地区"
	}
}]
var renderLayerId="Tree"