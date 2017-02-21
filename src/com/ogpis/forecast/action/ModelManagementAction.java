package com.ogpis.forecast.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.service.ModelInfoService;
import com.ogpis.forecast.util.ForecastUtil;

@Controller
public class ModelManagementAction extends BaseAction{
	
	@Autowired ModelInfoService modelInfoService ;
	
	@RequestMapping(value = "/model/list")
	public String list(HttpServletRequest request, ModelMap model) {
				
		return "forecast/fake/model/list";
		
	}
	
	@RequestMapping(value = "/getModel")//在预测的时候选取模型
	@ResponseBody
	public void getModel(HttpServletResponse response) throws IOException{
		StringBuilder result = new StringBuilder();
		result.append("[");
		List<ModelInfo> models = modelInfoService.getAllModel();
		for(ModelInfo temp : models){
			result.append("{\"modelName\":\""+temp.getModelName()+"\",\"id\":\""+temp.getId()+"\"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("]");
		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value = "/getPem")//在预测的时候选取模型
	@ResponseBody
	public void getPem(HttpServletResponse response , HttpServletRequest request) throws IOException{
		String id= request.getParameter("id");
		ModelInfo modelInfo = modelInfoService.findById(id);
		StringBuilder result = new StringBuilder();
		result.append("{\"description\":\""+modelInfo.getModelDescription()+"\",\"pems\":[");
		System.out.println(result.toString());
		LinkedHashMap pemList = ForecastUtil.getPEM(modelInfo.getJarUrl(), modelInfo.getClassName());
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
	    response.getWriter().write(result.toString());
	}
	
	@RequestMapping(value = "/getAllModel")//管理时候获取模型的信息，通过列表的形式展现出来
	@ResponseBody
	public void getAllModel(@RequestParam("page") Integer pageNumber,
			@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		Pagination pagination = modelInfoService.getAllModel(SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(this.toJsonTableData(pagination, null, true));
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/model/modelChanged")
	public void modelChanged(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		String id = request.getParameter("id");
		ModelInfo modelInfo = modelInfoService.findById(id);
		String modelDescription = modelInfo.getModelDescription().replaceAll("\"","'");
		StringBuilder result = new StringBuilder();
		result.append("{\"modelDescription\":\""+modelDescription+"\",\"pemList\":[");
		LinkedHashMap pemList = ForecastUtil.getPEM(modelInfo.getJarUrl(), modelInfo.getClassName());
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
