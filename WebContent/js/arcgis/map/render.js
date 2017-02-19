var PolygonRenderInfo = {
	layerId : "",
	matchFiled1 : "",// 地图与数据匹配时，图层的匹配字段
	renderFiled : "",// 地图渲染的字段
	param : {},// 数据查询条件
	matchFiled2 : "",// 地图与数据匹配时，数据的匹配字段
	valueFiled : "",// 数据中包含图层渲染值的字段
	values : [],// 渲染的值
	levels : 3,// 渲染分的区间数
	// 渲染使用的符号,数据类型是数组，第一个符号为默认的符号，如果符号不够用，则使用默认符号
	symbols : Symbols.toArray("FillSymbol")
}
function renderPloygon(info) {
	var layer = mapManager.map.getLayer(info.layerId);
	var graphics = layer.graphics;
	getTargetInfo(info.param, [ paraseRenderValues, paraseTargetData ], info,
			graphics);// 同步调用
	render(info);
}
function paraseRenderValues(data, info) {
	if (info.values || info.values.length < 2) {
		var tempArray = [];
		for (var i = 0; i < data.length; ++i) {
			tempArray.push(data[i].valueFiled);
		}
		tempArray.sort();
		var min = tempArray[0];
		var max = tempArray.slice(-1)[0];
		info.levels = info.levels || 3;
		var temp = (max - min) / levels;
		for (var i = 0; i < info.levels + 1; ++i) {
			info.values.push(min + temp * i);
		}
	}
}

function paraseTargetData(data, info, graphics) {
	var length = graphics.length;
	for (var i = 0; i < length; ++i) {
		var field = graphics[i].attributes[info.matchFiled1];
		for (var j = 0; j < data.length; ++j) {
			if (data[j].matchFiled2 == field) {
				graphics[i].attributes[renderFiled] = data.splice(j, 1)[0].valueFiled;
				break;
			}
		}
	}
}

function render(info) {
	require([ "esri/renderers/ClassBreaksRenderer", "esri/layers/FeatureLayer",
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