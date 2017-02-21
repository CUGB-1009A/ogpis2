package com.ogpis.forecast.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.ForecastType;



@MappedSuperclass
public class BaseModelInfo extends BaseEntity{
	
	@Column(name = "modelName")
	private String modelName;
	
	@Column(name = "jarUrl")
	private String jarUrl;
	
	@Column(name = "className")
	private String className;
	
	@Column(name = "modelDescription",columnDefinition="Text")
	private String modelDescription;
	
	@Column(name = "pem")
	private String pem;
	
	@ManyToMany(targetEntity = ForecastType.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_ForecastType_ModelInfo",joinColumns = @JoinColumn(name = "ModelInfo_ID"), inverseJoinColumns = @JoinColumn(name = "ForecastType_ID"))
	protected List<ForecastType> forecastType ;

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getJarUrl() {
		return jarUrl;
	}

	public void setJarUrl(String jarUrl) {
		this.jarUrl = jarUrl;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getModelDescription() {
		return modelDescription;
	}

	public void setModelDescription(String modelDescription) {
		this.modelDescription = modelDescription;
	}

	public String getPem() {
		return pem;
	}

	public void setPem(String pem) {
		this.pem = pem;
	}

	public List<ForecastType> getForecastType() {
		return forecastType;
	}

	public void setForecastType(List<ForecastType> forecastType) {
		this.forecastType = forecastType;
	}
	
}
