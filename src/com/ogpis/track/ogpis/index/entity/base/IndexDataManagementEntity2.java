package com.ogpis.track.ogpis.index.entity.base;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import org.springframework.format.annotation.DateTimeFormat;
import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;


@MappedSuperclass
public class IndexDataManagementEntity2 extends BaseEntity {
	@ManyToOne
	@JoinColumn(name = "对应指标id")
	protected IndexManagement2 index;
	
	@Column(name = "采集时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	protected Date collectedTime;
	
	@Column(name = "完成量")
	protected float finishedWorkload ;
	
	public IndexManagement2 getIndex() {
		return index;
	}

	public void setIndex(IndexManagement2 index) {
		this.index = index;
	}

	public Date getCollectedTime(){
		
		return collectedTime;
	}

	public void setCollectedTime(Date collectedTime) {
		
		this.collectedTime = collectedTime;
	}

	public float getFinishedWorkload() {
		return finishedWorkload;
	}

	public void setFinishedWorkload(float finishedWorkload) {
		this.finishedWorkload = finishedWorkload;
	}

}
