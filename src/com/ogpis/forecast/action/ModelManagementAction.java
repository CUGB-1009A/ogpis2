package com.ogpis.forecast.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.service.ModelInfoService;
import com.ogpis.forecast.util.ForecastUtil;

@Controller
public class ModelManagementAction {
	
	@Autowired ModelInfoService modelInfoService ;
	
	@RequestMapping(value = "/model/list")
	public String list(HttpServletRequest request, ModelMap model) {
				
		return "forecast/model/list";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/model/modelChanged")
	public void modelChanged(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		String id = request.getParameter("id");
		ModelInfo modelInfo = modelInfoService.findById(id);
		String modelDescription = modelInfo.getModelDescription().replaceAll("\"","'");
		StringBuilder result = new StringBuilder();
		result.append("{\"modelDescription\":\""+modelDescription+"\",\"pemList\":[");
		LinkedHashMap pemList = ForecastUtil.getPEM(modelInfo.getJarName(), modelInfo.getClassName());
		Iterator<Map.Entry> it= pemList.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = it.next(); 
			result.append("{\"pemName\":\""+entry.getKey()+"\",\"pemNum\":"+entry.getValue()+"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
