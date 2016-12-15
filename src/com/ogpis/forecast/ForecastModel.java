package com.ogpis.forecast;

import java.util.LinkedHashMap;
import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public interface ForecastModel {

	public OutputParameter compute(InputParameter input);
	
	public String test();
	
	@SuppressWarnings("rawtypes")
	public LinkedHashMap getPEM();
	
	public boolean isSelfCorrelation();//所用数据是否自相关
	
	public boolean isMultiSource();//是否需要多个数据用作支撑
}
