package com.ogpis.forecast.parameter;

public class OutputParameter {
	
	private int beginYear ;//预测的起始年份
	
	private int endYear;//预测的结束年份
	
	private double output[] ;//预测期间的结果

	public int getBeginYear() {
		return beginYear;
	}

	public void setBeginYear(int beginYear) {
		this.beginYear = beginYear;
	}
	
	public int getEndYear() {
		return endYear;
	}

	public void setEndYear(int endYear) {
		this.endYear = endYear;
	}

	public double[] getOutput() {
		return output;
	}

	public void setOutput(double[] output) {
		this.output = output;
	}
	
	
}
