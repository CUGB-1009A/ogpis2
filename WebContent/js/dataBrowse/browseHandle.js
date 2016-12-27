$(function(){
	var chartOrReport="查看报表";
	$("[name='selectA00']").click(function(){
		chartOrReport=$(this).attr("value");
		if(chartOrReport=="查看报表"){
			$("#A001").css("display","none");
			$("#A000").css("display","");			
		}else{
			$("#A001").css("display","");
			$("#A000").css("display","none");
		}
	});
	var textA010="查看报表";
	$("[name='selectA010']").click(function(){
		chartOrReport=$(this).attr("value");
		if(chartOrReport=="查看报表"){
			$("#A011").css("display","none");
			$("#A010").css("display","");			
		}else{
			$("#A011").css("display","");
			$("#A010").css("display","none");
		}
	});
	var textA020="查看报表";
	$("[name='selectA020']").click(function(){
		chartOrReport=$(this).attr("value");
		if(chartOrReport=="查看报表"){
			$("#A021").css("display","none");
			$("#A020").css("display","");			
		}else{
			$("#A021").css("display","");
			$("#A020").css("display","none");
		}
	});
})
