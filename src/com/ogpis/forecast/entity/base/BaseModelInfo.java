package com.ogpis.forecast.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;



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
	
}
