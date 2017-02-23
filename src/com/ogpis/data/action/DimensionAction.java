package com.ogpis.data.action;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.DimensionService;
import com.ogpis.data.service.DimensionValueService;
import com.ogpis.data.service.SubjectService;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

@Controller
public class DimensionAction extends BaseAction{
	
	@Autowired
	private DimensionService dimensionService;
	@Autowired
	private SubjectService subjectService;
	
	
	
	@RequestMapping(value = "/baseinfo/list")
	public String list(HttpServletRequest request, ModelMap model) {
		List<Subject> subjects = subjectService.findAll();
		model.addAttribute("subjects",subjects);
		return "data/baseinfo";
	}
	

	@RequestMapping(value = "/dimensionList")
	@ResponseBody
	public void dimensionList(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		Pagination pagination = dimensionService.getAllDimension(SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(this.toJsonTableData(pagination, null, true));
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
		}
	
	@RequestMapping(value = "/dimension/save")
	public void save(HttpServletRequest request, HttpServletResponse response,ModelMap model) throws IOException {
		String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
		boolean isYear = request.getParameter("isYear").equals("true");
		boolean isMetric = request.getParameter("isMetric").equals("true");
		boolean type = request.getParameter("type").equals("add");
		Dimension dimension ;
		if(type){//新建
			dimension = new Dimension();
		}
		else{
			String id = request.getParameter("id"); 
			dimension = dimensionService.findById(id);
		}
		dimension.setYear(isYear);
		dimension.setName(name);
		dimension.setMetric(isMetric);
		dimensionService.save(dimension);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/dimension/delete")
	public void delete(@RequestParam(value="ids[]") String[] ids,HttpServletRequest request,  HttpServletResponse response,ModelMap model) throws IOException {
		for(String temp : ids){
			Dimension dimension = dimensionService.findById(temp);
			dimensionService.update(dimension);
		}
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/dimension/getDimensionInfo")
	public void getDimensionInfo(HttpServletRequest request,  HttpServletResponse response,ModelMap model) throws IOException {
		String id = request.getParameter("id");
		Dimension dimension = dimensionService.findById(id);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject json = JSONObject.fromObject(dimension,jsonConfig);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(json.toString());
	    response.getWriter().write(json.toString());
	}
	
}