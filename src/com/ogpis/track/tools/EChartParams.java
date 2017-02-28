package com.ogpis.track.tools;

public class EChartParams {
	private String xAxisName;//横轴值对应的变量名
	private String xAxisUnit;//横轴单位
	private String yAxisName;//纵轴值对应的变量名
	private String yAxisUnit;//纵轴单位
	public EChartParams(){
		
	}
	public EChartParams(String xAxisName,String yAxisName){
		this.xAxisName=xAxisName;
		this.yAxisName=yAxisName;
	}
	public EChartParams(String xAxisName,String xAxisUnit,String yAxisName,String yAxisUnit){
		this.xAxisName=xAxisName;
		this.xAxisUnit=xAxisUnit;
		this.yAxisName=yAxisName;
		this.yAxisUnit=yAxisUnit;
	}
	public String getxAxisName() {
		return xAxisName;
	}
	public void setxAxisName(String xAxisName) {
		this.xAxisName = xAxisName;
	}
	public String getxAxisUnit() {
		return xAxisUnit!=null?xAxisUnit:"";
	}
	public void setxAxisUnit(String xAxisUnit) {
		this.xAxisUnit = xAxisUnit;
	}
	public String getyAxisName() {
		return yAxisName;
	}
	public void setyAxisName(String yAxisName) {
		this.yAxisName = yAxisName;
	}
	public String getyAxisUnit() {
		return yAxisUnit!=null?yAxisUnit:"";
	}
	public void setyAxisUnit(String yAxisUnit) {
		this.yAxisUnit = yAxisUnit;
	}
}
