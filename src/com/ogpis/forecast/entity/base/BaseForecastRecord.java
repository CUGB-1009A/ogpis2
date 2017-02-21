package com.ogpis.forecast.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.ForecastType;
import com.ogpis.plan.entity.Plan;
import com.ogpis.system.entity.User;

@MappedSuperclass
public class BaseForecastRecord extends BaseEntity {
	
	@Column(name = "forecastName")
	private String forecastName;
	
	@Column(name = "forecastStep")
	private String forecastStep;
	
	@Column(name = "isShared")
	private boolean isShared;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	
	@Column(name = "xmlUrl")
	private String xmlUrl;
	
	@ManyToOne
	@JoinColumn(name = "forecastTypeId")
	private ForecastType forecastType;
	
	@Column(name = "isFinished")
	private boolean isFinished;
	
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getXmlUrl() {
		return xmlUrl;
	}

	public void setXmlUrl(String xmlUrl) {
		this.xmlUrl = xmlUrl;
	}

	public ForecastType getForecastType() {
		return forecastType;
	}

	public void setForecastType(ForecastType forecastType) {
		this.forecastType = forecastType;
	}

	public boolean isShared() {
		return isShared;
	}

	public void setShared(boolean isShared) {
		this.isShared = isShared;
	}

	public boolean isFinished() {
		return isFinished;
	}

	public void setFinished(boolean isFinished) {
		this.isFinished = isFinished;
	}

}
