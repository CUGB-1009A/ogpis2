package com.ogpis.data.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.DataSourceService;
import com.ogpis.data.service.SubjectService;
import com.ogpis.forecast.HistoryData;

@Controller
public class DataSourceAction extends BaseAction{
	
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private DataSourceService dataSourceService;
	
	@RequestMapping(value = "/dataSource/list")
	public String list(HttpServletRequest request, ModelMap model) {
		List<Subject> subjects = subjectService.findAll();
		List<InterfaceTable> interfaceTables = null;
		List<Field> fields = null;
		if(subjects.size()>0)
			interfaceTables = subjects.get(0).getInterfaceTables();
		if(interfaceTables.size()>0)
			fields = interfaceTables.get(0).getField();
		model.addAttribute("fields",fields);
		model.addAttribute("interfaceTables",interfaceTables);
		model.addAttribute("subjects",subjects);
		return "data/dataSource";
	}
	
	@RequestMapping(value = "/data/dataMaintain")
	public String dataMaintain(HttpServletRequest request, ModelMap model) {
		String historyData = HistoryData.historyData;
		model.addAttribute("historyData",historyData);
		return "data/dataMaintain";
	}
	
	@RequestMapping(value = "/dataSourceList")
	@ResponseBody
	public void dataSourceList(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		Pagination pagination = dataSourceService.getAllDataSource(SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(this.toJsonTableData(pagination, null, true));
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
		}
	
	@RequestMapping(value = "/dataSource/getAllDataSource")//获取数据源（有子数据源的显示父数据源）
	@ResponseBody
	public void getAllDataSource(HttpServletResponse response) throws IOException{
		StringBuilder result = new StringBuilder();
		result.append("[");
		List<DataSource> dataSources = dataSourceService.findAll();
		System.out.println(dataSources.size());
		for(DataSource temp : dataSources){
			result.append("{\"id\":\""+temp.getId()+"\",\"name\":\""+temp.getName()+"\"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("]");
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(result.toString());
		}

}
