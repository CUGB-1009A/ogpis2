package com.ogpis.data.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.data.entity.base.BaseDimension;

@Entity
@Table(name = "ogpis_Dimension")
public class Dimension extends BaseDimension implements Comparable{

	@Override
		public int compareTo(Object o){
			Dimension dimension=(Dimension) o;
			return this.getPriority().compareTo(dimension.getPriority());
		}

	@SuppressWarnings("unchecked")
	public List<Subject> getOrederdSubject() {
		List<Subject> list=(List<Subject>)this.getSubject();
		Collections.sort(list);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<DimensionValue> getOrederdDimensionValue() {
		List<DimensionValue> list=(List<DimensionValue>)this.getDimensionValue();
		Collections.sort(list);
		return list;
	}
}
