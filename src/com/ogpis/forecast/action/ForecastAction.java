package com.ogpis.forecast.action;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ogpis.forecast.HistoryData;
import com.ogpis.forecast.entity.DataCollection;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;
import com.ogpis.forecast.service.DataCollectionService;
import com.ogpis.forecast.service.ModelInfoService;
import com.ogpis.forecast.service.PeriodDefinitionService;
import com.ogpis.forecast.service.SelfDataService;
import com.ogpis.forecast.util.ForecastUtil;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;

@Controller
public class ForecastAction {
	
	@Autowired 
	private DataCollectionService dataCollectionService;
	@Autowired 
	private ModelInfoService modelInfoService;
	@Autowired 
	private UserService userService;
	@Autowired 
	private SelfDataService selfDataService;
	
	@RequestMapping(value = "/forecast")
	public String demo(HttpServletRequest request, ModelMap model) {
		System.out.println("forecast");
		OutputParameter result = ForecastUtil.compute(
				ForecastUtil.getForecastModelInfo("testFA.JarName"),
				ForecastUtil.getForecastModelInfo("testFA.ClassName"), new InputParameter());
		model.addAttribute("result", result);
		return "forecast/view";
	}
	
	//到产量预测界面---new
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/forecast/toPredictionPage")
	public String toPredictionPage(HttpServletRequest request, ModelMap model) {
		String historyData = HistoryData.historyData;
		List<DataCollection> originDataCollections = dataCollectionService.findOriginData();
		String dataCollectionId = originDataCollections.get(0).getId();
		String userId = "1";
		User user = userService.findById(userId);
		List<DataCollection> selfDataCollections = dataCollectionService.findMyData(userId);
		List<DataCollection> otherssharedDataCollections = dataCollectionService.findOthersSharedData(userId);
		List<ModelInfo> modelInfoList = modelInfoService.findAll();
		ModelInfo tempModel = modelInfoList.get(0);
		LinkedHashMap pemList = ForecastUtil.getPEM(tempModel.getJarName(),tempModel.getClassName());
		model.addAttribute("originDataCollections",originDataCollections);
		model.addAttribute("selfDataCollections",selfDataCollections);
		model.addAttribute("otherssharedDataCollections",otherssharedDataCollections);
		model.addAttribute("historyData",historyData);
		model.addAttribute("tempModel",tempModel);
		model.addAttribute("modelInfoList",modelInfoList);
		model.addAttribute("pemList",pemList);
		model.addAttribute("dataCollectionId",dataCollectionId);
		return "forecast/forecast";
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
		
		@RequestMapping(value = "/forecast/saveSelfDataCollection")
		public void saveSelfDataCollection(HttpServletRequest request, ModelMap model,HttpServletResponse response) throws UnsupportedEncodingException {
			String dataCollectionName = URLDecoder.decode(request.getParameter("dataCollectionName"), "UTF-8");
			String dataCollectionId = request.getParameter("dataCollectionId");
			DataCollection temp = dataCollectionService.findById(dataCollectionId);
			String fatherId;
			if(temp.isOrigin())//从原始数据上加工
				fatherId = dataCollectionId;
			else//从二手数据上再加工
				fatherId = temp.getFatherId();
			String[] year = request.getParameter("year").split(",");
			String[] value = request.getParameter("value").split(",");
			DataCollection dataCollection = new DataCollection();
			List<SelfData> selfDataList = new ArrayList<SelfData>();
			User user = userService.findById("1");
			dataCollection.setDataCollectionName(dataCollectionName);
			dataCollection.setFatherId(fatherId);
			dataCollection.setUser(user);
			dataCollection = dataCollectionService.save(dataCollection);
			for(int i=0;i<year.length;i++){
				SelfData tempSelfData = new SelfData();
				tempSelfData.setYear(Integer.parseInt(year[i]));
				tempSelfData.setData(Double.parseDouble(value[i]));
				tempSelfData.setDataCollection(dataCollection);
				selfDataList.add(tempSelfData);			
			}
			selfDataService.save(selfDataList);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
			try {
				response.getWriter().write("{\"id\":\""+dataCollection.getId()+"\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
}
