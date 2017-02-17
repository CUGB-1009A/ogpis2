/**
 * Created by yuyuehua on 2017/2/15.
 */
function Gauge(id,data) {        //id表示放置echart的div的ID,data={"max":100,"value":70,"name":"例子(万吨)"}
    this.id=id;
    this.data=data;
}
Gauge.prototype={
    constructor:Gauge,
    gauge:function () {
        var myChart = echarts.init(document.getElementById(this.id));
        option = {
            tooltip : {
                formatter: "{a} <br/>{b} : {c}%"
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            series : [
                {
                    name:'业务指标',
                    type:'gauge',
                    startAngle: 180,
                    endAngle: 0,
                    center : ['50%', '90%'],    // 默认全局居中
                    radius : '100%',
                    axisLine: {            // 坐标轴线
                        lineStyle: {       // 属性lineStyle控制线条样式
                            width: 200,
                            color: [[0.2, 'lightgreen'],[0.8, 'skyblue'],[1, '#ff4500']],
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        splitNumber: 10,   // 每份split细分多少段
                        length :10,        // 属性length控制线长
                    },
                    axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                        // formatter: function(v){
                        //     switch (v+''){
                        //         case '100': return '低';
                        //         case '500': return '中';
                        //         case '900': return '高';
                        //         default: return '';
                        //     }
                        // },
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#fff',
                            fontSize: 15,
                            fontWeight: 'bolder'
                        }
                    },
                    pointer: {
                        width:30,
                        length: '85%',
                    },
                    itemStyle:{
                        normal:{
                            color: 'rgba(255, 255, 255, 0.4)'
                        }
                    },
                    title : {
                        show : true,
                        offsetCenter: [0, '-60%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#fff',
                            fontSize: 25
                        }
                    },
                    detail : {
                        show : true,
                        backgroundColor: 'rgba(0,0,0,0)',
                        borderWidth: 0,
                        borderColor: '#ccc',
                        width: 100,
                        height: 40,
                        offsetCenter: [0, -40],       // x, y，单位px
                        formatter: '{value}%',
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontSize : 40
                        }
                    },
                    data:[{value: 50, name: '完成率'}]
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        option.series[0].data[0].value = this.data.value//(Math.random()*100).toFixed(2) - 0;
        option.series[0].data[0].name=this.data.name;
        option.series[0].max=this.data.max;
        option.series[0].detail.formatter=this.data.value;
        
        option.series[0].axisLine.lineStyle.width=100;
        myChart.setOption(option,true);

    }
}