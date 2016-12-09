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

import com.ogpis.forecast.HistoryData;
import com.ogpis.forecast.entity.DataCollection;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.entity.PeriodDefinition;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;
import com.ogpis.forecast.service.DataCollectionService;
import com.ogpis.forecast.service.ModelInfoService;
import com.ogpis.forecast.service.PeriodDefinitionService;
import com.ogpis.forecast.util.ForecastUtil;

@Controller
public class ForecastAction {
	
	@Autowired 
	private DataCollectionService dataCollectionService;
	@Autowired 
	private ModelInfoService modelInfoService;
	@Autowired 
	private PeriodDefinitionService periodDefinitionService;
	
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
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/forecast/toOutputPredictionPage1")
	public String toOutputPredictionPage1(HttpServletRequest request, ModelMap model) {
		//这里要获取数据集，数据集可以用的模型，模型又可以使用的参数拟合方法，获取数据集的起止年份，选择预测结果的起止年份，默认选择第一个！
		/*第一步，通过导航栏传的参数，例如产量预测 url=http://localhost:8080/ogpis2/forecast/toOutputPredictionPage?param=1表示产量预测
		 *第二步，查询产量预测需要预测哪些东西：例如石油产量，天然气产量（煤层气产量、页岩气产量）并选择第一个作为默认值放入select选项中，并将历史数据显示到table中
		 *第三步，看每个具体预测项可以用到的模型，把第一个可用模型作为默认值放入select中
		 *第四步，看每个模型具体用到的参数拟合方法，把第一个拟合方法作为默认值放入select中，
		 *第五步，查看该模型用到的
*/			/*Map modelInfo = ForecastUtil.getModelInfo(
			ForecastUtil.getForecastModelInfo("Poisson.JarName"),
			ForecastUtil.getForecastModelInfo("Poisson.ClassName"));
			String[] modelParam = modelInfo.get("modelParam").toString().split(";");
			model.addAttribute("modelParam", modelParam);
			System.out.println(modelParam);*/
		List<DataCollection> dataCollectionList = null;
		List<ModelInfo> modelInfoList = null ;
		String dataCollectionType = request.getParameter("dataCollectionType");
		 dataCollectionList= dataCollectionService.findByDataCollectionType(dataCollectionType);
		if(dataCollectionList!=null){
			modelInfoList =  dataCollectionList.get(0).getModelInfo();
		}
		ModelInfo tempModel =  dataCollectionList.get(0).getModelInfo().get(0);
		LinkedHashMap pemList = ForecastUtil.getPEM(tempModel.getJarName(),tempModel.getClassName());
		List<PeriodDefinition> periodIntervalList = periodDefinitionService.findAll();
		//将数据集转为map的形式，key为年份，value为具体的值,假定数据集为1949--2014年产量随机数据,其中1949、2015和数据集是通过服务接口取得的
		LinkedHashMap dataCollectionMap = new LinkedHashMap();
		for(int i=1949;i<2015;i++){
			dataCollectionMap.put(i,Math.round(i*Math.random()));
		}
		/*StringBuilder historyData = new StringBuilder();
		historyData.append("{\"historyData\":[");
		Iterator<Map.Entry> it= dataCollectionMap.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = it.next(); 
			historyData.append("{\"year\":"+entry.getKey()+",\"value\":"+entry.getValue()+"},");
		}
		historyData.deleteCharAt(historyData.length()-1);
		historyData.append("]}");*/
		String historyData = HistoryData.historyData;
		System.out.println("HistoryData:"+historyData);
		model.addAttribute("periodIntervalList",periodIntervalList);
		model.addAttribute("dataCollectionMap",dataCollectionMap);
		model.addAttribute("historyData",historyData);
		model.addAttribute("dataCollectionList", dataCollectionList);
		model.addAttribute("modelInfoList", modelInfoList);
		model.addAttribute("pemList", pemList);
		return "forecast/output1";
	}
	
	//到产量预测界面--old
		@SuppressWarnings({ "unchecked", "rawtypes" })
		@RequestMapping(value = "/forecast/toOutputPredictionPage")
		public String toOutputPredictionPage(HttpServletRequest request, ModelMap model) {
			//这里要获取数据集，数据集可以用的模型，模型又可以使用的参数拟合方法，获取数据集的起止年份，选择预测结果的起止年份，默认选择第一个！
			/*第一步，通过导航栏传的参数，例如产量预测 url=http://localhost:8080/ogpis2/forecast/toOutputPredictionPage?param=1表示产量预测
			 *第二步，查询产量预测需要预测哪些东西：例如石油产量，天然气产量（煤层气产量、页岩气产量）并选择第一个作为默认值放入select选项中，并将历史数据显示到table中
			 *第三步，看每个具体预测项可以用到的模型，把第一个可用模型作为默认值放入select中
			 *第四步，看每个模型具体用到的参数拟合方法，把第一个拟合方法作为默认值放入select中，
			 *第五步，查看该模型用到的
*/			/*Map modelInfo = ForecastUtil.getModelInfo(
				ForecastUtil.getForecastModelInfo("Poisson.JarName"),
				ForecastUtil.getForecastModelInfo("Poisson.ClassName"));
				String[] modelParam = modelInfo.get("modelParam").toString().split(";");
				model.addAttribute("modelParam", modelParam);
				System.out.println(modelParam);*/
			List<DataCollection> dataCollectionList = null;
			List<ModelInfo> modelInfoList = null ;
			String dataCollectionType = request.getParameter("dataCollectionType");
			 dataCollectionList= dataCollectionService.findByDataCollectionType(dataCollectionType);
			if(dataCollectionList!=null){
				modelInfoList =  dataCollectionList.get(0).getModelInfo();
			}
			ModelInfo tempModel =  dataCollectionList.get(0).getModelInfo().get(0);
			LinkedHashMap pemList = ForecastUtil.getPEM(tempModel.getJarName(),tempModel.getClassName());
			List<PeriodDefinition> periodIntervalList = periodDefinitionService.findAll();
			//将数据集转为map的形式，key为年份，value为具体的值,假定数据集为1949--2014年产量随机数据,其中1949、2015和数据集是通过服务接口取得的
			LinkedHashMap dataCollectionMap = new LinkedHashMap();
			for(int i=1949;i<2015;i++){
				dataCollectionMap.put(i,Math.round(i*Math.random()));
			}
			/*StringBuilder historyData = new StringBuilder();
			historyData.append("{\"historyData\":[");
			Iterator<Map.Entry> it= dataCollectionMap.entrySet().iterator();
			while(it.hasNext())
			{
				Map.Entry entry = it.next(); 
				historyData.append("{\"year\":"+entry.getKey()+",\"value\":"+entry.getValue()+"},");
			}
			historyData.deleteCharAt(historyData.length()-1);
			historyData.append("]}");*/
			String historyData = HistoryData.historyData;
			System.out.println("HistoryData:"+historyData);
			model.addAttribute("periodIntervalList",periodIntervalList);
			model.addAttribute("dataCollectionMap",dataCollectionMap);
			model.addAttribute("historyData",historyData);
			model.addAttribute("dataCollectionList", dataCollectionList);
			model.addAttribute("modelInfoList", modelInfoList);
			model.addAttribute("pemList", pemList);
			return "forecast/output";
		}
	
	
	//产量预测
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/forecast/outputPrediction")
	public void outputPrediction(HttpServletRequest request, ModelMap model, HttpServletResponse response) {
		String dataCollectionId = request.getParameter("dataCollectionId");
		DataCollection dataCollection = dataCollectionService.findById(dataCollectionId);
		System.out.println("用到的数据集为:"+dataCollection.getDataCollectionName());
		String modelId = request.getParameter("modelId");
		ModelInfo modelInfo = modelInfoService.findById(modelId);
		System.out.println("用到的模型为:"+modelInfo.getModelName());
		Integer historyBeginYear = Integer.parseInt(request.getParameter("historyBeginYear"));
		Integer historyEndYear = Integer.parseInt(request.getParameter("historyEndYear"));
		System.out.println("用来预测的数据从"+historyBeginYear+"-----"+historyEndYear);
		Integer futureBeginYear = Integer.parseInt(request.getParameter("futureBeginYear"));
		Integer futureEndYear = Integer.parseInt(request.getParameter("futureEndYear"));
		System.out.println("预测的结果从"+futureBeginYear+"-----"+futureEndYear);
		Integer PEMNum = Integer.parseInt(request.getParameter("PEMNum"));	
		System.out.println("用来拟合参数的方法编号为"+PEMNum);
		InputParameter input = new InputParameter();
		input.setPEM(PEMNum);
		input.setFutureBeginYear(futureBeginYear);
		input.setFutureEndYear(futureEndYear);
		input.setHistoryBeginYear(historyBeginYear);
		input.setHistoryEndYear(historyEndYear);
		OutputParameter output = ForecastUtil.compute(modelInfo.getJarName(), modelInfo.getClassName(), input);
		StringBuilder result = new StringBuilder(); 
		result.append("{\"output\":{\"predictData\":[");
		Iterator<Map.Entry> it= output.getPredictData().entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = it.next(); 
			result.append("{\"year\":"+entry.getKey()+",\"value\":"+entry.getValue()+"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("],\"pemValue\":[");
		Iterator<Map.Entry> it1= output.getParamValueMap().entrySet().iterator();
		while(it1.hasNext())
		{
			Map.Entry entry1 = it1.next(); 
			result.append("{\"param\":\""+entry1.getKey()+"\",\"value\":"+entry1.getValue()+"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("]}}");
		System.out.println(result);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	//储量预测
	@RequestMapping(value = "/forecast/storagePrediction")
	public String storagePrediction(HttpServletRequest request, ModelMap model) {

		return "forecast/storage";
	}
	
	//数据集改变了，对应模型得变，对应模型的参数拟合方法得变，对应数据起始终止年份得变化
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/forecast/dataCollectionChanged")
	public void dataCollectionChanged(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		List<ModelInfo> modelInfoList = null ;
		String dataCollectionId = request.getParameter("dataCollectionId");
		DataCollection dataCollection = dataCollectionService.findById(dataCollectionId);
		modelInfoList = dataCollection.getModelInfo();
		ModelInfo tempModel = modelInfoList.get(0);
		LinkedHashMap pemList = ForecastUtil.getPEM(tempModel.getJarName(), tempModel.getClassName());
		StringBuilder result = new StringBuilder(); 
		result.append("{\"model\":[");
		for(ModelInfo temp:modelInfoList)
		{
			result.append("{\"name\":\""+temp.getModelName()+"\",\"id\":\""+temp.getId()+"\"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("],");
		result.append("\"pem\":[");
		Iterator<Map.Entry> it= pemList.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = it.next(); 
			result.append("{\"name\":\""+entry.getKey()+"\",\"id\":\""+entry.getValue()+"\"},");
		}		
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
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
}
