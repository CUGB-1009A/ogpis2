package com.ogpis.forecast;

import java.util.LinkedHashMap;
import java.util.Map;

import com.ogpis.forecast.parameter.InputParameter;
import com.ogpis.forecast.parameter.OutputParameter;

public class TestFA implements ForecastModel {


	@Override
	public String test() {
		// TODO Auto-generated method stub
		return "test";
	}

	@Override
	public OutputParameter compute(InputParameter input) {
		System.out.println(input);
		// TODO Auto-generated method stub
		return new OutputParameter();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public LinkedHashMap getPEM() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isSelfCorrelation() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isMultiSource() {
		// TODO Auto-generated method stub
		return false;
	}
}
