package com.ogpis.forecast.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.forecast.entity.DataCollection;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.entity.PEM;
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
	
	//产量预测
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
			String dataCollectionType = request.getParameter("dataCollectionType");
			System.out.println(dataCollectionType);
			List<DataCollection> dataCollectionList= dataCollectionService.findByDataCollectionType(dataCollectionType);
			List<ModelInfo> modelInfoList =  dataCollectionList.get(0).getModelInfo();
			List<PEM> pemList = modelInfoList.get(0).getPem();
			List<PeriodDefinition> periodIntervalList = periodDefinitionService.findAll();
			//将数据集转为map的形式，key为年份，value为具体的值,假定数据集为1949--2014年产量随机数据,其中1949、2015和数据集是通过服务接口取得的
			LinkedHashMap dataCollectionMap = new LinkedHashMap();
			for(int i=1949;i<2015;i++){
				dataCollectionMap.put(i+"",Math.round(i*Math.random()));
			}
			model.addAttribute("periodIntervalList",periodIntervalList);
			model.addAttribute("dataCollectionMap",dataCollectionMap);
			model.addAttribute("dataCollectionList", dataCollectionList);
			model.addAttribute("modelInfoList", modelInfoList);
			model.addAttribute("pemList", pemList);
			return "forecast/output";
		}
	
	
	//产量预测
	@RequestMapping(value = "/forecast/outputPrediction")
	public void outputPrediction(HttpServletRequest request, ModelMap model, HttpServletResponse response) {
		String modelName = request.getParameter("modelName");
		Integer historyBeginYear = Integer.parseInt(request.getParameter("historyBeginYear"));
		Integer historyEndYear = Integer.parseInt(request.getParameter("historyEndYear"));
		Integer futureBeginYear = Integer.parseInt(request.getParameter("futureBeginYear"));
		Integer futureEndYear = Integer.parseInt(request.getParameter("futureEndYear"));
		Integer PEM = Integer.parseInt(request.getParameter("PEM"));
		Map modelInfo = ForecastUtil.getModelInfo(
				ForecastUtil.getForecastModelInfo(modelName+".JarName"),
				ForecastUtil.getForecastModelInfo(modelName+".ClassName"));
		//model.addAttribute("modelInfo", modelInfo);
		InputParameter input = new InputParameter();
	
		input.setPEM(PEM);
		/*double[][] temp = new double[input.getVarNum()][input.getEndYear()-input.getBeginYear()+1];*/
		double[][] temp = null; //获取历史数据
		input.setHistoryData(temp);
		OutputParameter output = new OutputParameter();
		
		output.setOutput(ForecastUtil.compute(modelName+".JarName", modelName+".ClassName", input).getOutput());
		output.getOutput();
		
		
		String result = "{\"flag\":\"success\"}";
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		System.out.println(modelName);

	}
	
	//储量预测
	@RequestMapping(value = "/forecast/storagePrediction")
	public String storagePrediction(HttpServletRequest request, ModelMap model) {
		System.out.println("forecast");
		Map modelInfo = ForecastUtil.getModelInfo(
				ForecastUtil.getForecastModelInfo("testFA.JarName"),
				ForecastUtil.getForecastModelInfo("testFA.ClassName"));
		model.addAttribute("modelInfo", modelInfo);
		return "forecast/storage";
	}
	
	//数据集改变了，对应模型得变，对应模型的参数拟合方法得变，对应数据起始终止年份得变化
	@RequestMapping(value = "/forecast/dataCollectionChanged")
	public void dataCollectionChanged(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		String dataCollectionId = request.getParameter("dataCollectionId");
		DataCollection dataCollection = dataCollectionService.findById(dataCollectionId);
		List<ModelInfo> modelInfoList = dataCollection.getModelInfo();
		List<PEM> pemList = modelInfoList.get(0).getPem();
		StringBuilder result = new StringBuilder(); 
		result.append("{\"model\":[");
		for(ModelInfo tempModel:modelInfoList)
		{
			result.append("{\"name\":\""+tempModel.getModelName()+"\",\"id\":\""+tempModel.getId()+"\"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("],");
		result.append("\"pem\":[");
		for(PEM tempPEM:pemList)
		{
			result.append("{\"name\":\""+tempPEM.getPemName()+"\",\"id\":\""+tempPEM.getId()+"\"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		//模型变了，对应模型的参数拟合方法得变，对应数据起始终止年份得变化
		@RequestMapping(value = "/forecast/modelChanged")
		public void modelChanged(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
			String modelId = request.getParameter("modelId");
			ModelInfo modelInfo = modelInfoService.findById(modelId);
			List<PEM> pemList = modelInfo.getPem();
			StringBuilder result = new StringBuilder(); 
			result.append("{\"pem\":[");
			for(PEM tempPEM:pemList)
			{
				result.append("{\"name\":\""+tempPEM.getPemName()+"\",\"id\":\""+tempPEM.getId()+"\"},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]}");
			System.out.println(result);
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
			try {
				response.getWriter().write(result.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
}
