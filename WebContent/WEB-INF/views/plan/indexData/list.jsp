<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>完成情况管理</title>
</head>
<body>
	<div>
		<div style="margin:10px 10px 10px 10px;">
			<span style="font-size:24px;font-family:微软雅黑">指标完成情况管理</span>
		</div>
		<div style="margin-left:20px; ">
			<span>指标类型：</span>
			<select id="selectType" name="planType" class="select">
				<%-- <option value='GZL' <c:if test="${type.equals('GZL') }">selected</c:if>>工作量</option>
				<option value='CL' <c:if test="${type.equals('CL') }">selected</c:if>>新增探明地质储量</option>
				<option value='CN' <c:if test="${type.equals('CN') }">selected</c:if>>新建产能</option>
				<option value='CL' <c:if test="${type.equals('CL') }">selected</c:if>>产量</option>
				<option value='TZ' <c:if test="${type.equals('TZ') }">selected</c:if>>投资</option>
				<option value='CB' <c:if test="${type.equals('CB') }">selected</c:if>>成本</option> --%>
				<option value='QG' <c:if test="${type.equals('QG') }">selected</c:if>>全国</option>
				<option value='ZSY' <c:if test="${type.equals('ZSY') }">selected</c:if>>中石油</option>
				<option value='ZSH' <c:if test="${type.equals('ZSH') }">selected</c:if>>中石化</option>
				<option value='ZHY' <c:if test="${type.equals('ZHY') }">selected</c:if>>中海油</option>
				<option value='YC' <c:if test="${type.equals('YC') }">selected</c:if>>延长石油</option>
				<option value='ZLM' <c:if test="${type.equals('ZLM') }">selected</c:if>>中联煤</option>
				<option value='QT' <c:if test="${type.equals('QT') }">selected</c:if>>其他</option>
			</select>
			&nbsp;&nbsp;
			<span>指标项名称：</span>
			<select id="selectIndex" name="selectCondition">
				<c:if test="${id.equals('0') }"><option value='0' selected>没有指标项</option></c:if>
				<c:forEach items="${indexList }" var="item" varStatus="status">
					<option value="${item.id }"<c:if test="${item.id==id }">selected</c:if>>${item.indexName }</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;
			<c:if test="${!id.equals('0') }">
				<a class="easyui-linkbutton" data-options="size:'large'" href="javascript:void(0)" onclick="$('#add').window('open')">
					<i class="fa fa-plus" style="margin-right:3px"></i>录入信息
				</a>				
				<a class="easyui-linkbutton" data-options="size:'large'" href="javascript:void(0)" onclick="$dataFetch.window('open')">
					<i class="fa fa-plus-circle" style="margin-right:3px"></i>获取数据
				</a>				
			</c:if>
		</div>
		
		<div>
			<div style="margin:10px 10px 0 10px">
				<table id="indexDataGrid" class="easyui-datagrid" title="完成情况" data-options="striped:true,singleSelect:true,rownumbers:true">
					<thead>
						<tr>
							<th field='indexYear' width='20%' align="center">年度</th>
							<th field="finished" width='40%' align="center">完成量</th>
							<th field="operate" width='40%' align="center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${indexDataList }" var="item1" varStatus="status">
							<tr class="tr_${item1.id }">
								<td>
									<fmt:formatDate value="${item1.collectedTime }" pattern="YYYY"/>
								</td>
								<%-- <td><input value="${item1.collectedTime }"></td> --%>
								<td><input id="input_${item1.id }" class="input_${item1.id }" type="text" value="${item1.finishedWorkload }" lastValue="${item1.finishedWorkload }" disabled="true"></td>
								<td>
									<p>
										<a href="javascript:saveEditIndexData('${item1.id }')" id="ok_${item1.id }" style="display:none" class="easyui-linkbutton">
											<i class="fa fa-check" style="margin-right:3px">确定</i>
										</a>&nbsp;
										<a href="javascript:cancleIndexData('${item1.id }')" id="cancle_${item1.id }" style="display:none" class="easyui-linkbutton">
											<i class="fa fa-times" style="margin-right:3px">取消</i>
										</a>&nbsp;
										<a href="javascript:editIndexData('${item1.id }')" id="edit_${item1.id }" class="easyui-linkbutton" >
											<i class="fa fa-edit" style="margin-right:3px"></i>
											编辑
										</a>&nbsp;
										<a href="javascript:deleteIndexData('${item1.id }');" id="delete_${item1.id }" class="easyui-linkbutton" >
											<i class="fa fa-remove" style="margin-right:3px"></i>
											删除
										</a>&nbsp;
									</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>		
	</div>
	
	<div id="add" class="easyui-window" title="完成情况录入" >
		<form onsubmit="return check()">
			<table>
				<tr>
					<td>年份</td>
					<td>
						<input id="collectedTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser">
					</td>
				</tr>
				<tr>
					<td>完成量</td>
					<td>
						<input class="easyui-textbox" type="text" id="finishedWorkload" data-options="prompt:'完成量'"  name="finishedWorkload">
					</td>
				</tr>
			</table>
			<div style="margin-top:10px;margin-left:90px">
				<button  class="easyui-linkbutton" type="button" onclick="addIndexData('${id}')"><i class="fa fa-plus" style="margin-right:3px"></i>录入</button>			
			</div>
		</form>
	</div>
	<div id="dataFetch" class="easyui-window" style="width: 400px;height: 410px;">
		<form onsubmit="return check()" id="dataForm">
			<table>
				<tr>
					<td>指标项名称</td>
					<td>
						<input id="indexNameFetch" class="easyui-textbox">
					</td>
				</tr>
				<tr>
					<td>数据源</td>
					<td>
						<select id="dataSource">
							<option>全国石油储量</option>
							<option>油气公司石油储量</option>
						</select>
					</td>
				</tr>
			</table>
			<div style="padding:10px;align:center;border:outset 1px grey">
		   			查询条件：<br><br> 
		   			<div style="padding:10px">
		   			 	资源类型：
					    <select id="mineType">
							<option value="1">石油</option>
							<option value="2">天然气</option>
							<option value="3">煤层气</option>
							<option value="4">页岩气</option>
						</select><br><br>
						储量类型：
					    <select id="mineType">
							<option value="1">新增探明地质储量</option>
							<option value="2">累计储量</option>
							<option value="3">经济可采储量</option>
						</select><br><br>
						实体类型：
					    <select id="entityType">
							<option value="1">全国</option>
							<option value="2">公司</option>
							<option value="3">盆地</option>
						</select><br><br>
						时间选择：
					    <select id="beginYear">
							<option value="1949">1949</option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
						</select>--
						 <select id="endYear">
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
						</select>
		   			</div>
				</div>
		</form>
		<div style="width: 385px;height: 300px;" id="echartsPreview">
			
		</div>
		<div style="margin-left:33%;margin-top: 20px;">
			<button id="previewBtn"  class="easyui-linkbutton" type="button" onclick="previewData()"><i class="fa fa-bar-chart-o" style="margin-right:3px"></i>预览</button>
			<button id="backBtn"  class="easyui-linkbutton" type="button" onclick="backData()"><i class="fa fa-arrow-left" style="margin-right:3px"></i>返回</button>
			&nbsp;&nbsp;			
			<button  class="easyui-linkbutton" type="button" onclick="addIndexData('${id}')"><i class="fa fa-plus" style="margin-right:3px"></i>添加</button>			
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#add').window('close');
			$('#dataFetch').window('close');			
		});
		
		selectTypeValue=$('#selectType option:selected').text();
		selectIndexValue=$('#selectIndex option:selected').text();
		var $dataFetch=$('#dataFetch').window({
			 title:"完成情况获取" ,
			 shadow: true,
			 modal: true,
			 onOpen:function(){
				 $('#indexNameFetch').val(selectTypeValue + selectIndexValue);
				 $('#echartsPreview').hide();
				 $('#backBtn').hide();
			 }

		})	
		
		var historyData = {"historyData": [{"year": 1949,"value": 12},{"year": 1950,"value": 20},{"year": 1951,"value": 31},{"year": 1952,"value": 44},{"year": 1953,"value": 62},{"year": 1954,"value": 79},{"year": 1955,"value": 97},{"year": 1956,"value": 116},{"year": 1957,"value": 146},{ "year": 1958,"value": 227},{"year": 1959,"value": 373},{"year": 1960,"value": 521},{"year": 1961,"value": 531},{"year": 1962,"value":575},{"year": 1963,"value": 648},{"year": 1964,"value": 848},{"year": 1965,"value": 1131},{"year": 1966,"value": 1454},{"year": 1967,"value": 1388},{"year": 1968,"value": 1599 },{"year": 1969,"value": 2175},{"year": 1970,"value": 3065},{"year": 1971,"value": 3941},{"year": 1972,"value": 4567},{"year": 1973,"value": 5361},{"year": 1974,"value": 6485},{"year": 1975,"value": 7706},{"year": 1976,"value": 8716},{"year": 1977,"value": 9364},{"year": 1978,"value": 10405},{"year": 1979,"value": 10615},{"year": 1980,"value": 10594},{"year": 1981,"value": 10122},{"year": 1982,"value": 10221},{"year": 1983,"value": 10607},{"year": 1984,"value": 11460},{"year": 1985,"value": 12489},{"year": 1986,"value": 13067},{"year": 1987,"value": 13413},{"year": 1988,"value": 13703},{"year": 1989,"value": 13765},{"year": 1990,"value": 13828},{"year": 1991,"value": 13979},{"year": 1992,"value": 14204},{"year": 1993,"value": 14400},{"year": 1994,"value": 14607},{"year": 1995,"value": 14905},{"year": 1996,"value": 15729},{"year": 1997,"value": 16044},{"year": 1998,"value": 16052},{"year": 1999,"value": 16000},{"year": 2000,"value": 16200},{"year": 2001,"value": 16500},{"year": 2002,"value": 16700},{"year": 2003,"value": 17010},{"year": 2004,"value": 17500},{"year": 2005,"value": 18150},{"year": 2006,"value": 18376},{"year": 2007,"value": 18666},{"year": 2008,"value": 18946},{"year": 2009,"value": 18821},{"year": 2010,"value": 19276},{"year": 2011,"value": 19250},{"year": 2012,"value": 20683},{"year": 2013,"value": 20902},{"year": 2014,"value": 21141}]};
		var historyDataString;
		var historyDataJson;
		var x;
		var y;
		historyDataString = JSON.stringify(historyData);
		historyDataJson = historyData.historyData ;	
		var historyYear="{\"year\":[";
		var historyValue="{\"value\":[";
		for(i=0;i<historyDataJson.length;i++){
			historyYear = historyYear + historyDataJson[i].year+",";
			historyValue = historyValue + historyDataJson[i].value+",";
		}
		historyYear = historyYear.substring(0,historyYear.length-1);
		historyValue = historyValue.substring(0,historyValue.length-1);
		historyYear = historyYear + "]}";
		historyValue = historyValue + "]}";
		x = eval("(" + historyYear + ")").year;
		y = eval("(" + historyValue + ")").value;
		
		 var option = {
	        		 title: { 
	        					 text: '石油新增探明地质储量',
	        					 left:'center'
	        				 },
	        		 tooltip: {
	        			 		 trigger: 'axis'
	        		 },
	        		 toolbox:{
	        			 show : true,
		      		   		feature : {
		      		       		saveAsImage : {show: true}
	        		 		}
	        		 },
	        		 dataZoom:{
	        			 show:true
	        		 },
	        		 xAxis : [
	        			        {
	        			            type : 'category',
	        			            boundaryGap : false,
	        			            name:"年份",
	        			            data : []
	        			        }
	        			    ],
	        			    yAxis : [
	        					        {
	        					            type : 'value',
	        					            name:'万吨'
	        					        }
	        					    ],
	        		 series: [
	        			          {
	        					     type: 'line',
	        					     data: []
	        			          }
	        		          ]
	        		}
		
		
		function previewData(){
			$('#dataForm').hide();
			$('#previewBtn').hide();
			$('#echartsPreview').show();
			$('#backBtn').show();
			var myChart = echarts.init(document.getElementById("echartsPreview"));
		 	option.xAxis[0].data = x;
			option.series[0].data = y;	
			myChart.setOption(option);
		}
		function backData(){
			$('#dataForm').show();
			$('#previewBtn').show();
			$('#echartsPreview').hide();
			$('#backBtn').hide();
		}
		
		//自定义日期格式
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		//解析时间格式
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
		
		
		$('#selectIndex').change(function(){
			var id=$('#selectIndex').val();
			window.location.href="<%=path%>/indexData/list?type=${type}&&id="+id;
		});
		$('#selectType').change(function(){
			var type=$('#selectType').val();
			window.location.href="<%=path%>/indexData/list?id=0&&type="+type;
		});
		
		//编辑按钮
		function editIndexData(id){
			$('.input_'+id).attr("disabled",false);
			$('.input_'+id).focus();
			document.getElementById('ok_'+id).style.display="";
			document.getElementById('cancle_'+id).style.display="";
			document.getElementById('edit_'+id).style.display="none";
			document.getElementById('delete_'+id).style.display="none";
		}
		//取消按钮
		function cancleIndexData(id){
			var lastValue=$('.input_'+id).attr("lastValue");
			$('#input_'+id).val(lastValue);
			document.getElementById('ok_'+id).style.display="none";
			document.getElementById('cancle_'+id).style.display="none";
			document.getElementById('edit_'+id).style.display="";
			document.getElementById('delete_'+id).style.display="";
			$('.input_'+id).attr("disabled",true);
		}
		//确定编辑按钮
		function saveEditIndexData(id){
			var value=$('#input_'+id).val();
			$.ajax({
				url:"<%=path%>/indexData/save",
				type:"get",
				async:true,
				data:{"id":id,"value":value},
				dataType:"json",
				contentType:"application/json",
				success:function(){
					$('.input_'+id).attr("lastValue",value);
					document.getElementById('ok_'+id).style.display="none";
					document.getElementById('cancle_'+id).style.display="none";
					document.getElementById('edit_'+id).style.display="";
					document.getElementById('delete_'+id).style.display="";
					$('.input_'+id).attr("disabled",true);
					alert('修改成功');
				},
				error:function(){
					alert('修改失败');
				}
			});
		}
		//删除按钮
		function deleteIndexData(id){
			var type=$('#selectType').val();
			var index=$('#selectIndex').val();
			var isDel=confirm("确定删除该条记录？","确认对话框");
			if(isDel){
				$.ajax({
					url:"<%=path%>/indexData/delete",
					type:"get",
					async:true,
					data:{"id":id},
					dataType:"json",
					contentType:"application/json",
					success:function(){
						window.location.href="<%=path%>/indexData/list?id="+index+"&&type="+type;
						alert('删除成功');
					},
					error:function(){
						alert('删除失败');
					}
				});
			}
		}
		
		//为id=id的指标添加完成情况
		function addIndexData(id){
			var collectedTime=$("#collectedTime").datebox('getValue');
			var finishedWorkload=$("#finishedWorkload").val();
			if(finishedWorkload==''||collectedTime==''){
				alert('请填写完整信息再提交');
				return false;
			}
			$.ajax({
				url:"<%=path%>/indexData/addIndexData",
				type:"get",
				async:true,
				data:{
					"id":id,
					"collectedTime":collectedTime,
					"finishedWorkload":finishedWorkload
				},
				contentType:"application/json",
				success:function(result){
					if(result.result=='success')
						window.location.href="<%=path%>/indexData/list?id=${id}&&type=${type}";
						else
							alert('该年份的记录已经存在，不能再次添加');
				},error:function(){
					alert('添加失败');
				}
			});
		}
	</script>
</body>
</html>