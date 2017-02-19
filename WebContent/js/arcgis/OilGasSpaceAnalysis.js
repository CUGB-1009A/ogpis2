function getTargetInfo(params,fns){
	var queryParams=params||{};
	var fnParam=Array.slice.call(arguments,2);
	$.ajax({
		url:"../space/target",
		async:false,
		data:{json:JSON.stringify(queryParams)},
		success:function(data){
			for(var i=0;i<fns.length;++i){
				fns[i](data,fnParam[0],fnParam[1]);
			}
		}
	})
}
function getLayoutInfo(mapManager){
	params={};
	$.ajax({
		url:"../space/layout",
		async:false,
		data:{json:JSON.stringify(params)},
		success:function(result){
			pointTrans(mapManager,result);
		}
	})
}