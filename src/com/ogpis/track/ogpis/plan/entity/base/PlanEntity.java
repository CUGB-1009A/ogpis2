package com.ogpis.track.ogpis.plan.entity.base;

import java.util.Date;
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
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.document.entity.PlanDocument;
import com.ogpis.track.ogpis.index.entity.IndexManagement;
import com.ogpis.track.ogpis.plan.entity.Plan_Index;
import com.ogpis.track.ogpis.system.entity.User;

/**
 * 规划信息的基类，定义了规划信息的公有字段
 * 
 * @author Danny
 */
@MappedSuperclass
public class PlanEntity extends BaseEntity {

	@Column(name = "规划名称")
	protected String planName;

	@Column(name = "规划代号")
	protected String planCode;
	
	@Column(name = "发布单位")
	protected String releaseUnit;
	
	@Column(name = "是否已发布")
	protected boolean released;

	//指规划实际发文的时间
	@Column(name = "发布时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	protected Date releaseDate;

	// 这个是指是全国、各大石油公司、其他规划；还是以后从其他维度的规划
	@Column(name = "规划开始时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	protected Date startTime;
	
	@Column(name = "规划结束时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	protected Date endTime;
	
	//这个是指是全国、各大石油公司、其他规划；还是以后从其他维度的规划
	@Column(name = "规划类型")
	protected String planType;
	
	@Column(columnDefinition="TEXT",name="规划概述")
	protected String planShortDescription;
	
	@Column(name="目标和总体完成情况")
	protected String targetAndFinished;
	
	//指规划的依据和背景，clob类型
	@Column(columnDefinition="TEXT", name = "规划描述")
	protected String planDescription;
	
	@Column(columnDefinition="TEXT",name = "储量完成情况描述")
	protected String storageDescription;

	@Column(columnDefinition="TEXT",name = "产量完成情况描述")
	protected String outputDescription;
	
	@OneToMany(fetch=FetchType.LAZY,cascade = { CascadeType.ALL }, mappedBy = "plan")
	protected Set<PlanDocument> planDocument;


	@Deprecated
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, mappedBy = "plan")
	protected List<IndexManagement> index;

	// 规划对应被哪些用户收藏 many-to-many
	@ManyToMany(targetEntity = User.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_plan", joinColumns = @JoinColumn(name = "PLAN_ID"), inverseJoinColumns = @JoinColumn(name = "USER_ID"))
	protected Set<User> users = new HashSet<User>();

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPlanCode() {
		return planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

	public String getReleaseUnit() {
		return releaseUnit;
	}

	public void setReleaseUnit(String releaseUnit) {
		this.releaseUnit = releaseUnit;
	}

	public boolean isReleased() {
		return released;
	}

	public void setReleased(boolean released) {
		this.released = released;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getPlanDescription() {
		return planDescription;
	}

	public void setPlanDescription(String planDescription) {
		this.planDescription = planDescription;
	}
	
	public String getStorageDescription() {
		return storageDescription;
	}

	public void setStorageDescription(String storageDescription) {
		this.storageDescription = storageDescription;
	}

	public String getOutputDescription() {
		return outputDescription;
	}

	public void setOutputDescription(String outputDescription) {
		this.outputDescription = outputDescription;
	}

	public Set<PlanDocument> getPlanDocument() {
		return planDocument;
	}

	public void setPlanDocument(Set<PlanDocument> planDocument) {
		this.planDocument = planDocument;
	}
	
	public String getPlanShortDescription() {
		return planShortDescription;
	}

	public void setPlanShortDescription(String planShortDescription) {
		this.planShortDescription = planShortDescription;
	}

	public String getTargetAndFinished() {
		return targetAndFinished;
	}

	public void setTargetAndFinished(String targetAndFinished) {
		this.targetAndFinished = targetAndFinished;
	}

	@Deprecated
	public List<IndexManagement> getIndex() {
		return index;
	}
	@Deprecated
	public void setIndex(List<IndexManagement> index) {
		this.index = index;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	@OneToMany(mappedBy = "plan",fetch = FetchType.LAZY,targetEntity=Plan_Index.class)
	private List<Plan_Index> plan_indexs;


	/**
	 * @return the plan_indexs
	 */
	public List<Plan_Index> getPlan_indexs() {
		return plan_indexs;
	}

	/**
	 * @param plan_indexs
	 *            the plan_indexs to set
	 */
	public void setPlan_indexs(List<Plan_Index> plan_indexs) {
		this.plan_indexs = plan_indexs;
	}


}
