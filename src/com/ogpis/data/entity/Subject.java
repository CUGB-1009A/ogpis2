package com.ogpis.data.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.data.entity.base.BaseSubject;

@Entity
@Table(name = "ogpis_Subject")
public class Subject extends BaseSubject implements Comparable{

	@Override
	public int compareTo(Object o) {
		Subject subject=(Subject) o;
		return this.getPriority().compareTo(subject.getPriority());
	}
	
	@SuppressWarnings("unchecked")
	public List<Dimension> getOrederdDimension() {
		List<Dimension> list=(List<Dimension>)this.getDimension();
		Collections.sort(list);
		return list;
	}

}
