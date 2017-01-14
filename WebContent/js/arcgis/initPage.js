var mapManager;
$(function(){
	$(document).on('contextmenu',function(){
		return false;
	});
	require([ "myDojo/TrackMap"],function(MapManager){
		mapManager=MapManager;
		initMap(mapManager,baseMap,layers);
	});
})