//拖动工具条
function onDrag(e) {
	var height = parseInt($("#tab1").css("height"));
	var d = e.data;
	if (d.left < 0) {
		d.left = 0;
	}
	if (d.top < 0) {
		d.top = 0;
	}
	if (d.left + d.target.scrollWidth > d.parent.scrollWidth) {
		d.left = d.parent.scrollWidth - d.target.scrollWidth;
	}
	if (d.top + d.target.scrollHeight > d.parent.scrollHeight) {
		d.top = d.parent.scrollHeight - d.target.scrollHeight
	}
}
// 禁用地图导航工具条
function deNavBar(mapManager) {
	mapManager.navToolbar.deactivate();
}
// 地图全图
function Home(mapManager) {
	mapManager.map.setExtent(mapManager.extent);
}
// 平移
function ZoomPan(mapManager) {
	mapManager.navToolbar.deactivate();
}
// 地图放大
function ZoomIn(mapManager) {
	require([ "esri/toolbars/navigation" ], function(Navigation) {
		mapManager.navToolbar.activate(Navigation.ZOOM_IN);
	})
}
// 地图放大
function ZoomOut(mapManager) {
	require([ "esri/toolbars/navigation" ], function(Navigation) {
		mapManager.navToolbar.activate(Navigation.ZOOM_OUT);
	})
}
// 开启画点模式
function DrawPoint(mapManager) {
	require([ "esri/toolbars/draw" ], function(Draw) {
		mapManager.drawToolBar.activate(Draw.POINT);
	})
}
// 禁用画图供给条
function deDrawBar(mapManager) {
	mapManager.drawToolBar.deactivate();
}
// 开启画线模式
function DrawLine(mapManager) {
	require([ "esri/toolbars/draw" ], function(Draw) {
		mapManager.drawToolBar.activate(Draw.POLYLINE);
	})
}
// 开启画线多边形模式
function DrawPloygon(mapManager) {
	require([ "esri/toolbars/draw" ], function(Draw) {
		mapManager.drawToolBar.activate(Draw.POLYGON);
	})
}
// 开启画线多边形模式
function DrawRectangle(mapManager) {
	require([ "esri/toolbars/draw" ], function(Draw) {
		mapManager.drawToolBar.activate(Draw.RECTANGLE);
	})
}
// 右键快捷菜单
function mapContextMenu(domId) {
	var toolbar = $(domId);
	var parent = toolbar.parent();
	var x = event.offsetX;
	var y = event.offsetY;
	parent.css("left", x);
	parent.css("top", y);
	parent.show();
	toolbar.one("click", "input[type='checkbox']", function() {
		var target = $(event.target)[0];
		var toolbar = $(target.value).parent();
		if (target.checked) {// 为什么能拿到target对象呢？闭包
			toolbar.css("left", x);
			toolbar.css("top", y);
			toolbar.show();
		} else {
			toolbar.hide();
		}
		parent.hide();
	});
}

// 地图点击响应
function mapClick(layer, e) {
	console.log(e.graphic);
	var attr = e.graphic.attributes;
	var content = "";
	for ( var i in attr) {
		console.log(i);
		content += "<p>" + i + ":" + attr[i] + "</p>"
	}
	this.map.infoWindow.setContent(content);
	this.map.infoWindow.setTitle(layer.className + "信息框");
	this.map.infoWindow.show(e.graphic.geometry, this.map
			.getInfoWindowAnchor(e.graphic.geometry));
}
// 显示infoWindow
function showInfoWin(data) {// data中要包含标题、内容、和点坐标
	map.infoWindow.setContent(data.content);
	map.infoWindow.setTile(data.title);
	map.infoWindow.show(data.point, map.getInfoWindowAnchor(data.point));
}
// 点选查询
function pointIdentifyTask(point, url, layerId) {
	require([ "esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters" ],
			function(IdentifyTask, IdentifyParameters) {
				var task = new IdentifyTask(url);
				var taskParam = new IdentifyParameters();
				// 冗余范围
				taskParam.tolerance = 2;
				// 返回地理元素
				taskParam.returnGeometry = true;
				// 查询的图层
				taskParam.layerIds = [ layerId ];
				// 查询范围
				taskParam.mapExtent = initExtent;
				// 执行查询
				task.execute(taskParam, function(results) {
					if (results.length < 1)
						return;
				})
			})
}
// 条件查询
function queryTask(mapManager, options) {
	require([ "esri/tasks/query", "esri/tasks/QueryTask",
			"esri/symbols/SimpleMarkerSymbol", "esri/Color", "esri/graphic",
			"esri/layers/GraphicsLayer", "myDojo/SggChartLayer",
			"myDojo/SggChartGraphics" ], function(Query, QueryTask, Symbol,
			Color, Graphic, GraphicsLayer, SggChartLayer, SggChartGraphics) {
		var task = new QueryTask(options.url + "/" + options.layerId);
		var query = new Query();
		// 返回要素
		query.returnGeometry = true;
		// 返回字段
		query.outFields = [ "*" ];
		// 查询条件
		query.where = options.sql;
		// 执行查询
		task.execute(query,
				function(results) {
					var symbol = new esri.symbol.SimpleFillSymbol();
					var graphicsLayer = new GraphicsLayer({
						className : "MyGraphics2",
						id : "MyGraphics2",
						opacity : 0.75
					});
					graphicsLayer.setRenderer(new esri.renderer.SimpleRenderer(
							symbol));
					if (results.features && results.features.length > 0) {
						mapManager.map.graphics.clear();
						var symbol = new Symbol(Symbol.STYLE_SQUARE, 10,
								new Symbol(Symbol.STYLE_SOLID, new Color([ 255,
										0, 0 ]), 1), new Color([ 0, 255, 0,
										0.25 ]));
						for (var i = 0; i < results.features.length; ++i) {
							var feature = results.features[i];
							var g = new Graphic(feature.geometry, null,
									feature.attributes);
							graphicsLayer.add(g);
						}
						graphicsLayer.on("update-end", function(evt) {
							var showFields = [ "FID" ];
							createChartInfoWindow(graphicsLayer, showFields);
						});
						mapManager.map.addLayer(graphicsLayer);
					}
				})
	});
}
// 空间查询
function queryTaskByGeometry(mapManager, options) {
	var data = new Array();
	require([ "esri/tasks/query", "esri/tasks/QueryTask",
			"esri/symbols/SimpleMarkerSymbol", "esri/Color", "esri/graphic" ],
			function(Query, QueryTask, Symbol, Color, Graphic) {
				var task = new QueryTask(options.url + "/" + options.layerId);
				var query = new Query();
				// 返回要素
				query.returnGeometry = true;
				// 返回字段
				query.outFields = [ "FID", 'Tree_ID', "Collected" ];
				// 查询元素
				query.geometry = options.geometry;
				// 执行查询
				task.execute(query, function(results) {
					console.log(123);
					console.log(results);
					if (results.features && results.features.length > 0) {
						/* console.log(map.graphicsLayerIds); */
						/* mapManager.map.getLayer("graphicsLayer1").hide(); */
						mapManager.map.graphics.clear();
						var symbol = new Symbol(Symbol.STYLE_SQUARE, 10,
								new Symbol(Symbol.STYLE_SOLID, new Color([ 255,
										0, 0 ]), 1), new Color([ 0, 255, 0,
										0.25 ]));
						for (var i = 0; i < results.features.length; ++i) {
							var feature = results.features[i];
							data.push(feature.attributes);
							var g = new Graphic(feature.geometry,
									mapManager.symbol.pointSymbol);
							mapManager.map.graphics.add(g);
						}
						/*
						 * var data=results.features[0].attributes; var
						 * geometry=results.features[0].geometry; for(var i in
						 * data){ }
						 */
					}
				})
			});
}
// 显示信息
function showTip(e) {
	var g = e.graphic;
	var data = e.attributes;
	var content = "";
	for ( var i in data) {

	}
	showInfoWin(obj);
}
// 触发与取消工具条
function toogleToolBar() {
	$("#mapTooDiv").toggle();
	var icon = "";
	if ($("#mapTooDiv").is(":visible"))
		icon = "icon-current";
	$("#mapMenu").menu("setIcon", {
		target : $("#m-toolbar")[0],
		iconCls : icon
	})
}
// 显示工具条
function showMapMenu(e) {
	var toolbar = $("#mapToolsDiv").parent();
	toolbar.css("left", event.clientX);
	toolbar.css("top", event.clientY);
	toolbar.show();
}
// 获取绘画的结果
function getDrawResult(e) {
	var options = {
		url : "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer",
		layerId : 0,
		geometry : e.geometry
	}
	queryTaskByGeometry(this, options);
	this.drawToolBar.deactivate();
}
// 初始化符号
function initSymbol() {
	require([ "esri/symbols/SimpleMarkerSymbol",
			"esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleFillSymbol",
			"esri/symbols/PictureMarkerSymbol" ], setSymbol(this));
}
function setSymbol(thisObj) {
	return function(SimpleMarkerSymbol, SimpleLineSymbol, SimpleFillSymbol,
			PictureMarkerSymbol) {
		thisObj.pointSymbol = new SimpleMarkerSymbol({
			"type" : "esriSMS",
			"style" : "esriSMSSquare",
			"color" : [ 76, 115, 0, 255 ],
			"size" : 8,
			"angle" : 0,
			"xoffset" : 0,
			"yoffset" : 0,
			"outline" : {
				"color" : [ 152, 230, 0, 255 ],
				"width" : 1
			}
		});
		thisObj.lineSymbol = new SimpleLineSymbol({
			"type" : "esriSLS",
			"style" : "esriSLSDot",
			"color" : [ 115, 76, 0, 255 ],
			"width" : 1
		});
		thisObj.plolyLineSymbol = new SimpleLineSymbol({
			"type" : "esriSLS",
			"style" : "esriSLSDot",
			"color" : [ 115, 76, 0, 255 ],
			"width" : 3
		});
		thisObj.polygonSymbol = new SimpleFillSymbol({
			"type" : "esriSFS",
			"style" : "esriSFSSolid",
			"color" : [ 115, 76, 0, 255 ],
			"outline" : {
				"type" : "esriSLS",
				"style" : "esriSLSSolid",
				"color" : [ 110, 110, 110, 255 ],
				"width" : 1
			}
		});
	}
}
// 初始化地图
function initMap(mapManager) {
	require(
			[ "dojo/parser", "esri/map", "esri/geometry/Point",
					"esri/geometry/Polyline", "esri/geometry/Polygon",
					"esri/geometry/Extent", "esri/graphic",
					"esri/geometry/Geometry", "esri/layers/GraphicsLayer",
					"esri/layers/FeatureLayer",
					"esri/layers/ArcGISTiledMapServiceLayer",
					"esri/layers/ArcGISDynamicMapServiceLayer",
					"esri/layers/ArcGISImageServiceLayer",
					"esri/layers/ImageParameters",
					"esri/symbols/SimpleMarkerSymbol",
					"esri/symbols/SimpleLineSymbol",
					"esri/symbols/SimpleFillSymbol",
					"esri/symbols/PictureMarkerSymbol", "esri/tasks/query",
					"esri/tasks/QueryTask", "esri/tasks/FindTask",
					"esri/tasks/FindParameters", "esri/tasks/FindResult",
					"esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters",
					"esri/toolbars/navigation", "esri/toolbars/draw",
					"dijit/layout/BorderContainer", "dijit/layout/ContentPane",
					"dojo/_base/lang", "esri/renderers/ClassBreaksRenderer",
					"esri/dijit/Legend", "esri/renderers/SimpleRenderer",
					"myDojo/SggChartLayer", "myDojo/SggChartGraphics",
					"dojo/domReady!" ],
			function(Parser, Map, Point, Polyline, Polygon, Extent, Graphic,
					Geometry, GraphicsLayer, FeatureLayer,
					ArcGISTiledMapServiceLayer, ArcGISDynamicMapServiceLayer,
					ArcGISImageServiceLayer, ImageParameters,
					SimpleMarkerSymbol, SimpleLineSymbol, SimpleFillSymbol,
					PictureMarkerSymbol, Query, QueryTask, FindTask,
					FindParameters, FindResult, IdentifyTask,
					IdentifyParameters, Navigation, Draw, BorderContainer,
					ContentPane, lang, ClassBreaksRenderer, Legend,
					SimpleRenderer, Dom) {
				Parser.parse();
				mapManager.map = new Map(mapManager.mapDom, {
					logo : false,
					wrapAround180 : false,
				/* basemap : "hybrid", */
				/*
				 * center : [ -82.44109, 35.6122 ], zoom : 17
				 */
				});
				var tiledLayer = new ArcGISTiledMapServiceLayer(
						"http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer",
						{
							className : "地理地图"
						});
				mapManager.extent = tiledLayer.initialExtent;
				var dynLayer = new ArcGISDynamicMapServiceLayer(
						"http://sampleserver5.arcgisonline.com/ArcGIS/rest/services/Energy/Geology/MapServer");
				var tree = new FeatureLayer(
						"https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0",
						{
							id : 5,
							className : "Tree",
							outFields : [ "*" ]
						});
				var citiesPop = new FeatureLayer(
						"http://services.arcgis.com/V6ZHFr6zdgNZuVG0/ArcGIS/rest/services/WorldCities/FeatureServer/0",
						{
							id : 6,
							className : "人口",
							outFields : [ "*" ]
						});

				var graphicsLayer = new GraphicsLayer({
					className : "MyGraphics",
					id : "MyGraphics",
					opacity : 0.75,
					visible : false
				});
				mapManager.map.addLayers([ tiledLayer, tree, citiesPop ]);
				// mapManager.map.addLayer(tiledLayer);
				// mapManager.map.addLayer(tree);
				// mapManager.map.addLayer(citiesPop);
				// mapManager.map.addLayer(graphicsLayer);

				// 去掉esri官方数据的Resource标签
				window.onload = function() {
					$(".esriAttributionLastItem").hide();
				}
				mapManager.map.on("layers-add-result", lang.hitch(mapManager,
						addLegend));
				mapManager.map.on("load", function() {
					mapManager.layers = mapManager.map.graphicsLayerIds.concat(
							mapManager.map.layerIds, "graphics");
					mapManager.setLayers();
					mapManager.navToolbar = new Navigation(mapManager.map);
					mapManager.drawToolBar = new Draw(mapManager.map);
					mapManager.drawToolBar.on("draw-end", lang.hitch(
							mapManager, getDrawResult));
					citiesPop.on("click", lang.hitch(mapManager, mapClick,
							citiesPop));
					tree.on("click", lang.hitch(mapManager, mapClick, tree));
					// var info = {
					// field : "C_Storage",
					// valueUnit : "unknown",
					// minDataValue : 10,
					// minSize : 0.3,
					// minSize : 1,
					// legendOptions : {
					// symbol: mapManager.symbol.pointSymbol,
					// customValues : [ 100, 500, 1000,
					// 3000, 5000, 10000 ]
					// }
					// };

					// var render = new
					// SimpleRenderer(mapManager.symbol.pointSymbol);
					// tree.on("load", function() {
					// // tree.setRenderer(render);
					// console.log(typeof tree.renderer);
					// tree.renderer.setProportionalSymbolInfo(info);
					// var legend = new Legend({
					// map : mapManager.map,
					// layerInfos : [ {
					// defaultSymbol:false,
					// layer : tree,
					// title : "tree"
					// } ]
					// }, "legend");
					// legend.startup();
					// });
					mapManager.init();
				});
			});
}

function getTiledJson() {
	return this.resourceInfo;
}
function getFeatureJson() {
	return this._json;
}

// 符号渲染器
function initRender(mapManager) {
	require([ "esri/renderers/UniqueValueRenderer",
			"esri/renderers/ClassBreaksRenderer",
			"esri/symbols/SimpleMarkerSymbol", "esri/layers/FeatureLayer",
			"dojo/_base/lang" ], function(UniqueValueRenderer,
			ClassBreaksRenderer, SimpleMarkerSymbol, FeatureLayer, lang) {
		var render = new ClassBreaksRenderer(mapManager.symbol.pointSymbol,
				"FID");
		var symbol1 = new SimpleMarkerSymbol({
			"type" : "esriSMS",
			"style" : "esriSMSSquare",
			"color" : [ 0, 115, 0, 255 ],
			"size" : 8,
			"angle" : 0,
			"xoffset" : 0,
			"yoffset" : 0,
			"outline" : {
				"color" : [ 152, 230, 0, 255 ],
				"width" : 1
			}
		});
		render.addBreak(0, 500, symbol1);
		var symbol2 = new SimpleMarkerSymbol({
			"type" : "esriSMS",
			"style" : "esriSMSSquare",
			"color" : [ 75, 0, 0, 255 ],
			"size" : 8,
			"angle" : 0,
			"xoffset" : 0,
			"yoffset" : 0,
			"outline" : {
				"color" : [ 152, 230, 0, 255 ],
				"width" : 1
			}
		});
		render.addBreak(500, 800, symbol2);
		var layer = mapManager.map.getLayer("5");
		layer.setRenderer(render);
		layer.redraw();
		this.legend.refresh();
	});
}

// 添加地图图例
function addLegend(e) {
	var map = this.map;
	require([ "esri/dijit/Legend" ], function(Legend) {
		var layers = e.layers;
		var legend = new Legend({
			map : map,
			layerInfos : []
		}, "legend");
		for (var i = 0; i < layers.length; ++i) {
			var layer = layers[i].layer;
			if (layer.url.indexOf("FeatureServer") != -1) {
				legend.layerInfos.push({
					// defaultSymbol : false,
					layer : layer,
					title : layer.className
				});
				setRendererInfo(layer);
			}
		}
		legend.startup();
		this.legend = legend;
	});
}

function setRendererInfo(layer, info) {
	var info = info
			|| {
				field : "pop",
				valueUnit : "unknown",
				minDataValue : 1000000,
				minSize : 0.1,
				minSize : 3,
				legendOptions : {
					symbol : mapManager.symbol.pointSymbol,
					customValues : [ 1000000, 5000000, 10000000, 20000000,
							30000000, 40000000 ]
				}
			};
	layer.renderer.setProportionalSymbolInfo(info);
}