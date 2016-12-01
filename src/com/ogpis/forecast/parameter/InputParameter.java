package com.ogpis.forecast.parameter;

public class InputParameter {
	
	private int beginYear ;//起始年份
	
	private int endYear;//结束年份
	
	private double historyData[][] ;//历史数据
	
	private int PEM ; //参数拟合方法Parameter estimation method缩写
	
	private int varNum ; //自变量个数

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

	public double[][] getHistoryData() {
		return historyData;
	}

	public void setHistoryData(double[][] historyData) {
		this.historyData = historyData;
	}
	
	public int getPEM() {
		return PEM;
	}

	public void setPEM(int pEM) {
		PEM = pEM;
	}
	
	public int getVarNum() {
		return varNum;
	}

	public void setVarNum(int varNum) {
		this.varNum = varNum;
	}
	
	
	
}
