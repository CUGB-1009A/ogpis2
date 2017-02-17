package com.ogpis.dataBrowse.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.data.entity.ColumnSet;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.DataSourceService;

@Controller
public class dataBrowseAction {
	
	@Autowired
	private DataSourceService dataSourceService ;
	
	@RequestMapping(value = "/dataBrowse")
	public String dataBrowse(HttpServletRequest request, ModelMap model) {		
		System.out.println("dataBrowse/dataBrowse");
		return "dataBrowse/dataBrowse";
	}
	@RequestMapping(value = "/dataBrowse_zyl_qg")
	public String dataBrowse_zyl_qg(HttpServletRequest request, ModelMap model) {		
		System.out.println("dataBrowse/dataBrowse_zyl_qg");
		return "dataBrowse/dataBrowse_zyl_qg";
	}
	@RequestMapping(value = "/dataBrowse_reserves_company")
	public String dataBrowse_reserves_company(HttpServletRequest request, ModelMap model) {		
		System.out.println("dataBrowse/dataBrowse_reserves_company");
		return "dataBrowse/dataBrowse_reserves_company";
	}
	
	@RequestMapping(value = "/dataBrowse_Tu")
	public String dataBrowse_Tu(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		model.addAttribute("id",id);
		System.out.println("历史数据要览测试action");
		return "dataBrowse/dataBrowse_Tu";
	}
	
	@RequestMapping(value = "/getTabDimension")
	public void getTabDimension(HttpServletRequest request, HttpServletResponse response ,ModelMap model) throws IOException {
		StringBuilder result = new StringBuilder();
		String id = request.getParameter("id");
		DataSource dataSource = dataSourceService.findById(id);
			List<Field> fields = dataSource.getField();
			result.append("{\"table\":\""+dataSource.getTable().getName()+"\",");
			List<TableColumns> tableColumns = dataSource.getTableColumns();
			result.append("\"condition\":[");
			for(Field temp:fields){
				result.append("{\"name\":\""+temp.getValue()+"\",\"name_key\":\""+temp.getKey()+"\",\"isYear\":"+temp.getDimension().isYear()+",");
				if(temp.getDimension().isYear()){
					result.append("\"value\":[],");
					}
				else{
						List<DimensionValue> dimensionValues = temp.getDimension().getOrederdDimensionValue();
						result.append("\"value\":[");
						for(DimensionValue temp1 : dimensionValues){
							result.append("\""+temp1.getValue()+"\",");
						}
						result.deleteCharAt(result.length()-1);
						result.append("],");
					}
				result.deleteCharAt(result.length()-1);
				result.append("},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("],\"coordinate\":[");
			for(TableColumns temp1:tableColumns){
				if(temp1.getColumnSet().getType().equals("x")){
					result.append("{\"key\":\""+temp1.getKey()+"\",\"value\":\""+temp1.getValue()+"\",\"x\":true},");
				}
				else{
					result.append("{\"key\":\""+temp1.getKey()+"\",\"value\":\""+temp1.getValue()+"\",\"x\":false},");
				}
			}
			result.deleteCharAt(result.length()-1);
			result.append("]}");	
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(result.toString());
	    response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value = "/getTabDimension1")
	public void getTabDimension1(HttpServletRequest request, HttpServletResponse response ,ModelMap model) throws IOException {
		StringBuilder result = new StringBuilder();
		String id = request.getParameter("id");
		DataSource dataSource;
		System.out.println(id);
		if(dataSourceService.findById(id).getTable()==null)
			dataSource = dataSourceService.findById(id).getChildren().get(0);
		else
			dataSource = dataSourceService.findById(id);
		result.append("{\"table\":\""+dataSource.getTable().getName()+"\",");
		result.append("\"condition\":[");
		if(dataSourceService.findById(id).getTable()==null){//说明是虚拟数据源，还有下级数据源，先将决定查哪张表的下拉框放入
			System.out.println("该数据源是虚拟数据源，没有绑定表");
			result.append("{\"name\":\""+dataSourceService.findById(id).getParentNodeName()+"\",");
			result.append("\"tableArray\":[");
			for(DataSource temp : dataSourceService.findById(id).getChildren()){
				result.append("{\"id\":\""+temp.getId()+"\",\"key\":\""+temp.getChildNodeName()+"\",\"value\":\""+temp.getTable().getName()+"\"},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("],\"type\":\"interfaceTable\"},");
		}
			//-----------表的下拉框搞定了
			for(TableColumns temp1 : dataSource.getTableColumns()){
				if(temp1.getColumnSet()==null){//说明是描述表中某几个字段的集合
					result.append("{\"name\":\""+temp1.getValue()+"\",\"choiceArray\":[");	
					for(TableColumns temp2 : temp1.getChildren()){
						result.append("{\"key\":\""+temp2.getKey()+"\",\"value\":\""+temp2.getValue()+"\"},");
					}
					result.deleteCharAt(result.length()-1);
					result.append("],");
					result.append("\"type\":\"choice\"},");
				}
				else{//默认必须选择的字段
					result.append("{\"name\":\""+temp1.getValue()+"\",\"choiceArray\":[{\"key\":\""+temp1.getKey()+"\",\"value\":\""+temp1.getValue()+"\"}],");		
					result.append("\"type\":\"choice\"},");
				}
			}
			//--------select A,B from 语句中的A,B搞定了
			for(Field temp3: dataSource.getField()){
				result.append("{\"name\":\""+temp3.getValue()+"\",\"key\":\""+temp3.getKey()+"\",\"isYear\":"+temp3.getDimension().isYear()+",\"yearType\":\""+temp3.getDimension().getYearType()+"\",");
				if(temp3.getDimension().isYear()){
					result.append("\"value\":[],");
					}
				else{
						List<DimensionValue> dimensionValues = temp3.getDimension().getOrederdDimensionValue();
						result.append("\"value\":[");
						for(DimensionValue temp4 : dimensionValues){
							result.append("\""+temp4.getValue()+"\",");
						}
						result.deleteCharAt(result.length()-1);
						result.append("],");
					}
				result.append("\"type\":\"condition\"");
				result.append("},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]}");

		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(result.toString());
	}
}