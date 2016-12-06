package com.ogpis.forecast.parameter;

import java.util.Map;

public class OutputParameter {
	
	private String output ;//json（包含模型参数名、拟合参数值和预测结果）

	@SuppressWarnings("rawtypes")
	private Map pemMap;//key-value（参数名-参数值）
	
	@SuppressWarnings("rawtypes")
	private Map predictData;
	
	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}
	
	@SuppressWarnings("rawtypes")
	public Map getPemMap() {
		return pemMap;
	}

	@SuppressWarnings("rawtypes")
	public void setPemMap(Map pemMap) {
		this.pemMap = pemMap;
	}

	@SuppressWarnings("rawtypes")
	public Map getPredictData() {
		return predictData;
	}

	@SuppressWarnings("rawtypes")
	public void setPredictData(Map predictData) {
		this.predictData = predictData;
	}
}
