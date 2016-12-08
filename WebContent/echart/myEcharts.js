function CreatChart(id,data){
	this.id=id;//
	
	this.title=data.title;
	this.xAxis=data.xAxis;
	this.yAxisName=data.yAxisName;
	this.series=data.series;
	//基于准备好的dom，初始化echarts实例
	this.creatChart=function(){
		var myChart = echarts.init(document.getElementById('main'));
		//绘制图表
		myChart.setOption({
		 title: { text: 'ECharts 入门示例' },
		 tooltip: {},
		 xAxis: {
		     data:this.xAxis //["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
		 },
		 yAxis: {
			 
		 },
		 series: [{
		     name: '销量',
		     type: 'bar',
		     data: this.series//[5, 20, 36, 10, 10, 20]
		 }]
		});
	}
}