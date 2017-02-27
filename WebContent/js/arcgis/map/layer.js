var LayersList = {
	baseUrl : "http://192.168.1.114:6080/arcgis/rest/services/",
	baseMap : {
		url : "baseMap/MapServer",
		info:{
			className:"地理底图"
		}
	},
	basin : {
		url : "basin/MapServer",
		info:{
			className:"盆地图层",
			outFields : [ "*" ],
			id:"盆地图层"
		},
		id0 : 0
	// 盆地图层
	},
	getUrl : function(layerName, id) {
		var url;
		try {
			if (layerName && typeof layerName=="string") {
				url = this.baseUrl + this[layerName].url;
				if (id) {
					url += "/" + id;
				}
			}
			return url;
		} catch (message) {
			console.log(message);
			return undefined;
		}
	},
	getInfo:function(layerName){
		try {
			if (layerName && typeof layerName=="string") {
				return this[layerName].info;
			}
		} catch (message) {
			console.log(message);
			return undefined;
		}
	},
	getLayers:function(layerNames){
		var layers=[];
		if(layerNames instanceof Array){
			for(var index in layerNames){
				layers.push(getLayer(layerNames[index]));
			}
		}else if(typeof layerNames=="string"){
			layers.push(getLayer(layerNames));
		}
		return layers;
	},
	getLayer:function(layerName){
		var temp={};
		try{
			temp.url=this.getUrl(layerName);
			temp.layer=this.getInfo(layerName);
		}catch(message){
			console.log(message);
			return undefined;
		}
		return temp;
	}
}