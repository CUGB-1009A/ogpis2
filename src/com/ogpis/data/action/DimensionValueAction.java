package com.ogpis.data.action;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.service.DimensionService;
import com.ogpis.data.service.DimensionValueService;

@Controller
public class DimensionValueAction {
	
	@Autowired
	private DimensionValueService dimensionValueService;
	@Autowired
	private DimensionService dimensionService;
	
	@RequestMapping(value = "/dimensionValue/delete")
	@ResponseBody
	public void delete(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		DimensionValue dimensionValue = dimensionValueService.findById(id);
		dimensionValue.setDeleted(true);
		dimensionValueService.save(dimensionValue);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"result\":\"success\"}");
	}
	
	@RequestMapping(value = "/dimensionValue/save")
	@ResponseBody
	public void save(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String type = request.getParameter("type");
		String displayValue = URLDecoder.decode(request.getParameter("displayValue"), "UTF-8");
		String value = URLDecoder.decode(request.getParameter("value"), "UTF-8");
		Integer priority = Integer.parseInt(request.getParameter("priority"));
		DimensionValue dimensionValue;
		if(type.equals("new")){
			dimensionValue= new DimensionValue();
			String dimensionId = request.getParameter("dimensionId");
			Dimension dimension = dimensionService.findById(dimensionId);
			dimensionValue.setDimension(dimension);;
		}
		else{
			String id = request.getParameter("id");
			dimensionValue = dimensionValueService.findById(id);
		}
		dimensionValue.setPriority(priority);
		dimensionValue.setDisplayValue(displayValue);;
		dimensionValue.setValue(value);
		dimensionValueService.save(dimensionValue);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write("{\"id\":\""+dimensionValue.getId()+"\"}");
	}

}
