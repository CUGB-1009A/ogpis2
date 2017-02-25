package com.ogpis.data.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

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
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.InterfaceTable;
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
		model.put("dimensions", dimensionService.getAllDimension());
		return "data/dataSource";
	}

	@RequestMapping(value = "/dataSource/getTableAndRealDS")
	public void getTableAndRealDS(String subjectId, HttpServletResponse response) {
		System.out.println(subjectId);
		String[] filters=new String[]{"modifiedTime","createTime","dataCache","dataSourceFields"};
		List<InterfaceTable> tableList = subjectService.findById(subjectId).getInterfaceTables();
		JSONArray tableArray = JSONArray.fromObject(tableList, getJsonConfig(filters));
		System.out.println(tableArray.toString());
		List<DataSource> dataSourceList = dataSourceService.findRealDSBySujectId(subjectId);
		JSONArray dsArray = JSONArray.fromObject(dataSourceList, getJsonConfig(filters));
		System.out.println(dsArray.toString());
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
		System.out.println(this.toJsonTableData(pagination, null, true));
		response.getWriter()
				.write(this.toJsonTableData(pagination, null, true));
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
}
