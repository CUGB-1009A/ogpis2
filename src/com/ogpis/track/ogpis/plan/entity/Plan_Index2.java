package com.ogpis.track.ogpis.plan.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.plan.entity.base.Plan_IndexEntity2;

@Entity
@Table(name = "ogpis_plan_index")
public class Plan_Index2 extends Plan_IndexEntity2 implements Comparable {

	@Override
	public int compareTo(Object o) {
		Plan_Index2 plan_index = (Plan_Index2)o;
		return this.getIndex().getPriority().compareTo(plan_index.getIndex().getPriority());
	}
	
	

}
