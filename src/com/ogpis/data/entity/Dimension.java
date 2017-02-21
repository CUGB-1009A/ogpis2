package com.ogpis.data.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.data.entity.base.BaseDimension;

@Entity
@Table(name = "ogpis_Dimension")
public class Dimension extends BaseDimension implements Comparable{
	
	@SuppressWarnings("unchecked")
	public List<DimensionValue> getOrederdDimensionValue() {
		List<DimensionValue> list=(List<DimensionValue>)this.getDimensionValues();
		Collections.sort(list);
		return list;
	}

	@Override
	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}
}
