function CreatChart(id,title,unit,data){
	var myChart = echarts.init(document.getElementById(id));
	//解析data:将{["year":1949,"value":1],["year":1950,"value":2],["year":1951,"value":3]}
	//                        ||
	//         解析为{"year":[1949,1950,1951],"value":[1,2,3]}
	var historyYear="{\"year\":[";
	var historyValue="{\"value\":[";
	for(i=0;i<data.length;i++){
		historyYear = historyYear + data[i].year+",";
		historyValue = historyValue + data[i].value+",";
	}
	historyYear = historyYear.substring(0,historyYear.length-1);
	historyValue = historyValue.substring(0,historyValue.length-1);
	historyYear = historyYear + "]}";
	historyValue = historyValue + "]}";
	var x = eval("(" + historyYear + ")").year;
	var y = eval("(" + historyValue + ")").value;
	var option = {
	 title: { 
				 text: title,
				 left:'center'
			 },
	 tooltip: {
		 		 trigger: 'axis'
	 },
	 toolbox: {
       show : true,
       feature : {
           saveAsImage : {show: true},
           dataView:{show:true}
       }
   },
	 xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            name:"年份",
		            data : x
		        }
		    ],
		    yAxis : [
				        {
				            type : 'value',
				            name:unit
				        }
				    ],
	 series: [
		          {
				     type: 'line',
				     data: y
		          }
	          ]
	}
	myChart.setOption(option);

}