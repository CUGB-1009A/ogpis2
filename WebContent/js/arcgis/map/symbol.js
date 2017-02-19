var Symbols = {
	PointSymbol : {},
	LineSymbol : {},
	FillSymbol : {},
	init : function() {
		require([ "esri/symbols/SimpleMarkerSymbol",
				"esri/symbols/SimpleLineSymbol",
				"esri/symbols/SimpleFillSymbol",
				"esri/symbols/PictureMarkerSymbol", "esri/Color" ],
				this.initSymbols(this));
	},
	toArray:function(symbolType,not){
		var symbols=this[symbolType];
		return $.map(symbols,function(ele){
			return ele;
		})
	},
	initSymbols : function(thisObj) {
		return function(SimpleMarkerSymbol, SimpleLineSymbol, SimpleFillSymbol,
				PictureMarkerSymbol, Color) {
			// 线符号
			thisObj.LineSymbol.DefaultSymbol = new SimpleLineSymbol(// 默认符号
			SimpleLineSymbol.STYLE_SOLID, new Color([ 0, 0, 0 ]), 1);
			thisObj.LineSymbol.HlightSymbol = new SimpleLineSymbol(// 高亮显示符号
			SimpleLineSymbol.STYLE_SOLID, new Color([ 0, 0, 255 ]), 2);
			thisObj.LineSymbol.HlightSymbol2 = new SimpleLineSymbol(// 高亮中高亮的显示符号
			SimpleLineSymbol.STYLE_SOLID, new Color([ 255, 0, 255 ]), 3);
			thisObj.LineSymbol.HlightSymbol3 = new SimpleLineSymbol(// 高亮中常突出的显示符号
			SimpleLineSymbol.STYLE_SOLID, new Color([ 255, 255, 255 ]), 0.01);
			// 点符号
			thisObj.PointSymbol.DefaultSymbol = new SimpleMarkerSymbol(// 默认符号
			SimpleMarkerSymbol.STYLE_DIAMOND, 15,
					thisObj.LineSymbol.DefaultSymbol, new Color([ 255, 255,
							0, 0.5 ]));
			thisObj.PointSymbol.HlightSymbol = new SimpleMarkerSymbol(// 高亮符号
			SimpleMarkerSymbol.STYLE_DIAMOND, 15,
					thisObj.LineSymbol.DefaultSymbol, new Color([ 255, 0,
							0, 0.5 ]));
			// 面符号
			thisObj.FillSymbol.DefaultSymbol = new SimpleFillSymbol(// 默认符号
			SimpleFillSymbol.STYLE_SOLID, thisObj.LineSymbol.DefaultSymbol,
					new Color([ 0, 255, 0, 1 ]));
			thisObj.FillSymbol.HlightSymbol = new SimpleFillSymbol(// 高亮符号
			SimpleFillSymbol.STYLE_SOLID, thisObj.LineSymbol.HlightSymbol,
					new Color([ 125, 125, 125, 1 ]));
			thisObj.FillSymbol.HlightSymbol2 = new SimpleFillSymbol(// 高亮符号
			SimpleFillSymbol.STYLE_SOLID, thisObj.LineSymbol.HlightSymbol2,
					new Color([ 125, 125, 125, 1 ]));
			thisObj.FillSymbol.HlightSymbol3 = new SimpleFillSymbol(// 高亮符号
			SimpleFillSymbol.STYLE_SOLID, thisObj.LineSymbol.HlightSymbol3,
					new Color([ 125, 125, 125,1 ]));
		}
	}
}
$(function() {
	Symbols.init()
});