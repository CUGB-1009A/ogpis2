package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.forecast.entity.base.BaseSelfData;


@Entity
@Table(name = "ogpis_SelfData")
public class SelfData extends BaseSelfData 	implements Comparable{

	@Override
	public int compareTo(Object o) {
		SelfData selfData = (SelfData)o;
		return this.getYear().compareTo(selfData.getYear());
	}


	}

	
