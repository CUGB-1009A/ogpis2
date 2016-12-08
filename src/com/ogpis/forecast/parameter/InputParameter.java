package com.ogpis.forecast.parameter;

import java.util.LinkedHashMap;

public class InputParameter {
	@SuppressWarnings("rawtypes")
	private LinkedHashMap historyDataMap;
	
	private int historyBeginYear ;//历史数据起始年份 
	
	private int historyEndYear;//历史数据结束年份
	
	private int futureBeginYear ;//预测的起始年份
	
	private int futureEndYear;//预测的结束年份
	
	private double historyData[][] ;//历史数据
	
	private int PEM ; //参数拟合方法Parameter estimation method缩写
	
	private int varNum ; //自变量个数

	@SuppressWarnings("rawtypes")
	public LinkedHashMap getHistoryDataMap() {
		return historyDataMap;
	}

	@SuppressWarnings("rawtypes")
	public void setHistoryDataMap(LinkedHashMap historyDataMap) {
		this.historyDataMap = historyDataMap;
	}

	public int getHistoryBeginYear() {
		return historyBeginYear;
	}

	public void setHistoryBeginYear(int historyBeginYear) {
		this.historyBeginYear = historyBeginYear;
	}

	public int getHistoryEndYear() {
		return historyEndYear;
	}

	public void setHistoryEndYear(int historyEndYear) {
		this.historyEndYear = historyEndYear;
	}
	
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
