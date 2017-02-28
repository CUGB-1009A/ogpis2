	

	
	function divclick(){
		alert('click');
	}
	
	$(function(){
		for(var i=0;i<$('.charts').length;i++){
			$(".charts")[i].addEventListener('dblclick',showDetail,false);
		}
		for(var j=0;j<$('.mainCharts').length;j++){
			$(".mainCharts")[j].addEventListener('dblclick',showDetail,false);
		}	
		document.getElementById('test').addEventListener('click',divclick,true);
    })
	
	//完成主图
	var option = {
		 title: {
            text: '规划完成情况',
            x: 'center',            
            y: 'top'
        },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	     grid: {
	        x: '150px',
	        x2:'40px'
	    }, 
	    xAxis:  {
	        type: 'value',
	        axisLabel: {
	       	 show: true,
	       	 interval: 'auto',
	       	 formatter: '{value} %'
	       	 }
	    },
	    yAxis: {
	        type: 'category',
	        data: [],
	        show:true
	    },
	    series: []
	};
	
	var option1 = {
	        title: {
	            text: '',
	            x: 'center',            
	            y: 'top'
	        },
	        legend: {
	        	show:false,
	            data:['已经完成的情况'],
	            x:'right',
	            y:'top'
	        },
	        xAxis: {
	            data: [],
	        	name:'年份'
	        },
	        yAxis: {
	        	name:''     	
	        },
	        series: [
		                 {
			        		itemStyle: 
			        		{
			        			normal: 
			        			{
			        				label : 
			        				{
			        					show:true
			        				}
			        	        }
		                 },
			
			            name: '已经完成的情况',
			            type: 'bar',
			            data: []
	        			  }
		           ]
	    };
	 var optionTest = {
             tooltip: {
                 show: true
             },
             legend: {
                 data:['销量']
             },
             xAxis : [
                 {
                     type : 'category',
                     data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                 }
             ],
             yAxis : [
                 {
                     type : 'value'
                 }
             ],
             series : [
                 {
                     "name":"销量",
                     "type":"bar",
                     "data":[5, 20, 40, 10, 10, 20]
                 }
             ]
         };
 

	
	require.config({
		paths:{
			echarts:'../resource/dist'
		}
	});
	
	//使用
	require(
		[
			'echarts',
			'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
		],
		function(ec){
			var $chartsDiv=$(".charts");//所有的主图
			var $inputsmain=$(".inputsmain");
			var $inputsindex=$(".inputsindex");
			var myCharts;
			
			var mycharts123=ec.init(document.getElementById('test'));
			mycharts123.setOption(optionTest);
			
			for (var i=0;i<$chartsDiv.length;i++)
			{	
	    		var $mainCharts = $(".mainCharts_"+i);/* 一个规划的附图 */ 		
				myCharts = ec.init($chartsDiv[i]);		
				var datamain = $inputsmain[i].value;
				var objmain = eval("(" + datamain + ")"); 
				var dataindex = $inputsindex[i].value; 
				var objindex = eval("(" + dataindex + ")"); 								
	            var tempYdata = "{\"yData\":[";
	        	var tempSeries = "{\"series\":["
					for(var j=0;j<objmain.length;j++)
						{
							tempYdata = tempYdata + "'"+objmain[j].indexName+"',";
						}
		        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";	        		
						tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:true, textStyle: {color: '#800080'},formatter:'{c} %'}}},type:'bar',stack:'总量',name:'规划完成情况',data:[";
					for(var l=0;l<objmain.length;l++)
						{
						tempSeries = tempSeries + (objmain[l].hasFinished/objmain[l].indexValue*100).toFixed(1)+","
						}
				tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
				tempSeries = tempSeries +"]}";
				var obj2 = eval("(" + tempYdata + ")");
				var obj3 = eval("(" + tempSeries + ")");
				option.yAxis.data = obj2.yData;
				option.series = obj3.series;
			 	myCharts.setOption(option);
			 	
				for(var ii=0;ii<$mainCharts.length;ii++)
				   {	   
					   myCharts = ec.init($mainCharts[ii]);
					   option1.yAxis.name = objindex[ii].indexUnit;
					   option1.title.text = objindex[ii].indexName;
					   option1.xAxis.data = objindex[ii].year;
					   option1.series[0].data = objindex[ii].value;
					   myCharts.setOption(option1);
					
				   } 			
				} 
		}
	);
	
	