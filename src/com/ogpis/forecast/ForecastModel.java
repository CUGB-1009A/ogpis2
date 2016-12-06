package com.ogpis.forecast;

import java.util.LinkedHashMap;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public interface ForecastModel {

	public OutputParameter compute(InputParameter input);
	
	public String test();
	
	@SuppressWarnings("rawtypes")
	public LinkedHashMap getPEM();
}
