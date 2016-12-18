package com.ogpis.forecast.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class BaseForecastRecord extends BaseEntity {
	
	@Column(name = "预测成果名称")
	private String forecastName;
	
	@Column(name = "预测步骤名称")
	private String forecastStep;
	
	@Column(name = "共享状态")
	private boolean shared;
	
	@Column(name = "用户id")
	private String userId;
	
	@Column(name = "成果路径")
	private String xmlUrl;
	
	@Column(name = "预测类型id")
	

	public String getForecastName() {
		return forecastName;
	}

	public void setForecastName(String forecastName) {
		this.forecastName = forecastName;
	}

	public String getForecastStep() {
		return forecastStep;
	}

	public void setForecastStep(String forecastStep) {
		this.forecastStep = forecastStep;
	}

	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getXmlUrl() {
		return xmlUrl;
	}

	public void setXmlUrl(String xmlUrl) {
		this.xmlUrl = xmlUrl;
	}

	
	
}
