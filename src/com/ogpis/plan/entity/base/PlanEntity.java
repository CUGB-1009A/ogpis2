package com.ogpis.plan.entity.base;

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

import org.apache.catalina.User;
import org.hibernate.annotations.Cascade;
import org.springframework.format.annotation.DateTimeFormat;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.PlanDocument;
import com.ogpis.plan.entity.Plan_Index;
/**
 * 规划信息的基类，定义了规划信息的公有字段
 * @author AA
 *
 */
@MappedSuperclass
public class PlanEntity extends BaseEntity {
	/**
	 * 规划名称
	 */
	protected String PlanName;
	/**
	 * 规划代号
	 */
	protected String PlanCode;
	/**
	 * 发布单位
	 */
	protected String ReleaseUnit;
	/**
	 * 是否发布
	 */
	protected boolean released;
	/**
	 * 发布时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	protected Date ReleasedDate;
	/**
	 * 规划开始时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	protected Date StartTime;
	/**
	 * 规划结束时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	protected Date Endtime;
	/**
	 * 规划类型：指全国、石油公司、其他规划等
	 */
	protected String PlanType;
	/**
	 * 规划概述
	 */
	@Column(columnDefinition="CLOB")
	protected String PlanShortDescription;
	/**
	 * 目标和总体完成情况
	 */
	@Column(columnDefinition="CLOB")
	protected String TargetAndFinished;
	/**
	 * 规划描述
	 */
	@Column(columnDefinition="CLOB")
	protected String PlanDescription;
	/**
	 * 储量完成情况描述
	 */
	@Column(columnDefinition="CLOB")
	protected String StorageDescription;
	/**
	 * 产量完成情况描述
	 */
	@Column(columnDefinition="CLOB")
	protected String OutputDescription;
	/**
	 * 规划文档
	 */
	@OneToMany(fetch=FetchType.LAZY,cascade={CascadeType.ALL},mappedBy="plan")
	protected Set<PlanDocument> planDocument;
	/**
	 * 规划对应的指标
	 */
	@OneToMany(fetch=FetchType.LAZY,cascade={CascadeType.ALL},mappedBy="plan")
	protected List<IndexManagement> index;
	/**
	 * 规划对应被哪些用户收藏 many-to-many
	 */
	@ManyToMany(targetEntity=User.class,cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinTable(name="ogpis_user_plan",joinColumns=@JoinColumn(name="Plan_Id"),inverseJoinColumns=@JoinColumn(name="User_Id"))
	protected Set<User> users=new HashSet<User>();
	
	/**
	 * 规划所拥有的指标
	 */
	@OneToMany(targetEntity=Plan_Index.class,mappedBy="plan",fetch=FetchType.LAZY)
	private List<Plan_Index> plan_Indexs;

	public String getPlanName() {
		return PlanName;
	}

	public void setPlanName(String planName) {
		PlanName = planName;
	}

	public String getPlanCode() {
		return PlanCode;
	}

	public void setPlanCode(String planCode) {
		PlanCode = planCode;
	}

	public String getReleaseUnit() {
		return ReleaseUnit;
	}

	public void setReleaseUnit(String releaseUnit) {
		ReleaseUnit = releaseUnit;
	}

	public boolean isReleased() {
		return released;
	}

	public void setReleased(boolean released) {
		this.released = released;
	}

	public Date getReleasedDate() {
		return ReleasedDate;
	}

	public void setReleasedDate(Date releasedDate) {
		ReleasedDate = releasedDate;
	}

	public Date getStartTime() {
		return StartTime;
	}

	public void setStartTime(Date startTime) {
		StartTime = startTime;
	}

	public Date getEndtime() {
		return Endtime;
	}

	public void setEndtime(Date endtime) {
		Endtime = endtime;
	}

	public String getPlanType() {
		return PlanType;
	}

	public void setPlanType(String planType) {
		PlanType = planType;
	}

	public String getPlanShortDescription() {
		return PlanShortDescription;
	}

	public void setPlanShortDescription(String planShortDescription) {
		PlanShortDescription = planShortDescription;
	}

	public String getTargetAndFinished() {
		return TargetAndFinished;
	}

	public void setTargetAndFinished(String targetAndFinished) {
		TargetAndFinished = targetAndFinished;
	}

	public String getPlanDescription() {
		return PlanDescription;
	}

	public void setPlanDescription(String planDescription) {
		PlanDescription = planDescription;
	}

	public String getStorageDescription() {
		return StorageDescription;
	}

	public void setStorageDescription(String storageDescription) {
		StorageDescription = storageDescription;
	}

	public String getOutputDescription() {
		return OutputDescription;
	}

	public void setOutputDescription(String outputDescription) {
		OutputDescription = outputDescription;
	}

	public Set<PlanDocument> getPlanDocument() {
		return planDocument;
	}

	public void setPlanDocument(Set<PlanDocument> planDocument) {
		this.planDocument = planDocument;
	}

	public List<IndexManagement> getIndex() {
		return index;
	}

	public void setIndex(List<IndexManagement> index) {
		this.index = index;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public List<Plan_Index> getPlan_Indexs() {
		return plan_Indexs;
	}

	public void setPlan_Indexs(List<Plan_Index> plan_Indexs) {
		this.plan_Indexs = plan_Indexs;
	} 
	
	
}
