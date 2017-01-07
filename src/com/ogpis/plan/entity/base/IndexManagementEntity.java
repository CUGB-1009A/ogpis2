package com.ogpis.plan.entity.base;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;


import com.ogpis.base.entity.BaseEntity;
import com.ogpis.plan.entity.IndexDataManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;

@MappedSuperclass
public class IndexManagementEntity extends BaseEntity{
	public static final String FREQUENCY_YEAR = "year";
	public static final String FREQUENCY_QUARTER="quarter";
	public static final String FREQUENCY_MONTH="month";
	
	/**
	 * 指标名称
	 */
	protected String IndexName;
	/**
	 * 矿种类型：石油、天然气、煤层气、页岩气、其他 五类矿种
	 * 指标：二维地震、三维地震、探井井数、探井进尺、开发井井数、开发井进尺
	 * 	   石油、天然气(含致密气)、页岩气、煤层气
	 * 	 勘探投资、开发投资
	 * 	 二维地震、三维地震、钻井、油气发现
	 */
	protected String MineType;
	/**
	 * 指标类型：1为储量；2为产量
	 */
	protected String IndexType;
	/**
	 * 该指标对应的规划：全国或其他公司
	 * 转为指标类型：工作量、新增探明地质储量、新建产能、产量、投资、成本
	 */
	protected String PlanType;
	/**
	 * 优先级
	 */
	protected String priority;
	/**
	 * 指标单位
	 */
	protected String IndexUnit;
	
	@OneToMany(mappedBy="index")
	protected Set<Plan_Index> plan_indexs;
	/**
	 * 指标采集频率
	 */
	protected String frequency;
	/**
	 * 
	 */
	@OneToMany(fetch=FetchType.LAZY,cascade={CascadeType.ALL},mappedBy="index")
	protected List<IndexDataManagement> IndexData;
	/**
	 * 是否需要跟踪
	 */
	protected String track;
	
	/**
	 * 目标值
	 */
	@Deprecated
	protected float IndexValue;
	
	@Deprecated
	@ManyToOne
	@JoinColumn(name="PlanId")
	protected Plan plan;

	public String getIndexName() {
		return IndexName;
	}

	public void setIndexName(String indexName) {
		IndexName = indexName;
	}

	public String getMineType() {
		return MineType;
	}

	public void setMineType(String mineType) {
		MineType = mineType;
	}

	public String getIndexType() {
		return IndexType;
	}

	public void setIndexType(String indexType) {
		IndexType = indexType;
	}

	public String getPlanType() {
		return PlanType;
	}

	public void setPlanType(String planType) {
		this.PlanType = planType;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getIndexUnit() {
		return IndexUnit;
	}

	public void setIndexUnit(String indexUnit) {
		IndexUnit = indexUnit;
	}

	public Set<Plan_Index> getPlan_indexs() {
		return plan_indexs;
	}

	public void setPlan_indexs(Set<Plan_Index> plan_indexs) {
		this.plan_indexs = plan_indexs;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public List<IndexDataManagement> getIndexData() {
		return IndexData;
	}

	public void setIndexData(List<IndexDataManagement> indexData) {
		IndexData = indexData;
	}

	public String getTrack() {
		return track;
	}

	public void setTrack(String track) {
		this.track = track;
	}

	public float getIndexValue() {
		return IndexValue;
	}

	public void setIndexValue(float indexValue) {
		IndexValue = indexValue;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public static String getFrequencyYear() {
		return FREQUENCY_YEAR;
	}

	public static String getFrequencyQuarter() {
		return FREQUENCY_QUARTER;
	}

	public static String getFrequencyMonth() {
		return FREQUENCY_MONTH;
	}
}
