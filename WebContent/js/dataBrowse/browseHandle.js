var BrowseHandle={
		searchJson:{},
		year:"",
		resourceType:"",
		area:"",
		resourceQuantity:"",
		init:function(){			
			var som={
		            "xName":"盆地",
		            "yName":"忆方",
		            "ds1":[
		            {"省（市、区、海域）":"安徽","地质资源量":210.23},
		            {"省（市、区、海域）":"福建","地质资源量":61.11},
		            {"省（市、区、海域）":"甘肃","地质资源量":6.23},
		            {"省（市、区、海域）":"广东","地质资源量":4.23},
		            {"省（市、区、海域）":"广西","地质资源量":3.23},
		            {"省（市、区、海域）":"贵州","地质资源量":2.23},
		            {"省（市、区、海域）":"海南","地质资源量":2.00},
		            {"省（市、区、海域）":"河北","地质资源量":1.65},
		            {"省（市、区、海域）":"河南","地质资源量":1.23},
		            {"省（市、区、海域）":"黑龙江","地质资源量":0.23},
		            {"省（市、区、海域）":"山西","地质资源量":10.23}
		        ]};
			var report=new Data_mould("2006年全国地质资源量",som);
			var chartdata= report.chart_data();
			var chart=new CreatChart('dataBrowseChartDiv',chartdata);
			chart.chart_bar();
			//BrowseHandle.refreshReportAndChart("2016年全国地质资源量",som);
			$('#browsett').tabs({    
			    //border:false,    
			    onSelect:function(title){    
			            
			    }    
			});
			$("#search").click(function(){
				BrowseHandle.select();
				var som={
			            "xName":"盆地",
			            "yName":"忆方",
			            "ds1":[
			            {"省（市、区、海域）":"安徽","地质资源量":210.23},
			            {"省（市、区、海域）":"福建","地质资源量":61.11},
			            {"省（市、区、海域）":"甘肃","地质资源量":6.23},
			            {"省（市、区、海域）":"广东","地质资源量":4.23},
			            {"省（市、区、海域）":"广西","地质资源量":3.23},
			            {"省（市、区、海域）":"贵州","地质资源量":2.23},
			            {"省（市、区、海域）":"海南","地质资源量":2.00},
			            {"省（市、区、海域）":"河北","地质资源量":1.65},
			            {"省（市、区、海域）":"河南","地质资源量":1.23},
			            {"省（市、区、海域）":"黑龙江","地质资源量":0.23},
			            {"省（市、区、海域）":"山西","地质资源量":10.23},
			            {"省（市、区、海域）":"河南","地质资源量":10.23},
			            {"省（市、区、海域）":"贵州","地质资源量":2.23},
			            {"省（市、区、海域）":"海南","地质资源量":2.00},
			            {"省（市、区、海域）":"河北","地质资源量":1.65},
			            {"省（市、区、海域）":"河南","地质资源量":1.23},
			            {"省（市、区、海域）":"黑龙江","地质资源量":0.23},
			            {"省（市、区、海域）":"山西","地质资源量":10.23},
			            {"省（市、区、海域）":"河南","地质资源量":10.23}
			        ]};
				BrowseHandle.refreshReportAndChart("2006年全国地质资源量",som);
			});
			
		},
		select:function(){
			var select=$("select");
			var selectID="";
			for(var i=0;i<select.length;i++){
				selectID=$(select[i]).attr('id');
				BrowseHandle.searchJson[selectID] = $("#"+selectID).find("option:selected").text();
			}
			console.log(BrowseHandle.searchJson);
		},
		refreshReportAndChart:function(title,data){
			$("#browseTitle").html(title);
			var report=new Data_mould(title,data);
			var xmlstr=report.report_xmlstr();
			var report_data=report.report_data();
			var chartdata= report.chart_data();
			var chart=new CreatChart('dataBrowseChartDiv',chartdata);
			dataBrowseReport.func('Build',xmlstr);
			dataBrowseReport.func('SetSource','ds1\r\n'+JSON.stringify(report_data));
			dataBrowseReport.func('Fill','');
			chart.chart_bar();
		}
}