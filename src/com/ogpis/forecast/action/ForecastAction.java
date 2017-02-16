package com.ogpis.forecast.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.forecast.ForecastData;
import com.ogpis.forecast.HistoryData;
import com.ogpis.forecast.entity.ForecastRecord;
import com.ogpis.forecast.entity.ForecastType;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.entity.PeriodDefinition;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;
import com.ogpis.forecast.service.ForecastRecordService;
import com.ogpis.forecast.service.ForecastTypeService;
import com.ogpis.forecast.service.ModelInfoService;
import com.ogpis.forecast.service.PeriodDefinitionService;
import com.ogpis.forecast.util.FileOperate;
import com.ogpis.forecast.util.ForecastUtil;
import com.ogpis.system.service.UserService;

@Controller
public class ForecastAction extends BaseAction{
	
	@Autowired 
	private ForecastRecordService forecastRecordService;
	@Autowired 
	private ModelInfoService modelInfoService;
	@Autowired 
	private UserService userService;
	@Autowired 
	private ForecastTypeService forecastTypeService;
	@Autowired 
	private PeriodDefinitionService periodDefinitionService;
	
	
	@RequestMapping(value = "/forecast/getDataSourceByForecastType")
	public void getDataSourceByForecastType(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		
	}
	
	@RequestMapping(value = "/forecast")
	public String demo(HttpServletRequest request, ModelMap model) {
		System.out.println("forecast");
		OutputParameter result = ForecastUtil.compute(
				ForecastUtil.getForecastModelInfo("testFA.JarName"),
				ForecastUtil.getForecastModelInfo("testFA.ClassName"), new InputParameter());
		model.addAttribute("result", result);
		return "forecast/view";
	}
	
	@RequestMapping(value = "/forecast/list")
	public String list(HttpServletRequest request, ModelMap model) {
		List<ForecastType> forecastType = forecastTypeService.findAll();
		model.addAttribute("forecastType",forecastType);
		return "forecast/fake/list";
	}
	
	@RequestMapping(value = "/forecast/finishedList")
	public String finishedList(HttpServletRequest request, ModelMap model) {
		List<ForecastType> forecastType = forecastTypeService.findAll();
		model.addAttribute("forecastType",forecastType);
		return "forecast/fake/finishedList";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/forecast/toCreatePredictionPage")
	public String toCreatePredictionPage(HttpServletRequest request, ModelMap model) {
		String recordId = request.getParameter("recordId");
		ForecastRecord forecastRecord = forecastRecordService.findById(recordId);

		String projectUrl = request.getServletContext().getRealPath("/");
		String tomcatUrl = projectUrl.substring(0, projectUrl.indexOf("webapps"));
		String xmlUrl = tomcatUrl+"file\\forecastRecordXML\\" + forecastRecord.getXmlUrl();
		SAXReader reader = new SAXReader();
		File file = new File(xmlUrl);
		Document document = null;
		try {
			document = reader.read(file);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		Element root = document.getRootElement();
		String step = root.elements().size() + 1+"";
		String historyData = HistoryData.historyData;
		String forecastData = ForecastData.forecastData;
		List<ModelInfo> modelInfoList = modelInfoService.findAll();
		ModelInfo tempModel = modelInfoList.get(0);
		LinkedHashMap pemList = ForecastUtil.getPEM(tempModel.getJarName(),tempModel.getClassName());
		List<PeriodDefinition> periodIntervalList = periodDefinitionService.findAll();
		model.addAttribute("periodIntervalList",periodIntervalList);
		model.addAttribute("modelInfoList",modelInfoList);
		model.addAttribute("pemList",pemList);
		model.addAttribute("forecastData", forecastData);
		model.addAttribute("historyData", historyData);
		model.addAttribute("tempModel",tempModel);
		model.addAttribute("step", step);
		System.out.println(step);
		return "forecast/createPrediction";
	}
		
		//模型变了，对应模型的参数拟合方法得变
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@RequestMapping(value = "/forecast/modelChanged")
		public void modelChanged(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
			String modelId = request.getParameter("modelId");
			ModelInfo modelInfo = modelInfoService.findById(modelId);
			LinkedHashMap pemList = ForecastUtil.getPEM(modelInfo.getJarName(), modelInfo.getClassName());
			StringBuilder result = new StringBuilder(); 
			result.append("{\"pem\":[");
			Iterator<Map.Entry> it= pemList.entrySet().iterator();
			while(it.hasNext())
			{
				Map.Entry entry = it.next(); 
				result.append("{\"name\":\""+entry.getKey()+"\",\"id\":\""+entry.getValue()+"\"},");
			}	
			result.deleteCharAt(result.length()-1);
			result.append("]}");
			System.out.println(result);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
			try {
				response.getWriter().write(result.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		@RequestMapping(value = "/forecast/getUnfinishedForecastRecord")
		@ResponseBody
		public void getUnfinishedForecastRecord(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
			Pagination pagination = forecastRecordService.getRecordByUserId("1",false,
					SimplePage.cpn(pageNumber), pageSize);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    System.out.println(this.toJsonTableData(pagination, null, true));
		    response.getWriter().write(this.toJsonTableData(pagination, null, true));
		
		}
		

		@RequestMapping(value = "/forecast/getFinishedForecastRecord")
		@ResponseBody
		public void getFinishedForecastRecord(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
			Pagination pagination = forecastRecordService.getRecordByUserId("1",true,
					SimplePage.cpn(pageNumber), pageSize);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    System.out.println(this.toJsonTableData(pagination, null, true));
		    response.getWriter().write(this.toJsonTableData(pagination, null, true));
		
		}
		
		@RequestMapping(value = "/forecast/nameIsValid")//检查成果名称是否合法，不允许重复
		@ResponseBody
		public void nameIsValid(HttpServletRequest request,HttpServletResponse response) throws IOException{
			String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
			List<ForecastRecord> forecastRecord = forecastRecordService.findByName(name);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    System.out.println(forecastRecord.size());
		    String result ;
			if(forecastRecord.size()==0){
				 result = "{\"result\":\"true\"}";
			}
			else{
				 result = "{\"result\":\"false\"}";
			}
			 response.getWriter().write(result);
		}
		
		@RequestMapping(value = "/forecast/getHistoryData")//检查成果名称是否合法，不允许重复
		@ResponseBody
		public void getHistoryData(HttpServletRequest request,HttpServletResponse response) throws IOException{
			String result = HistoryData.historyData;
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    System.out.println(result);
			response.getWriter().write(result);
		}
		
		@RequestMapping(value = "/forecast/forecast")//检查成果名称是否合法，不允许重复
		@ResponseBody
		public void forecast(HttpServletRequest request,HttpServletResponse response) throws IOException{
			String result = ForecastData.forecastData;
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    System.out.println(result);
			response.getWriter().write(result);
		}
		
		@RequestMapping(value = "/forecast/deleteRecord")
		public void deleteForecastRecord(HttpServletRequest request,HttpServletResponse response) throws IOException{
			String id = request.getParameter("id");
			ForecastRecord forecastRecord = forecastRecordService.findById(id);
			forecastRecordService.delete(forecastRecord);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    response.getWriter().write("{\"result\":\"success\"}");
		}
		
		@RequestMapping(value = "/forecast/createPrediction")
		public void createPrediction(HttpServletRequest request,HttpServletResponse response) throws IOException{
			String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
			String projectUrl = request.getServletContext().getRealPath("/");
			String tomcatUrl = projectUrl.substring(0, projectUrl.indexOf("webapps"));
			String fileUrl = tomcatUrl + "file\\forecastRecordXML\\";
			
			String prefix = System.currentTimeMillis() + "";
			String fileTemplate = fileUrl+"template.xml";
			String fileTarget = fileUrl+prefix + name + ".xml";
			FileOperate.copyFile(fileTemplate, fileTarget);
			ForecastRecord forecastRecord = new ForecastRecord();
			forecastRecord.setXmlUrl(prefix + name + ".xml");
			forecastRecord.setForecastName(name);
			forecastRecord.setForecastStep("预测新建完成");
			forecastRecord.setUser(userService.findById("1"));
			forecastRecordService.save(forecastRecord);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    response.getWriter().write("{\"id\":\""+forecastRecord.getId()+"\"}");
		}
		
}
