package com.ogpis.forecast.entity.base;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.SelfData;

@MappedSuperclass
public class BaseSelfDataCollection extends BaseEntity{

	@Column(name = "数据集名称")
	private String dataCollectionName;
	
	@Column(name = "数据集类别")
	private String dataCollectionType;
	
	@Column(name = "是否共享")
	private boolean isShared;
	
	@OneToMany(targetEntity = SelfData.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_SelfDataCollection_SelfData",joinColumns = @JoinColumn(name = "SelfDataCollectionId"),inverseJoinColumns = @JoinColumn(name = "SelfDataId"))
	protected List<SelfData> selfData = new ArrayList<SelfData>();
	
	public String getDataCollectionName() {
		return dataCollectionName;
	}

	public void setDataCollectionName(String dataCollectionName) {
		this.dataCollectionName = dataCollectionName;
	}

	public String getDataCollectionType() {
		return dataCollectionType;
	}

	public void setDataCollectionType(String dataCollectionType) {
		this.dataCollectionType = dataCollectionType;
	}
	
	public boolean isShared() {
		return isShared;
	}

	public void setShared(boolean isShared) {
		this.isShared = isShared;
	}

}
