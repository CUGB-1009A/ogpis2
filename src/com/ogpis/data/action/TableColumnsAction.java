package com.ogpis.data.action;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.data.service.TableColumnsService;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;


@Controller
public class TableColumnsAction extends BaseAction{
	
	@Autowired
	private TableColumnsService tableColumnsService;
	@Autowired
	private InterfaceTableService interfaceTableService;
	
	@RequestMapping(value = "/tableColumns/getTColumns")
	@ResponseBody
	public void getTableColumnsByTableId(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		InterfaceTable interfaceTable = interfaceTableService.findById(id);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject json = JSONObject.fromObject(interfaceTable,jsonConfig);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(json.toString());
	    response.getWriter().write(json.toString());
	}
	
	@RequestMapping(value = "/tableColumns/delete")
	@ResponseBody
	public void delete(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		TableColumns tableColumn = tableColumnsService.findById(id);
		tableColumn.setDeleted(true);
		tableColumnsService.save(tableColumn);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/tableColumns/save")
	@ResponseBody
	public void save(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String type = request.getParameter("type");
		String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
		String code = URLDecoder.decode(request.getParameter("code"), "UTF-8");
		TableColumns tableColumn;
		if(type.equals("new")){
			tableColumn = new TableColumns();
			String tableId = request.getParameter("tableId");
			InterfaceTable interfaceTable = interfaceTableService.findById(tableId);
			tableColumn.setTable(interfaceTable);
		}
		else{
			String id = request.getParameter("id");
			tableColumn = tableColumnsService.findById(id);
		}
		tableColumn.setName(name);
		tableColumn.setCode(code);
		tableColumnsService.save(tableColumn);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"id\":\""+tableColumn.getId()+"\"}");
	}


}
