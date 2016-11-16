package com.ogpis.forecast;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public interface ForecastModel {

	public OutputParameter compute(InputParameter input);
	
	public String test();
}
