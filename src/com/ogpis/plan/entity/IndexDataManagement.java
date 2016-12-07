package com.ogpis.plan.entity;

import com.ogpis.plan.entity.base.IndexDataManagementEntity;

public class IndexDataManagement extends IndexDataManagementEntity implements Comparable{
	
	public int compareTo(Object o){
		IndexDataManagement indexDataManagement=(IndexDataManagement) o;
		return this.getCollectedTime().compareTo(indexDataManagement.getCollectedTime());
	}
}
