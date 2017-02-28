function PolygonRenderInfo(options) {
	this.layerId = options.layerId || "basin";
	this.matchField1 = options.matchField1 || "Name";// 地图与数据匹配时；图层的匹配字段
	this.renderField = options.renderField || "renderValue";// 地图渲染的字段
	this.params = options.params || {};// 数据查询条件
	this.matchField2 = options.matchField2 || "basinName";// 地图与数据匹配时；数据的匹配字段
	this.valueField = options.valueField || "";// 数据中包含图层渲染值的字段
	this.values = options.values || null;// 渲染的值
	this.levels = options.levels || 3;// 渲染分的区间数
	// 渲染使用的符号;数据类型是数组；第一个符号为默认的符号；如果符号不够用；则使用默认符号
	this.symbols = options.symbols || Symbols.toArray("FillSymbol");
}

function PointRenderInfo(options) {
	this.layerId = options.layerId || "map_graphics";
	this.matchField1 = options.matchField1 || "Name";// 地图与数据匹配时；图层的匹配字段
	this.renderField = options.renderField || "renderValue";// 地图渲染的字段
	this.params = options.params || {};// 数据查询条件
	this.matchField2 = options.matchField2 || "basinName";// 地图与数据匹配时；数据的匹配字段
	this.valueField = options.valueField || "";// 数据中包含图层渲染值的字段
	this.values = options.values || null;// 渲染的值
	this.levels = options.levels || 3;// 渲染分的区间数
	// 渲染使用的符号;数据类型是数组；第一个符号为默认的符号；如果符号不够用；则使用默认符号
	this.symbols = options.symbols || Symbols.toArray("PointSymbol");
}

function PointRenderInfo(options) {
	this.layerId = options.layerId || "basin";
	this.matchField1 = options.matchField1 || "Name";// 地图与数据匹配时；图层的匹配字段
	this.renderField = options.renderField || "renderValue";// 地图渲染的字段
	this.params = options.params || {};// 数据查询条件
	this.matchField2 = options.matchField2 || "basinName";// 地图与数据匹配时；数据的匹配字段
	this.valueField = options.valueField || "";// 数据中包含图层渲染值的字段
	this.values = options.values || null;// 渲染的值
	this.levels = options.levels || 3;// 渲染分的区间数
	// 渲染使用的符号;数据类型是数组；第一个符号为默认的符号；如果符号不够用；则使用默认符号
	this.symbols = options.symbols || Symbols.toArray("FillSymbol");
}

function renderPloygon(info) {
	var layer = mapManager.map.getLayer(info.layerId);
	var graphics = layer.graphics;
	while (graphics.length == 0) {
		graphics = layer.graphics;
	}
	var params = new SpaceAnalysisInfo({
		target : "target",
		params : info.params
	});
	getTargetOrLayoutInfo(params, [ paraseRenderValues, paraseTargetData ],
			info, graphics);// 同步调用
	reRender(info);
}

function renderPoint(info) {
	var layer = mapManager.map.getLayer(info.layerId);
	var graphics = layer.graphics;
	while (graphics.length == 0) {
		graphics = layer.graphics;
	}
	var params = new SpaceAnalysisInfo({
		target : "layout",
		params : info.params
	});
	getTargetOrLayoutInfo(params, [ paraseRenderValues, paraseTargetData ],
			info, graphics);// 同步调用
	reRender(info);
}

function paraseRenderValues(data, info) {
	if (!info.values || info.values.length < 2) {
		var tempArray = [];
		for (var i = 0; i < data.length; ++i) {
			tempArray.push(data[i].valueField);
		}
		tempArray.sort();
		var min = tempArray[0];
		var max = tempArray.slice(-1)[0];
		info.levels = info.levels || 3;
		var temp = (max - min) / levels;
		for (var i = 0; i < info.levels + 1; ++i) {
			info.values.push(min + temp * i);
		}
	} else {
		info.levels = info.values.length - 1;
	}
}

function paraseTargetData(data, info, graphics) {
	var length = graphics.length;
	for (var i = 0; i < length; ++i) {
		var field = graphics[i].attributes[info.matchField1];
		if (data.length > 0) {
			for (var j = 0; j < data.length; ++j) {
				if (data[j][info.matchField2] == field) {
					graphics[i].attributes[info.renderField] = data
							.splice(j, 1)[0][info.valueField];
					break;
				}
				if (j == data.length - 1) {
					graphics[i].attributes[info.renderField] = 0;
				}
			}
		} else {
			graphics[i].attributes[info.renderField] = 0;
		}
	}
}

function reRender(info) {
	require(
			[ "esri/renderers/ClassBreaksRenderer", "esri/layers/FeatureLayer",
					"dojo/_base/lang" ],
			function(ClassBreaksRenderer, FeatureLayer, lang) {
				var render = new ClassBreaksRenderer(info.symbols[0],
						info.renderField);
				for (var i = 0; i < info.levels; ++i) {
					render.addBreak(info.values[i], info.values[i + 1],
							info.symbols[i + 1] ? info.symbols[i + 1]
									: info.symbols[0]);
				}
				var layer = mapManager.map.getLayer(info.layerId);
				layer.setRenderer(render);
				layer.redraw();
			});
}

function renderPoint(info) {
	require([ "esri/renderers/ClassBreaksRenderer",
			"esri/renderers/SimpleRenderer", "esri/layers/FeatureLayer",
			"dojo/_base/lang" ], function(ClassBreaksRenderer,
			SimpleRenderer, FeatureLayer, lang) {
		var graphics = mapManager.map.graphics.graphics;
		var values = info.values;
		for (var i = 0; i < graphics.length; ++i) {
			var g = graphics[i];
			var v = g.attributes[info.renderField];
			g.setSymbol(info.symbols[0]);
			for (var j = 0; j < info.levels; ++j) {
				if (values[j] <= v && v < values[j + 1]) {
					if (info.symbols[j + 1])
						g.setSymbol(info.symbols[j + 1]);
					else
						g.setSymbol(info.symbols[0]);
					break;
				}
			}
		}
	});
}