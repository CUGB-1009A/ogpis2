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
import com.ogpis.forecast.entity.ModelInfo;

@MappedSuperclass
public class BasePEM extends BaseEntity{
	
	@Column(name = "参数拟合方法名")
	private String pemName;
	
	@ManyToMany(targetEntity = ModelInfo.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_ModelInfo_PEM", joinColumns = @JoinColumn(name = "PEM_ID"), inverseJoinColumns = @JoinColumn(name = "ModelInfo_ID"))
	protected Set<ModelInfo> modelInfo = new HashSet<ModelInfo>();

	public String getPemName() {
		return pemName;
	}

	public void setPemName(String pemName) {
		this.pemName = pemName;
	}

	public Set<ModelInfo> getModelInfo() {
		return modelInfo;
	}

	public void setModelInfo(Set<ModelInfo> modelInfo) {
		this.modelInfo = modelInfo;
	}
}
