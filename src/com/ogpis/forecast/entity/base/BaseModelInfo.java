package com.ogpis.forecast.entity.base;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.DataCollection;
import com.ogpis.forecast.entity.PEM;

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
	
	@Deprecated
	@ManyToMany(targetEntity = DataCollection.class, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_DataCollection_ModelInfo", joinColumns = @JoinColumn(name = "ModelInfo_ID"), inverseJoinColumns = @JoinColumn(name = "DataCollection_ID"))
	protected List<DataCollection> dataCollection = new ArrayList<DataCollection>();
	
	@Deprecated
	@ManyToMany(targetEntity = PEM.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_ModelInfo_PEM", joinColumns = @JoinColumn(name = "ModelInfo_ID"), inverseJoinColumns = @JoinColumn(name = "PEM_ID"))
	protected List<PEM> pem = new ArrayList<PEM>();

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

	public List<DataCollection> getDataCollection() {
		return dataCollection;
	}

	public void setDataCollection(List<DataCollection> dataCollection) {
		this.dataCollection = dataCollection;
	}

	public List<PEM> getPem() {
		return pem;
	}

	public void setPem(List<PEM> pem) {
		this.pem = pem;
	}

	public String getModelDescription() {
		return modelDescription;
	}

	public void setModelDescription(String modelDescription) {
		this.modelDescription = modelDescription;
	}
	
}
