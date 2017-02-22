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
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.DimensionService;
import com.ogpis.data.service.DimensionValueService;
import com.ogpis.data.service.SubjectService;

@Controller
public class DimensionAction extends BaseAction{
	
	@Autowired
	private DimensionService dimensionService;
	@Autowired
	private DimensionValueService dimensionValueService;
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
		String subjectIds = request.getParameter("subjectIds");
		String priority = request.getParameter("priority");
		String flag = request.getParameter("flag");
		String isYear = request.getParameter("isYear");
		String dimensionValues = URLDecoder.decode(request.getParameter("dimensionValues"), "UTF-8");
		System.out.println(isYear);
		boolean dimensionIsYear = isYear.equals("yes");
		System.out.println(name+subjectIds+priority);
		String[] idArray= subjectIds.split(";");
		String[] dimensionValueArray = dimensionValues.split(";");
		String ids = "";
		for(String temp : idArray){
			ids = ids + "\'" + temp + "\',";
		}
		ids = ids.substring(0,ids.length()-1);
		List<Subject> subjects = subjectService.findByIds(ids);
		Dimension dimension = null;
		if(flag.equals("new")){//新建维度信息
			dimension = new Dimension();
		}
		if(flag.equals("update")){//修改维度信息
			String id = request.getParameter("id");
			dimension = dimensionService.findById(id);
		}	
		dimension.setYear(dimensionIsYear);
		dimension.setName(name);
		dimensionService.save(dimension);
		Integer count = 0;
		if(dimension.getDimensionValues()!=null){
			List<DimensionValue> dimensionValuesOld = dimension.getDimensionValues();
			dimensionValueService.delete(dimensionValuesOld);
		}
			for(String temp1 : dimensionValueArray){
				DimensionValue dimensionValue = new DimensionValue();
				dimensionValue.setValue(temp1);
				dimensionValue.setDimension(dimension);
				dimensionValue.setPriority(count);
				dimensionValueService.save(dimensionValue);
				count++;
			}	
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/dimension/delete")
	public void delete(HttpServletRequest request,  HttpServletResponse response,ModelMap model) throws IOException {
		String ids = request.getParameter("ids");
		String[] idArray= ids.split(";");
		String ids1 = "";
		for(String temp : idArray){
			ids1 = ids1 + "\'" + temp + "\',";
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
		List<DimensionValue> dimensionValues = dimension.getDimensionValues();
		String dimensionValueString = "";
		for(DimensionValue temp : dimensionValues){
			dimensionValueString += temp.getValue()+";";
		}
		dimensionValueString = dimensionValueString.substring(0,dimensionValueString.length()-1);
		StringBuilder result = new StringBuilder();
		result.append("{\"dimensionValues\":\""+dimensionValueString+"\",\"name\":\""+dimension.getName()+"\",\"year\":\""+dimension.isYear()+"\",\"ids\":[");
	/*	for(Subject temp : subjects){
			result.append("\""+temp.getId()+"\",");
		}*/
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(result.toString());
	}
	
}