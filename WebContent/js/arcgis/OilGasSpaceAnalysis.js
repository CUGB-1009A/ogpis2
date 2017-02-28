function SpaceAnalysisInfo(options) {
	var baseUrl = "../space/";
	this.url = baseUrl + options.target;
	this.params = options.params;
}
function getTargetOrLayoutInfo(info, fns) {
	var queryParams = info.params || {};
	var fnParam = Array.prototype.slice.call(arguments, 2);
	$.ajax({
		url : info.url,
		type : "post",
		async : false,
		data : {
			json : JSON.stringify(queryParams)
		},
		success : function(data) {
			if (fns instanceof Array)
				for (var i = 0; i < fns.length; ++i) {
					fns[i](data, fnParam[0], fnParam[1]);
				}
			else {
				fns(data, fnParam[0], fnParam[1]);
			}
		},
		error : function() {
			alert("error");
		}
	})
}