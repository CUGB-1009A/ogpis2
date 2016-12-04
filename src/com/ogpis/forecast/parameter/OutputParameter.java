package com.ogpis.forecast.parameter;

public class OutputParameter {
	
	private int futureBeginYear ;//预测的起始年份
	
	private int futureEndYear;//预测的结束年份
	
	private double output[] ;//预测期间的结果

	public int getFutureBeginYear() {
		return futureBeginYear;
	}

	public void setFutureBeginYear(int futureBeginYear) {
		this.futureBeginYear = futureBeginYear;
	}

	public int getFutureEndYear() {
		return futureEndYear;
	}

	public void setFutureEndYear(int futureEndYear) {
		this.futureEndYear = futureEndYear;
	}

	public double[] getOutput() {
		return output;
	}

	public void setOutput(double[] output) {
		this.output = output;
	}
	
	
}
