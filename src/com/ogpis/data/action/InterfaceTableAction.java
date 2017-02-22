package com.ogpis.data.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

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
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.data.service.SubjectService;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

@Controller
public class InterfaceTableAction extends BaseAction{
	
	@Autowired
	private InterfaceTableService interfaceTableService;
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value = "/interfaceList")
	@ResponseBody
	public void dimensionList(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		Pagination pagination = interfaceTableService.getAllInterface(SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(this.toJsonTableData(pagination, null, true));
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
	}
	
	@RequestMapping(value = "/interfaceTable/getInterfaceMsg")
	@ResponseBody
	public void getInterfaceMsg(HttpServletRequest request , HttpServletResponse response) throws IOException{
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
	
	@RequestMapping(value = "/interfaceTable/save")
	@ResponseBody
	public void save(@RequestParam(value="subjectIds[]") String[] tempSubjectIds,HttpServletRequest request , HttpServletResponse response) throws IOException{
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String interfaceNameCN = URLDecoder.decode(request.getParameter("interfaceNameCN"), "UTF-8");
		String interfaceNameEN = URLDecoder.decode(request.getParameter("interfaceNameEN"), "UTF-8");
		String interfaceDescription = URLDecoder.decode(request.getParameter("interfaceDescription"), "UTF-8");
		String isLocal = request.getParameter("isLocal");
		StringBuilder subjectIds = new StringBuilder(); 
		for(String temp : tempSubjectIds){
			subjectIds.append("'"+temp+"',");
		}
		subjectIds.deleteCharAt(subjectIds.length()-1);
		InterfaceTable interfaceTable;
		if(type.equals("add"))
			interfaceTable = new InterfaceTable();
		else
			interfaceTable = interfaceTableService.findById(id);
		List<Subject> subjects = subjectService.findByIds(subjectIds.toString());
		interfaceTable.setLocal(isLocal.equals("true"));
		interfaceTable.setName_CN(interfaceNameCN);
		interfaceTable.setName_EN(interfaceNameEN);
		interfaceTable.setDeleted(false);
		interfaceTable.setDescription(interfaceDescription);
		interfaceTable.setSubjects(subjects);
		interfaceTableService.save(interfaceTable);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/interfaceTable/delete")
	@ResponseBody
	public void delete(@RequestParam(value="ids[]") String[] tempinterfaceIds,HttpServletRequest request,HttpServletResponse response) throws IOException{
		StringBuilder interfaceIds = new StringBuilder(); 
		for(String temp : tempinterfaceIds){
			interfaceIds.append("'"+temp+"',");
		}
		interfaceIds.deleteCharAt(interfaceIds.length()-1);
		List<InterfaceTable> interfaceTables = interfaceTableService.findByIds(interfaceIds.toString());
		interfaceTableService.delete(interfaceTables);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/interfaceTable/getInterfaceBysubject")
	@ResponseBody
	public void getInterfaceBysubject(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
	}
}
