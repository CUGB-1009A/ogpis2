package com.ogpis.forecast;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public interface ForecastModel {

	public OutputParameter compute(InputParameter input);
	
	public String test();
	
	public String getParam();//获取模型参数形如：  a;b;k
	
	public String getName();//获取模型名
}
