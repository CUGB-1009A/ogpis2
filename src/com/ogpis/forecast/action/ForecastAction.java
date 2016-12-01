package com.ogpis.forecast.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;
import com.ogpis.forecast.util.ForecastUtil;

@Controller
public class ForecastAction {
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
			return "forecast/output";
		}
	
	
	//产量预测
	@RequestMapping(value = "/forecast/outputPrediction")
	public void outputPrediction(HttpServletRequest request, ModelMap model, HttpServletResponse response) {
		String modelName = request.getParameter("modelName");
		int historyBeginYear = Integer.parseInt(request.getParameter("historyBeginYear"));
		int historyEndYear = Integer.parseInt(request.getParameter("historyEndYear"));
		int futureBeginYear = Integer.parseInt(request.getParameter("futureBeginYear"));
		int futureEndYear = Integer.parseInt(request.getParameter("futureEndYear"));
		int PEM = Integer.parseInt(request.getParameter("PEM"));
		Map modelInfo = ForecastUtil.getModelInfo(
				ForecastUtil.getForecastModelInfo(modelName+".JarName"),
				ForecastUtil.getForecastModelInfo(modelName+".ClassName"));
		//model.addAttribute("modelInfo", modelInfo);
		InputParameter input = new InputParameter();
		input.setBeginYear(historyBeginYear);
		input.setEndYear(historyEndYear);
		input.setPEM(PEM);
		/*double[][] temp = new double[input.getVarNum()][input.getEndYear()-input.getBeginYear()+1];*/
		double[][] temp = null; //获取历史数据
		input.setHistoryData(temp);
		OutputParameter output = new OutputParameter();
		output.setBeginYear(futureBeginYear);
		output.setEndYear(futureEndYear);
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
}
