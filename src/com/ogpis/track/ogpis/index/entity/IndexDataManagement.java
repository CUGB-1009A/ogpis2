package com.ogpis.track.ogpis.index.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.index.entity.base.IndexDataManagementEntity;

@Entity
@Table(name = "ogpis_indexData")
public class IndexDataManagement extends IndexDataManagementEntity implements Comparable {

	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		IndexDataManagement indexDataManagement=(IndexDataManagement)o;
		return this.getCollectedTime().compareTo(indexDataManagement.getCollectedTime());
	}
}
