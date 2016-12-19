function CreatChart(id,data){//id表示创建echart图表的div的id,data={"title":"","xAxisName":"","yAxisName":"","series":{"A0005": [{"盆地名称":"渤海湾盆地","待探明地质资源量95":"141.72","待探明可采资源量95":"33.36","地质资源量":"369.21","可采资源量95":"89.26"},{"盆地名称":"海拉尔盆地","待探明地质资源量95":"21.72","待探明可采资源量95":"313.36","地质资源量":"369.21","可采资源量95":"419.26"},{"盆地名称":"松辽盆地","待探明地质资源量95":"71.72","待探明可采资源量95":"92.36","地质资源量":"369.21","可采资源量95":"894.26"}]} }
	this.id=id;
	this.data=data.series;
	this.chartTitle=data.title;
	this.xAxisName=data.xAxisName;
	this.yAxisName=data.yAxisName;
	this.xAxisData=[];
	this.series=[];
	this.legend=[];
	//基于准备好的dom，初始化echarts实例
	this.creatChart=function(){
		var seriesNum=0;
		var seriesData=null;
		console.log(this.data);
		for(var dataID in this.data){
    		for(var i=0;i<this.data[dataID].length;i++){
    			var num=0;
    			for(var j in this.data[dataID][i]){
    				if(num==0){
    					this.xAxisData.push(this.data[dataID][i][j]);
    				}else if(i==0){
    					this.series.push({});
    					this.series[seriesNum].name=j;
    					this.legend.push(j);
    					this.series[seriesNum].type='bar';
    					//this.series[seriesNum].smooth=true,
    					this.series[seriesNum].data=[];
    					this.series[seriesNum].data.push(this.data[dataID][i][j]);
    					seriesNum++;
    				}else{
    					seriesData=this.data[dataID][i][j];
						this.series[num-1].data.push(seriesData);
    				}
    				num++;
    			}
    		} 
    	}
    	console.log(this.xAxisData);
    	console.log(this.series);
    	function chart(id,legend,xAxisData,series){
    		var myChart = echarts.init(document.getElementById(id));
    		//绘制图表		        	
    		myChart.setOption({
    		 title: { 
    			 text: "2006年东部各盆地石油资源量" ,
    			 left:'center'
    				 },
    		 legend:{
    			 orient:'vertical',
    			 top:40,
    			 right:10,
    			 //data: legend
    			 data:["待探明地质资源量95","待探明可采资源量95","地质资源量95","可采资源量95"]
    		 },
    		 tooltip: {},
    		 grid:{
    			 top:"20%",
    			 right:180
    		 },
    		 xAxis: {
    			 //name:xAxisName,
    		     //data:xAxisData //["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
    			 data:["渤海湾盆地","海拉尔盆地","松辽盆地"]
    		 },
    		 yAxis: {
    			 //name:yAxisName
    			 name:"万吨"
    		 },
    		 //series: series
    		 series:[{
    			 type:'bar',
    			 name:"待探明地质资源量95",
    			 data:[141.72,141.72,141.72]
    		 },
    		 {
    			 type:'bar',
    			 name:"待探明可采资源量95",
    			 data:[33.36,33.36,33.36,33.36,33.36]
    		 },
    		 {
    			 type:'bar',
    			 name:"地质资源量95",
    			 data:[33.36,33.36,0,0,0]
    		 },
    		 {
    			 type:'bar',
    			 name:"可采资源量95",
    			 data:[89.26,89.26,89.26,89.26,89.26]
    		 }]
    		});
    	}
    	chart(this.id,this.legend,this.xAxisData,this.series);
	}
//	var chart=function(series){
//		var series=seires;
//		console.log(series);
//		var myChart = echarts.init(document.getElementById(id));
//		//绘制图表		        	
//		myChart.setOption({
//		 title: { text: chartTitle },
//		 tooltip: {},
//		 xAxis: {
//			 //name:xAxisName,
//		     data:xAxisData //["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
//		 },
//		 yAxis: {
//			 //name:yAxisName
//		 },
//		 series: series
//		});
//	}
}