$(function(){
	require([
	         "esri/map",
	         "esri/layers/ArcGISTiledMapServiceLayer",
	         "dijit/layout/BorderContainer",
	         "dijit/layout/ContentPane",
	         "esri/geometry/Extent",
	         "dojo/domReady!"
	         ],function(Map,Layer,BorderContainer,ContentPane,Extent,Dom){
		var extent=new Extent({
			XMin: -179.999999,
			YMin: -89.999999,
			XMax: 179.999999,
			YMax: 89.999999,
			"SpatialReference":{"wkid": 4326}
		});
		var map=new Map("map", {
				logo : false,
	        });
		var layer=new Layer("http://server.arcgisonline.com/ArcGIS/rest/services/NGS_Topo_US_2D/MapServer");
		map.disableScrollWheelZoom();
		/*map.disableRubberBandZoom();
		map.disableMapNavigation();
		map.disableSnapping();
		map.disableClickRecenter();*/
		map.addLayer(layer);
	});
})