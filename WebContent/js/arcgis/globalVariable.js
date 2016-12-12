function MapSymbol() {
	this.pointSymbol;
	this.lineSymbol;
	this.plolyLineSymbol;
	this.polygonSymbol;
	this.init = initSymbol;// 初始化符号
}
function MapManager(options) {
	this.map;
	this.mapDom;
	this.layers;
	this.layersDom;
	this.symbol = new MapSymbol();
	this.navToolbar;
	/*this.navDom;*/
	this.extent;
	this.drawToolBar;
	/*this.drawDom;*/
	this.queryGeometry;
	this.init = init;// 初始化地图及工具
	this.setLayers = setLayers;
	initMapManager.call(this, options);
}

function setLayers(array) {
	try {
		if (this.layersDom) {
			this.layersDom.empty();
			array = array || this.layers;
			if (array)
				for (var i = 0; i < array.length; ++i) {
					this.layersDom.append("<div><input type='checkbox' value='"
							+ array[i] + "' checked/><label>" + array[i]
							+ "</label></div>")
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
function init(){
	this.layersDom.on("click", "input[type='checkbox']",{map:this.map},function(event) {
		var target = $(event.target);
		var map=event.data.map;
		if (target[0].checked) {// 为什么能拿到target对象呢？闭包
			console.log("111");
			map.getLayer(target.attr("value")).show();
		} else {
			map.getLayer(target.attr("value")).hide();
		}
	})
}