package com.ogpis.track.ogpis.plan.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.plan.entity.base.Plan_IndexEntity;

@Entity
@Table(name = "ogpis_plan_index")
public class Plan_Index extends Plan_IndexEntity implements Comparable {

	@Override
	public int compareTo(Object o) {
		Plan_Index plan_index = (Plan_Index)o;
		return this.getIndex().getPriority().compareTo(plan_index.getIndex().getPriority());
	}
	
	

}
