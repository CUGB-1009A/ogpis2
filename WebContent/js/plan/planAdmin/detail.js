/**
 * 
 */
	$(function(){
		var h = $('#selectWindow').height() - $('#indexSelect').height()-50;
		var type=$("#type").val();
		var planId=$("#planId").val();
		$('#selectWindow').window('close');
		
		$("#indexSelect").datagrid({
			url:'../plan/getAllIndexs',
			columns:[[
			       {field:'_check',title:'',checkbox:true,width:'4%'},
			       {field:'id',hidden:true},
			       {field:'indexName',title:'指标项名称',width:'43%',align:'center'},
			       {field:'indexType',title:'类型',width:'43%',align:'center'},
			       {field:'indexUnit',title:'单位',width:'10%',align:'center'},
			  ]],
			  rownumbers:true,
			  fitColumns : true,
			  checkbox : true,
			  pagination:true,
			  pagePosition:'bottom',
			  height:h,
			  pageSize:20,
			  queryParams:{
				  type:type
			  }
		});
		
		$("button").click(function(){
			var ids = [];
			var rows = $('#indexSelect').datagrid('getSelections');
			for(var i=0; i<rows.length; i++){
				ids.push(rows[i].id);
			}
			
			$.ajax({
				async:true,
				url:'../plan/admin/selectIndex',
				type:"post",
				dataType:'json',
				traditional:true,//阻止深度序列化，是后台接受数组的关键
				data:{
					indexIds:ids,
					planId:planId,
					type:type
				},
				success:function(result){
					alert('添加成功');
					$('#selectWindow').window('close');
				},
				error:function(){
					alert('添加失败');
				}
			})
		})
	});	
	
	
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
	