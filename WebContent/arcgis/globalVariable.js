function MapSymbol() {
	this.pointSymbol;
	this.lineSymbol;
	this.plolyLineSymbol;
	this.polygonSymbol;
	this.init=initSymbol;//初始化符号
}
function MapManager(options) {
	this.map;
	this.mapDom;
	this.layers;
	this.layersDom;
	this.symbol = new MapSymbol();
	this.navToolbar;
	this.navDom;
	this.extent;
	this.drawToolBar;
	this.drawDom;
	this.queryGeometry;
	this.init=initMap;//初始化地图及工具
	if(options){
		if(options.map){
			this.mapDom=options.map;//元素ID
		}
		if(options.layers){
			this.layersDom=options.layers;//jQuery对象集
		}
		if(options.navToolbar){
			this.navDom=options.navToolbar;//jQuery对象集
		}
		if(options.drawToolBar){
			this.drawToolBar=options.drawToolBar;//jQuery对象集
		}
	}
}