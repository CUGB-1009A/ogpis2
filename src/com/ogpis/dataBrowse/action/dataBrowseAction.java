package com.ogpis.dataBrowse.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.DataSourceField;
import com.ogpis.data.entity.DataSourceMetric;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.MultiDataSourceMetric;
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
	
	@RequestMapping(value = "dataBrowser/getTabContentByDSId")
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
		result.append("\"y\":{\"isMulti\":"+dataSourceMetric.isMulti()+",");
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
			result.append("\"EN_name\":\""+dataSourceMetric.getTableColumns().getCode()+"\"},");
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
							result.append("{\"key\":\""+temp1.getValue()+"\",\"value\":\""+temp1.getDisplayValue()+"\"},");
						}
						result.deleteCharAt(result.length()-1);
						result.append("]},");
					}
					
			}	
		}
		result.deleteCharAt(result.length()-1);
		result.append("],");
		
		//再添加X轴的内容
		result.append("\"x\":{\"isYear\":"+dataSourceFieldX.getDimension().isYear()+",\"EN_name\":\""+dataSourceFieldX.getTableColumn().getCode()+"\"}");
		result.append("}");
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(result.toString());
	    response.getWriter().write(result.toString());
	}
}