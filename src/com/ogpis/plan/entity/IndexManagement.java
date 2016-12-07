package com.ogpis.plan.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.plan.entity.base.IndexManagementEntity;


@Entity
@Table(name="ogpis_index")
public class IndexManagement extends IndexManagementEntity {
	@SuppressWarnings("unchecked")
	public List<IndexDataManagement> getOrderedIndexData(){
		List<IndexDataManagement> list=this.getIndexData();
		Collections.sort(list);
		return list;
	}
	
	public int compareTo(Object o){
		IndexManagement indexManagement=(IndexManagement) o;
		return this.getPriority().compareTo(indexManagement.getPriority());
	}
}
