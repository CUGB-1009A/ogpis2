/**
 * Created by yuyuehua on 2017/1/3.
 */
function CreatChart(id,data) { //data={"title":"","xName":"","xAxis":[],"yName":"","yAxis":[]}
    this.id=id;
    this.title=data.title;
    this.xName=data.xName;
    this.yName=data.yName;
    this.xAxis=data.xAxis;
    this.yAxis=data.yAxis;
}
CreatChart.prototype={
    constructor:CreatChart,
    chart_bar:function () {
        var myChart = echarts.init(document.getElementById(this.id));      
        //绘制图表
        myChart.setOption({
//            title: {
//                text: this.title,
//                left:'center'
//            },
//            grid:{
//                width:w,
//                height:h
//            },
            tooltip: {},
            xAxis: {
                name:this.xName,
                splitLine:{
                    show:false
                },
                data: this.xAxis
            },
            yAxis: {
                name:this.yName,
                splitLine:{
                    show:false
                }
            },
            series: [{
                name: '销量',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#83bff6'},
                                {offset: 0.5, color: '#188df0'},
                                {offset: 1, color: '#188df0'}
                            ]
                        )
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: this.yAxis
            }]           
        });
        $(window).resize(function(){
        	myChart.resize({width:$("#"+this.id).width(),height:$("#"+this.id).height()});
        });
    },
    chart_line1:function () {
        var myChart = echarts.init(document.getElementById(this.id));
        //绘制图表
        myChart.setOption({
            title: {
                text: this.title,
                left:'center'
            },
            grid:{
                top:100,
                containLabel: true
            },
            tooltip: {},
            xAxis: {
                name:this.xName,
                splitLine:{
                    show:false
                },
                data: this.xAxis
            },
            yAxis: {
                name:this.yName,
                splitLine:{
                    show:false
                }
            },
            series: [{
                name: '销量',
                type: 'line',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#83bff6'},
                                {offset: 0.5, color: '#188df0'},
                                {offset: 1, color: '#188df0'}
                            ]
                        )
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: this.yAxis
            }]
        });
    },
    chart_line2:function () {
        var myChart = echarts.init(document.getElementById(this.id));
        //绘制图表
        myChart.setOption({
            title: {
                text: this.title,
                left:'center'
            },
            grid:{
                top:100,
                containLabel: true
            },
            tooltip: {},
            xAxis: {
                name:this.xName,
                splitLine:{
                    show:false
                },
                data: this.xAxis
            },
            yAxis: {
                name:this.yName,
                splitLine:{
                    show:false
                }
            },
            series: [{
                name: '销量',
                type: 'line',
                smooth: true,
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#83bff6'},
                                {offset: 0.5, color: '#188df0'},
                                {offset: 1, color: '#188df0'}
                            ]
                        )
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: this.yAxis
            }]
        });
    }
}