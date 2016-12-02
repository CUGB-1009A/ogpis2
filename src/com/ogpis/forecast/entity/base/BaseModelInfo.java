package com.ogpis.forecast.entity.base;

import java.util.HashSet;
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
	
	@ManyToMany(targetEntity = DataCollection.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_DataCollection_ModelInfo", joinColumns = @JoinColumn(name = "ModelInfo_ID"), inverseJoinColumns = @JoinColumn(name = "DataCollection_ID"))
	protected Set<DataCollection> dataCollection = new HashSet<DataCollection>();
	
	@ManyToMany(targetEntity = PEM.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_ModelInfo_PEM", joinColumns = @JoinColumn(name = "ModelInfo_ID"), inverseJoinColumns = @JoinColumn(name = "PEM_ID"))
	protected Set<PEM> pem = new HashSet<PEM>();

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

	public Set<DataCollection> getDataCollection() {
		return dataCollection;
	}

	public void setDataCollection(Set<DataCollection> dataCollection) {
		this.dataCollection = dataCollection;
	}

	public Set<PEM> getPem() {
		return pem;
	}

	public void setPem(Set<PEM> pem) {
		this.pem = pem;
	}
	
}
