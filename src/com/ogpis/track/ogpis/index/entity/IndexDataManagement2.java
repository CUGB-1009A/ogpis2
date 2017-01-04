package com.ogpis.track.ogpis.index.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.index.entity.base.IndexDataManagementEntity2;

@Entity
@Table(name = "ogpis_indexData")
public class IndexDataManagement2 extends IndexDataManagementEntity2 implements Comparable {

	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		IndexDataManagement2 indexDataManagement=(IndexDataManagement2)o;
		return this.getCollectedTime().compareTo(indexDataManagement.getCollectedTime());
	}
}
