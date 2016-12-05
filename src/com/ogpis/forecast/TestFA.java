package com.ogpis.forecast;

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
}
