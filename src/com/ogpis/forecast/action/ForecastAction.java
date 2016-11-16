package com.ogpis.forecast.action;

import javax.servlet.http.HttpServletRequest;

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
}
