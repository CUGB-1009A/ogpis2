var map;
var navToolbar;
var initExtent;
var drawToolBar;
var globalGeometry;
/*
 * $(function() { require( [ "dojo/parser", "esri/map", "esri/geometry/Point",
 * "esri/geometry/Polyline", "esri/geometry/Polygon", "esri/geometry/Extent",
 * "esri/geometry/Geometry", "esri/layers/GraphicsLayer",
 * "esri/layers/FeatureLayer", "esri/layers/ArcGISTiledMapServiceLayer",
 * "esri/layers/ArcGISDynamicMapServiceLayer",
 * "esri/layers/ArcGISImageServiceLayer", "esri/layers/ImageParameters",
 * "esri/symbols/SimpleMarkerSymbol", "esri/symbols/SimpleLineSymbol",
 * "esri/symbols/SimpleFillSymbol", "esri/symbols/PictureMarkerSymbol",
 * "esri/tasks/query", "esri/tasks/QueryTask", "esri/tasks/FindTask",
 * "esri/tasks/FindParameters", "esri/tasks/FindResult",
 * "esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters",
 * "esri/toolbars/navigation", "esri/toolbars/draw",
 * "dijit/layout/BorderContainer", "dijit/layout/ContentPane", "dojo/domReady!" ],
 * function(Parser, Map, Point, Polyline, Polygon, Extent, Geometry,
 * GraphicsLayer, FeatureLayer, ArcGISTiledMapServiceLayer,
 * ArcGISDynamicMapServiceLayer, ArcGISImageServiceLayer, ImageParameters,
 * SimpleMarkerSymbol, SimpleLineSymbol, SimpleFillSymbol, PictureMarkerSymbol,
 * Query, QueryTask, FindTask, FindParameters, FindResult, IdentifyTask,
 * IdentifyParameters, Navigation, Draw, BorderContainer, ContentPane, Dom) {
 * Parser.parse(); map = new Map("map", { logo : false, wrapAround180 : false,
 * basemap : "hybrid", center : [ -82.44109, 35.6122 ], zoom : 17 }); var
 * tiledLayer = new ArcGISTiledMapServiceLayer(
 * "http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer");
 * initExtent = tiledLayer.initialExtent; var dynLayer = new
 * ArcGISDynamicMapServiceLayer(
 * "http://sampleserver5.arcgisonline.com/ArcGIS/rest/services/Energy/Geology/MapServer");
 * var featureLayer = new FeatureLayer(
 * "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0",{
 * definitionExpression:"FID = 900" }); map.addLayer(tiledLayer);
 * map.addLayer(featureLayer); // 去掉esri官方数据的Resource标签 window.onload =
 * function() { $(".esriAttributionLastItem").hide(); } map.on("load",
 * function() { navToolbar = new Navigation(map); drawToolBar = new Draw(map);
 * drawToolBar.on("draw-end",getDrawResult); });
 * featureLayer.on("click",mapClick) }); });
 */

function initMap() {
	require([ "myDojo/TrackMap","dojo/parser", "esri/map", "esri/geometry/Point",
			"esri/geometry/Polyline", "esri/geometry/Polygon",
			"esri/geometry/Extent", "esri/geometry/Geometry",
			"esri/layers/GraphicsLayer", "esri/layers/FeatureLayer",
			"esri/layers/ArcGISTiledMapServiceLayer",
			"esri/layers/ArcGISDynamicMapServiceLayer",
			"esri/layers/ArcGISImageServiceLayer",
			"esri/layers/ImageParameters", "esri/symbols/SimpleMarkerSymbol",
			"esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleFillSymbol",
			"esri/symbols/PictureMarkerSymbol", "esri/tasks/query",
			"esri/tasks/QueryTask", "esri/tasks/FindTask",
			"esri/tasks/FindParameters", "esri/tasks/FindResult",
			"esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters",
			"esri/toolbars/navigation", "esri/toolbars/draw",
			"dijit/layout/BorderContainer", "dijit/layout/ContentPane",
			"dojo/domReady!" ], initMapWorker);
	function initMapWorker(MapManager,Parser, Map, Point, Polyline, Polygon, Extent,
			Geometry, GraphicsLayer, FeatureLayer, ArcGISTiledMapServiceLayer,
			ArcGISDynamicMapServiceLayer, ArcGISImageServiceLayer,
			ImageParameters, SimpleMarkerSymbol, SimpleLineSymbol,
			SimpleFillSymbol, PictureMarkerSymbol, Query, QueryTask, FindTask,
			FindParameters, FindResult, IdentifyTask, IdentifyParameters,
			Navigation, Draw, BorderContainer, ContentPane, Dom) {
		Parser.parse();
		this.map = new Map(MapManager.mapDom, {
			logo : false,
			wrapAround180 : false,
			/* basemap : "hybrid", */
			center : [ -82.44109, 35.6122 ],
			zoom : 17
		});
		
		var tiledLayer = new ArcGISTiledMapServiceLayer(
				"http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer");
		initExtent = tiledLayer.initialExtent;
		var dynLayer = new ArcGISDynamicMapServiceLayer(
				"http://sampleserver5.arcgisonline.com/ArcGIS/rest/services/Energy/Geology/MapServer");
		var featureLayer = new FeatureLayer(
				"https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0",
				{
					definitionExpression : "FID = 900"
				});
		this.map.addLayer(tiledLayer);
		this.map.addLayer(featureLayer);
		// 去掉esri官方数据的Resource标签
		window.onload = function() {
			$(".esriAttributionLastItem").hide();
		}
		this.map.on("load", function() {
			this.navToolbar = new Navigation(map);
			this.drawToolBar = new Draw(map);
			this.drawToolBar.on("draw-end", getDrawResult);
		});
		featureLayer.on("click", mapClick)
	}
}

function initSymbol() {
	require([ "esri/symbols/SimpleMarkerSymbol",
			"esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleFillSymbol",
			"esri/symbols/PictureMarkerSymbol" ], function(SimpleMarkerSymbol,
			SimpleLineSymbol, SimpleFillSymbol, PictureMarkerSymbol) {
		this.pointSymbol = new SimpleMarkerSymbol();
		this.lineSymbol = new SimpleLineSymbol();
		this.plolyLineSymbol = new SimpleLineSymbol();
		this.polygonSymbol = new SimpleFillSymbol();
	});
}