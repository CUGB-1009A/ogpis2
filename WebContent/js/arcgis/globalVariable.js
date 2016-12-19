function MapSymbol() {
	this.pointSymbol;
	this.lineSymbol;
	this.plolyLineSymbol;
	this.polygonSymbol;
	initSymbol.call(this);// 初始化符号
}
function MapManager(options) {
	this.map;
	this.mapDom;
	this.layers;
	this.layersDom;
	this.symbol = new MapSymbol();
	this.navToolbar;
	/* this.navDom; */
	this.extent;
	this.drawToolBar;
	/* this.drawDom; */
	this.legend;
	this.queryGeometry;
	this.init = init;// 初始化地图及工具
	this.setLayers = setLayers;// 设计思路：在创建图层Layer时指定Layer的className属性，通过className属性来标识Layer
	initMapManager.call(this, options);
}

function setLayers(array) {
	try {
		if (this.layersDom) {
			this.layersDom.empty();
			array = array || this.layers;
			if (array)
				for (var i = 0; i < array.length; ++i) {
					var layerID = array[i];
					var content = "<div><input type='checkbox' value='"
							+ layerID;
					var layer;
					if (layerID == "graphics")
						layer = this.map.graphics;
					else
						layer = this.map.getLayer(layerID);
					if (layer.visible == true)
						content += "' checked/><label>";
					else
						content += "' /><label>";
					content += layer.className ? layer.className : layer.id
							+ "</label></div>";
					this.layersDom.append(content);
				}
		} else {
			return;
		}
	} catch (err) {
		alert(err.message);
		return;
	}
}

function initMapManager(options) {
	if (options) {
		if (options.map) {
			this.mapDom = options.map;// 元素ID
		}
		if (options.navToolbar) {
			this.navDom = options.navToolbar;// jQuery对象集
		}
		if (options.drawToolBar) {
			this.drawDom = options.drawToolBar;// jQuery对象集
		}
		if (options.layers) {
			this.layersDom = options.layers;// jQuery对象集
		}
	}
}
function init() {
	this.layersDom.on("click", "input[type='checkbox']", {
		map : this.map
	}, function(event) {
		var target = $(event.target);
		var map = event.data.map;
		var layerID = target.attr("value");
		if (target[0].checked) {// 为什么能拿到target对象呢？闭包
			if (layerID == "graphics")
				map.graphics.show();
			else
				map.getLayer(layerID).show();
		} else {
			if (layerID == "graphics")
				map.graphics.hide();
			else
				map.getLayer(layerID).hide();
		}
	});
	this.layersDom.on("dblclick","div>label",{map:this.map},function(e){
		var map=e.data["map"];
		var layerID=$(this).siblings("input").attr("value");
		var extent;
		if (layerID == "graphics"){
			extent=map.graphics.fullExtent;
		}
		else{
			extent=map.getLayer(layerID).fullExtent;
		}
		if(extent)
			map.setExtent(extent);
	})
}