package com.ogpis.data.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.data.entity.base.BaseDimensionValue;

@Entity
@Table(name = "ogpis_DimensionValue")
public class DimensionValue extends BaseDimensionValue implements Comparable{

	@Override
	public int compareTo(Object o){
		DimensionValue dimensionValue=(DimensionValue) o;
		return this.getPriority().compareTo(dimensionValue.getPriority());
	}
}
