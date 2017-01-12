<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div title="规划目标">
		<div style="margin-top:50px">
			<!-- <h3 style="margin-left:25px">历史石油产量及规划目标</h3> -->
			<div style="width:50%;height:300px;float:left">
				<div class="charts2" style="width:450px;height:300px;"align="center">
					
				</div>
			</div>
			<div style="width:50%;height:300px;float:right">
				<div class="charts2" style="width:450px;height:300px;"align="center">
					
				</div>
			</div>
			<div style="width:50%;height:300px;float:left">
				<div class="charts2" style="width:450px;height:300px;"align="center">
					
				</div>
			</div>
			<div style="width:50%;height:300px;float:right">
				<div class="charts2" style="width:450px;height:300px;"align="center">
					
				</div>
			</div>
			<div style="width:50%;height:300px;float:left">
				<div class="charts2" style="width:450px;height:300px;"align="center">
					
				</div>
			</div>
			<div style="width:50%;height:300px;float:right">
				<div class="charts2" style="width:450px;height:300px;"align="center">
					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
				var option = {
			            title: {
			                text: '历史石油产量及规划目标',
			                x:'center'
			            },
			            tooltip: {
			            	triggrt:'axis'
			            },
			            xAxis: {
			            	name:'年份',
			            	type:'category',
							show:true,
			                data: [2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,'目标值']
			            },
			            yAxis: {
			            	name:'亿吨',
			            	type:'value'
			            },
			            series: [
			               {
			                name: '石油产量',
			                type: 'bar',
			                data: [1.63, 1.69, 1.7, 1.75, 1.82, 1.84, 1.87, 1.91, 1.88, 2.01, 2.03],
			                itemStyle:{
			                	normal:{
			                		color:function(params){
			                			if(params.dataIndex>=10){
			                				return '#FF0000';	                				
			                			}
			                			else
			                				return '#00FF00';
			                		}
			                	}
			                }
			            }			         
			            ],
			            label:{ 
			            	normal:{ 
				            	show: true, 
				            	position: 'outside'
				            	} 
			            	},			            				           
			        };
				var x = document.getElementsByClassName("charts2");
				var i;
				for (i = 0; i < x.length; i++) {
					myCharts=echarts.init(x[i]);
					myCharts.setOption(option);
				}
		
	</script>