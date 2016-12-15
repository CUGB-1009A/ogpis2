package com.ogpis.forecast.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.forecast.entity.base.BaseDataCollection;

@Entity
@Table(name = "ogpis_DataCollection")
public class DataCollection extends BaseDataCollection{
	
	@SuppressWarnings("unchecked")
	public List<SelfData> getOrderedSelfData(){
		List<SelfData> list = (List<SelfData>) this.getSelfData();
		Collections.sort(list);
		return list;
	}

}
