package com.ogpis.plan.entity.base;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;

@MappedSuperclass
public class Plan_IndexEntity extends BaseEntity{
	@ManyToOne
    @JoinColumn(name = "Plan_Id")
	private Plan plan;

	@ManyToOne
    @JoinColumn(name = "Index_Id")
	private IndexManagement index;
	
	/**
	 * 目标值
	 */
	private float targetValue;
	

	/**
	 * 指标完成情况
	 */
	private String indexPerformance;
	
	/**
	 * 历史数据描述
	 */
	private String HistoryDescription;
	
	public String getHistoryDescription() {
		return HistoryDescription;
	}

	public void setHistoryDescription(String historyDescription) {
		HistoryDescription = historyDescription;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public IndexManagement getIndex() {
		return index;
	}

	public void setIndex(IndexManagement index) {
		this.index = index;
	}

	public float getTargetValue() {
		return targetValue;
	}

	public void setTargetValue(float targetValue) {
		this.targetValue = targetValue;
	}

	public String getIndexPerformance() {
		return indexPerformance;
	}

	public void setIndexPerformance(String indexPerformance) {
		this.indexPerformance = indexPerformance;
	}

}
