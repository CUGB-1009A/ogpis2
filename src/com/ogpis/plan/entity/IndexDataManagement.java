package com.ogpis.plan.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.plan.entity.base.IndexDataManagementEntity;

@Entity
@Table(name="ogpis_indexData")

public class IndexDataManagement extends IndexDataManagementEntity implements Comparable{
	
	public int compareTo(Object o){
		IndexDataManagement indexDataManagement=(IndexDataManagement) o;
		return this.getCollectedTime().compareTo(indexDataManagement.getCollectedTime());
	}
}
