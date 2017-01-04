package com.ogpis.track.ogpis.index.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.index.entity.base.IndexManagementEntity;
import com.ogpis.track.ogpis.plan.entity.Plan_Index;

@Entity
@Table(name = "ogpis_index")
public class IndexManagement extends IndexManagementEntity {

	@SuppressWarnings("unchecked")
	public List<IndexDataManagement> getOrderedIndexData(){
		List<IndexDataManagement> list = (List<IndexDataManagement>) this.getIndexData();
		Collections.sort(list);
		return list;
	}
	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		IndexManagement indexManagement=(IndexManagement)o;
		return this.getPriority().compareTo(indexManagement.getPriority());
	}
}
