package com.ogpis.forecast.entity.base;

import java.util.ArrayList;
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
public class BaseSelfDataCollection extends BaseEntity{

	@Column(name = "数据集名称")
	private String dataCollectionName;
	
	@Column(name = "数据集类别")
	private String dataCollectionType;
	
	@Column(name = "是否共享")
	private boolean shared;
	
	@OneToMany(targetEntity = SelfData.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_SelfDataCollection_SelfData",joinColumns = @JoinColumn(name = "SelfDataCollectionId"),inverseJoinColumns = @JoinColumn(name = "SelfDataId"))
	protected List<SelfData> selfData = new ArrayList<SelfData>();
	
	@ManyToOne(targetEntity = User.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_User_SelfDataCollection",joinColumns = @JoinColumn(name = "SelfDataCollection_Id"),inverseJoinColumns = @JoinColumn(name = "User_Id"))
	protected User user ;
	
	
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

	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

}
