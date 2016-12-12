package com.ogpis.forecast.entity.base;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.ModelInfo;

@Deprecated
@MappedSuperclass
public class BasePEM extends BaseEntity{
	
	@Column(name = "参数拟合方法名")
	private String pemName;
	
	@Column(name = "方法编号")
	private String methodNum;
	
	@ManyToMany(targetEntity = ModelInfo.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_ModelInfo_PEM", joinColumns = @JoinColumn(name = "PEM_ID"), inverseJoinColumns = @JoinColumn(name = "ModelInfo_ID"))
	protected List<ModelInfo> modelInfo = new ArrayList<ModelInfo>();

	public String getPemName() {
		return pemName;
	}

	public void setPemName(String pemName) {
		this.pemName = pemName;
	}
	
	public String getMethodNum() {
		return methodNum;
	}

	public void setMethodNum(String methodNum) {
		this.methodNum = methodNum;
	}

	public List<ModelInfo> getModelInfo() {
		return modelInfo;
	}

	public void setModelInfo(List<ModelInfo> modelInfo) {
		this.modelInfo = modelInfo;
	}
}
