package com.ogpis.forecast.entity.base;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.SelfData;
import com.ogpis.system.entity.User;

@MappedSuperclass
public class BaseDataCollection extends BaseEntity{
	
	@Column(name = "数据集名称")
	private String dataCollectionName;
	
	@Column(name = "服务接口")
	private String url;
	
	@Column(name = "数据集类别")
	private String dataCollectionType;
	
	@Column(name = "是否是原始数据集")
	private boolean isOrigin;
	
	@Column(name = "是否共享")
	private boolean isShared;
	
	@Column(name = "父数据源ID")
	private String fatherId;
	
	@OneToMany(targetEntity = SelfData.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_DataCollection_SelfData",joinColumns = @JoinColumn(name = "DataCollection_ID"), inverseJoinColumns = @JoinColumn(name = "SelfData_ID"))
	protected List<SelfData> selfData;
	
	@ManyToOne(targetEntity = User.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_User_DataCollection",joinColumns = @JoinColumn(name = "DataCollection_ID"), inverseJoinColumns = @JoinColumn(name = "User_ID"))
	protected User user;

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

	public List<SelfData> getSelfData() {
		return selfData;
	}

	public void setSelfData(List<SelfData> selfData) {
		this.selfData = selfData;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFatherId() {
		return fatherId;
	}

	public void setFatherId(String fatherId) {
		this.fatherId = fatherId;
	}

	public boolean isOrigin() {
		return isOrigin;
	}

	public void setOrigin(boolean isOrigin) {
		this.isOrigin = isOrigin;
	}

	public boolean isShared() {
		return isShared;
	}

	public void setShared(boolean isShared) {
		this.isShared = isShared;
	}
}
