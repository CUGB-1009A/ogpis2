package com.ogpis.data.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.MultiDataSourceMetric;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.DataSourceService;
import com.ogpis.data.service.DimensionService;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.data.service.SubjectService;

@Controller
public class DataSourceAction extends BaseAction {

	@Autowired
	private SubjectService subjectService;
	@Autowired
	private DataSourceService dataSourceService;
	@Autowired
	private DimensionService dimensionService;
	@Autowired
	private InterfaceTableService interfaceTableService;

	@RequestMapping(value = "/dataSource/list")
	public String list(HttpServletRequest request, ModelMap model) {
		model.put("subjects", subjectService.findAll());
		model.put("dimensions1", dimensionService.getDimensionMetric());
		model.put("dimensions2", dimensionService.getDimensionNotMetric());
		return "data/dataSource";
	}

	@RequestMapping(value = "/dataSource/getTableAndRealDS")
	public void getTableAndRealDS(String subjectId, HttpServletResponse response) {
		String[] filters=new String[]{"modifiedTime","createTime","dataCache","dataSourceFields"};
		List<InterfaceTable> tableList = subjectService.findById(subjectId).getInterfaceTables();
		JSONArray tableArray = JSONArray.fromObject(tableList, getJsonConfig(filters));
		List<DataSource> dataSourceList = dataSourceService.findRealDSBySujectId(subjectId);
		JSONArray dsArray = JSONArray.fromObject(dataSourceList, getJsonConfig(filters));
		JSONObject obj=new JSONObject();
		obj.put("tableList", tableArray);
		obj.put("realDSList", dsArray);
		responseJson(response, obj.toString());
	}

	@RequestMapping(value = "/data/dataMaintain")
	public String dataMaintain(HttpServletRequest request, ModelMap model) {

		return "data/dataMaintain";
	}

	@RequestMapping(value = "/dataSourceList")
	@ResponseBody
	public void dataSourceList(@RequestParam("page") Integer pageNumber,
			@RequestParam("rows") Integer pageSize, HttpServletResponse response)
			throws IOException {
		Pagination pagination = dataSourceService.getAllDataSource(
				SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		String[] filter=new String[]{"parentDataSource","children","dataSourceMetric","table","dataCache","dataSourceFields"};
		System.out.println(this.toJsonTableData(pagination, filter, true));
		response.getWriter()
				.write(this.toJsonTableData(pagination, filter, true));
	}

	@RequestMapping(value = "/dataSource/getAllDataSource")
	// 获取数据源（有子数据源的显示父数据源）
	@ResponseBody
	public void getAllDataSource(HttpServletResponse response)
			throws IOException {
		StringBuilder result = new StringBuilder();
		result.append("[");
		List<DataSource> dataSources = dataSourceService.findAll();
		System.out.println(dataSources.size());
		for (DataSource temp : dataSources) {
			result.append("{\"id\":\"" + temp.getId() + "\",\"name\":\""
					+ temp.getName() + "\"},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(result.toString());
	}

	@RequestMapping(value = "/dataSource/getAllSubject")
	// 获取数据源（有子数据源的显示父数据源）
	@ResponseBody
	public void getAllSubject(HttpServletResponse response) throws IOException {
		List<Subject> list = subjectService.findAll();
		JsonConfig jsonConfig = getJsonConfig(new String[] { "dataSource",
				"forecastType", "interfaceTables" });
		responseJson(response, JSONArray.fromObject(list, jsonConfig)
				.toString());
	}

	@RequestMapping(value = "/dataSource/getDimension")
	// 获取数据源（有子数据源的显示父数据源
	@ResponseBody
	public void getDimension(HttpServletResponse response) throws IOException {
		List<Dimension> list=dimensionService.getAllDimension();
		JSONArray array=JSONArray.fromObject(list);
		responseJson(response, array.toString());
	}
	
	@RequestMapping(value = "/dataSource/addDataSource")
	public void addDataSource(String json,HttpServletResponse response) {
		/*String result=dataSourceService.addDataSource(dataSource);*/
		String result;
		try{
			result=dataSourceService.addDataSource(json);
		}catch(Exception e){
			result=e.getMessage();
		}
		responseText(response, result);
	}
	
	@RequestMapping(value = "/dataSource/getColumns")
	public void getColumns(String json,HttpServletResponse response) {
		List<TableColumns> tableColumns=null;
		JSONObject param=JSONObject.fromObject(json).getJSONObject("DataSource");
		if(param.getString("dataType").equals("table")){
			String tableId=param.getJSONObject("table").getString("id");
			tableColumns=interfaceTableService.getColumnsById(tableId);
		}else if(param.getString("dataType").equals("datasource")){
			JSONArray dataSources=param.getJSONArray("children");
			StringBuilder dataSourceIds=new StringBuilder();
			dataSourceIds.append("(");
			for(int i=0;i<dataSources.size();++i){
				dataSourceIds.append("'"+dataSources.getJSONObject(i).getString("id")+"'");
				if(i<dataSources.size()-1)
					dataSourceIds.append(",");
			}
			dataSourceIds.append(")");
			List<DataSource> dataSourceList=dataSourceService.findByIds(dataSourceIds.toString());
			StringBuilder tableIds=new StringBuilder();
			tableIds.append("(");
			for(int i=0;i<dataSourceList.size();++i){
				tableIds.append("'"+dataSourceList.get(i).getTable().getId()+"'");
				if(i<dataSourceList.size()-1)
					tableIds.append(",");
			}
			tableIds.append(")");
			tableColumns=interfaceTableService.getColumnsByIds(tableIds.toString());
		}else{
			
		}
		String[] filter=new String[]{"remark","deleted","modifiedTime","createTime","table","dataSourceMetrics","multiDataSourceMetrics","dataSourceFields"};
		JSONArray array=JSONArray.fromObject(tableColumns,getJsonConfig(filter));
		System.out.println(array.toString());
		responseJson(response, array.toString());
//		List<DataSource> children=dataSource.getChildren();
//		if(children!=null){
//			StringBuilder interfaceIds=new StringBuilder();
//			interfaceIds.append("(");
//			for(int i=0;i<children.size();++i){
//				interfaceIds.append("'"+children.get(i).getId()+"'");
//				if(i<children.size()-1)
//					interfaceIds.append(",");
//			}
//			interfaceIds.append(")");
//			System.out.println(interfaceIds.toString());
//			tableColumns=interfaceTableService.getColumnsByIds(interfaceIds.toString());
//		}
//		InterfaceTable table=dataSource.getTable();
//		if(table!=null){
//			String interfaceId=table.getId();
//			tableColumns=interfaceTableService.getColumnsById(interfaceId);
//		}
		
	}
	
	@RequestMapping(value = "dataBrowser/getTabContentByDSId123")
	public void getTabContentByDSId(HttpServletRequest request, HttpServletResponse response ,ModelMap model) throws IOException {
		StringBuilder result = new StringBuilder();
		boolean isVirtual = false ; //默认是真实数据源
		String id= request.getParameter("id");
		DataSource dataSource = dataSourceService.findById(id);
		if(dataSource.getTable()==null){//没有表对应的是虚拟数据源
			isVirtual = true ;
		}
		DataSource dataSourceInUse ;
		//先添加数据源列表 dataSource
		result.append("{\"dataSource\":{");
		if(isVirtual){//虚拟数据源处理
			
			List<DataSource> childDataSources = dataSource.getChildren();
			result.append("\"isVirtual\":"+isVirtual+",\"dimensionName\":\""+dataSource.getDimensionName()+"\",");
			result.append("\"tableEN_name\":\""+dataSource.getChildren().get(0).getTable().getName_EN()+"\",\"dataSources\":[");
			for(DataSource temp : childDataSources){
				result.append("{\"id\":\""+temp.getId()+"\",\"dimensionValue\":\""+temp.getDimensionValue()+"\"},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]},");
			dataSourceInUse = childDataSources.get(0);
		}
		else{//真实数据源处理
			result.append("\"isVirtual\":"+isVirtual+",");
			result.append("\"tableEN_name\":\""+dataSource.getTable().getName_EN()+"\"},");
			dataSourceInUse = dataSource ;
		}
		//再添加度量值（可能是单个，可能是多个组合）
		DataSourceMetric dataSourceMetric = dataSourceInUse.getDataSourceMetric();
		result.append("\"y\":\"{\"isMulti\":"+dataSourceMetric.isMulti()+",");
		if(dataSourceMetric.isMulti()){//度量值为多个
			List<MultiDataSourceMetric> multiDataSourceMetrics =  dataSourceMetric.getMultiDataSourceMetrics();
			result.append("\"CN_name\":\""+dataSourceMetric.getDimension().getName()+"\",\"value\":[");
			for(MultiDataSourceMetric temp : multiDataSourceMetrics){
				result.append("{\"key\":\""+temp.getTableColumns().getCode()+"\",\"value\":\""+temp.getDimensionValue().getDisplayValue()+"\"},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]},");
		}
		else{//度量值为单个
			result.append("EN_name\":\""+dataSourceMetric.getTableColumns().getCode()+"\"},");
		}
		List<DataSourceField> dataSourceFields = dataSourceInUse.getDataSourceFields();
		DataSourceField dataSourceFieldX = null ;
		//再添加维度值（其中有x轴的值）
		result.append("\"condition\":[");
		for(DataSourceField temp : dataSourceFields){
			if(temp.isX())
				dataSourceFieldX = temp ;
			else{
					result.append("{\"isYear\":"+temp.getDimension().isYear()+",\"CN_name\":\""+temp.getDimension().getName()+"\",\"EN_name\":\""+temp.getTableColumn().getCode()+"\",");
					if(temp.getDimension().isYear()){
						result.deleteCharAt(result.length()-1);
						result.append("},");
					}
					else{
						result.append("\"value\":[");
						for(DimensionValue temp1:temp.getDimension().getDimensionValues()){
							result.append("{\"key\":\""+temp1.getValue()+"\",\"value\":\"value\":\""+temp1.getDisplayValue()+"\"},");
						}
						result.deleteCharAt(result.length()-1);
						result.append("]");
					}
					
			}
			result.deleteCharAt(result.length()-1);
			result.append("],");
		}
		
		//再添加X轴的内容
		result.append("\"x\":{\"isYear\":"+dataSourceFieldX.getDimension().isYear()+",\"EN_name\":\""+dataSourceFieldX.getTableColumn().getCode()+"\"}");
		result.append("}");
		System.out.println(result.toString());
	}
}
