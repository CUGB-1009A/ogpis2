package com.ogpis.plan.entity.base;

import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import org.springframework.format.annotation.DateTimeFormat;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.plan.entity.IndexManagement;

@MappedSuperclass
public class IndexDataManagementEntity extends BaseEntity {
	
	/**
	 * 对应指标ID
	 */
	@ManyToOne
	@JoinColumn(name="IndexId")
	protected IndexManagement index;
	/**
	 * 采集时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	protected Date CollectedTime;
	/**
	 * 指标的完成量
	 */
	protected float FinishedWorkload;
	
	public IndexManagement getIndex() {
		return index;
	}
	public void setIndex(IndexManagement index) {
		this.index = index;
	}
	public Date getCollectedTime() {
		return CollectedTime;
	}
	public void setCollectedTime(Date collectedTime) {
		CollectedTime = collectedTime;
	}
	public float getFinishedWorkload() {
		return FinishedWorkload;
	}
	public void setFinishedWorkload(float finishedWorkload) {
		FinishedWorkload = finishedWorkload;
	}
	
	
}
