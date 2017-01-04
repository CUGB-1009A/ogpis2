package com.ogpis.track.ogpis.index.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.index.entity.base.IndexManagementEntity2;
import com.ogpis.track.ogpis.plan.entity.Plan_Index2;

@Entity
@Table(name = "ogpis_index")
public class IndexManagement2 extends IndexManagementEntity2 {

	@SuppressWarnings("unchecked")
	public List<IndexDataManagement2> getOrderedIndexData(){
		List<IndexDataManagement2> list = (List<IndexDataManagement2>) this.getIndexData();
		Collections.sort(list);
		return list;
	}
	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		IndexManagement2 indexManagement=(IndexManagement2)o;
		return this.getPriority().compareTo(indexManagement.getPriority());
	}
}
