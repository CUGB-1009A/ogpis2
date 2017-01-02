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
	
	@Column(name = "模型名称")
	private String modelName;
	
	@Column(name = "Jar包名")
	private String jarName;
	
	@Column(name = "类名")
	private String className;
	
	@Column(name = "模型描述",columnDefinition="Text")
	private String modelDescription;
	
	@Column(name = "拟合方法")
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

	public String getJarName() {
		return jarName;
	}

	public void setJarName(String jarName) {
		this.jarName = jarName;
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
