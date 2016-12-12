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
import com.ogpis.forecast.entity.ModelInfo;

@MappedSuperclass
public class BaseDataCollection extends BaseEntity{
	
	@Column(name = "数据集名称")
	private String dataCollectionName;
	
	@Column(name = "服务接口")
	private String url;
	
	@Column(name = "数据集类别")
	private String dataCollectionType;
	
	@Deprecated
	@ManyToMany(targetEntity = ModelInfo.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_DataCollection_ModelInfo", joinColumns = @JoinColumn(name = "DataCollection_ID"), inverseJoinColumns = @JoinColumn(name = "ModelInfo_ID"))
	protected List<ModelInfo> modelInfo = new ArrayList<ModelInfo>();

	public String getDataCollectionName() {
		return dataCollectionName;
	}

	public void setDataCollectionName(String dataCollectionName) {
		this.dataCollectionName = dataCollectionName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDataCollectionType() {
		return dataCollectionType;
	}

	public void setDataCollectionType(String dataCollectionType) {
		this.dataCollectionType = dataCollectionType;
	}

	public List<ModelInfo> getModelInfo() {
		return modelInfo;
	}

	public void setModelInfo(List<ModelInfo> modelInfo) {
		this.modelInfo = modelInfo;
	}
	
	

}
