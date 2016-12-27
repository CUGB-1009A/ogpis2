package com.ogpis.forecast.parameter;

import java.util.LinkedHashMap;
import java.util.Map;

public class OutputParameter {
	
	private String output ;//json（包含模型参数名、拟合参数值和预测结果）

	@SuppressWarnings("rawtypes")
	private LinkedHashMap paramValueMap;//key-value（参数名-参数值）
	
	@SuppressWarnings("rawtypes")
	private LinkedHashMap predictData;
	
	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}
	
	@SuppressWarnings("rawtypes")
	public LinkedHashMap getParamValueMap() {
		return paramValueMap;
	}

	@SuppressWarnings("rawtypes")
	public void setParamVauleMap(LinkedHashMap paramValueMap) {
		this.paramValueMap = paramValueMap;
	}


	@SuppressWarnings("rawtypes")
	public LinkedHashMap getPredictData() {
		return predictData;
	}

	@SuppressWarnings("rawtypes")
	public void setPredictData(LinkedHashMap predictData) {
		this.predictData = predictData;
	}
}
