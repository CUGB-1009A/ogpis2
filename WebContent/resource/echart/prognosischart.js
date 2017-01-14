/**
 * Created by yuyuehua on 2017/1/9.
 */
// var som2={
//     "title":"预测图",
//     "xName":"盆地",
//     "yName1":"地质资源量951（亿方）",
//     "yName2":"地质资源量953（亿方）",
//     "viewdLeft":["地质资源量951","地质资源量952"],
//     "ds1":[
//         {"省（市、区、海域）":"安徽","地质资源量951":210.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"福建","地质资源量951":61.11,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"甘肃","地质资源量951":6.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"广东","地质资源量951":4.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"广西","地质资源量951":3.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"贵州","地质资源量951":2.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"海南","地质资源量951":2.00,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"河北","地质资源量951":1.65,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"河南","地质资源量951":1.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"黑龙江","地质资源量951":0.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23},
//         {"省（市、区、海域）":"黑龙江1","地质资源量951":10.23,"地质资源量952":210.23,"地质资源量953":210.23,"地质资源量954":210.23}
//     ]};

function CreatDoubleChart(id,data) {//data={"title":"","legend":[],"xName":"","xAxis":[],"yName1":"","yAxis1":[],"yName2":"","yAxis2":[]}
    this.id=id;
    this.title=data.title;//名字
    this.legend=[];
    this.xName=data.xName;//x轴的单位
    this.data=data.ds1;
    this.xAxis=[];//x轴的值
    this.yName1=data.yName1;//左侧y轴的单位
    this.yName2=data.yName2;//右侧y轴的单位
    this.series=[];
    // this.yAxis1=[];//以左侧坐标轴为准的值
    // this.yAxis2=[];//以右侧坐标轴为准的值
    this.viewdLeft=data.viewdLeft//["地质资源量951","地质资源量952"],
}
CreatDoubleChart.prototype= {
    char_line:function () {
        for(var i=0;i<this.data.length;i++){
            var a=this.data;
            var num=0;
            for(var j in a[i]){
                if(num==0){
                    this.xAxis.push(a[i][j]);
                }else{
                    var series1={
                        name: "",
                        type: 'line',
                        symbol:'none',
                        smooth: true,
                        yAxisIndex: 0,
                        data:[]
                    }
                    if (i==0){
                        this.series.push(series1);
                    }
                    this.series[num-1].name=j;
                    this.legend.push(j);
                    this.series[num-1].data.push(a[i][j]);
                    if ($.inArray(j,this.viewdLeft)==-1) this.series[num-1]['yAxisIndex']=1;
                }
                num++;
            };
        }
        var myChart = echarts.init(document.getElementById(this.id));
        //绘制图表
        myChart.setOption({
            color:[ '#ff8c31','#ffb61e',  '#70f3ff', '#44cef6','#6e7074', '#546570', '#c4ccd3'],
            tooltip: {
                trigger: 'axis'
            },
            title:{
                text:this.title,
                left:'center',
                top:'bottom'

            },
            legend: {
                data: this.legend
            },
            xAxis: [{
                type: 'category',
                boundaryGap : false,
                splitLine:{
                    show:false
                },
                name:this.xName,
                data: this.xAxis//['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            }],
            yAxis: [{
                type: 'value',
                name: this.yName1,//'水量',
                // min: 0,
                // max: 250,
                // interval: 50,
                nameLocation:'middle',
                nameGap:50,
                nameTextStyle:{
                    fontSize:14,
                    fontFamily:'Microsoft YaHei'
                },
                splitLine:{
                    show:false
                },
                axisLabel: {
                    formatter: '{value}'//'{value} ml'
                }
            },
                {
                    type: 'value',
                    name: this.yName2,//'温度',
                    nameLocation:'middle',
                    nameGap:50,
                    nameTextStyle:{
                        fontSize:14,
                        fontFamily:'microsoft yahei'
                    },
                    splitLine:{
                        show:false
                    },
                    // min: 0,
                    // max: 25,
                    // interval: 5,
                    axisLabel: {
                        formatter: '{value}'//'{value} °C'
                    }
                }
            ],
            calculate:true,
            series:this.series
            // series: [
            //     {
            //         name: this.legend[0],//'降水量',
            //         type: 'line',
            //         //symbol:'none',
            //         smooth: true,
            //         data: this.yAxis1//[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
            //     },
            //     {
            //         name: this.legend[1],//'平均温度',
            //         type: 'line',
            //         symbol:'none',
            //         smooth: true,
            //         yAxisIndex: 1,
            //         data: this.yAxis2//[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 26.4, 23.0, 16.5, 12.0, 6.2]
            //     }
            // ]
        });
    }
}