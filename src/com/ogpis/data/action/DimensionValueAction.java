package com.ogpis.data.action;



import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.service.DimensionService;
import org.springframework.ui.ModelMap;
import com.ogpis.base.action.BaseAction;
import com.ogpis.data.service.DimensionValueService;

@Controller

public class DimensionValueAction extends BaseAction{
	
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
	
	@RequestMapping(value = "/dimensionValue/getByDimensionId")
	public void getByDimensionId(String dimensionId,HttpServletResponse response) {
		System.out.println(dimensionId);
		List<DimensionValue> list=dimensionValueService.getByDimensionId(dimensionId);
		System.out.println("++++++++++++"+list.size());
		String[] filters=new String[]{"modifiedTime","createTime","orderdDimensionValue"};
		JSONArray array = JSONArray.fromObject(list, getJsonConfig(filters));
		responseJson(response, array.toString());
	}


}
