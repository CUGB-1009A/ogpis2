package com.ogpis.forecast.entity;

import java.util.Collections;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.forecast.entity.base.BaseSelfDataCollection;

@Entity
@Table(name = "ogpis_SelfDataCollection")
public class SelfDataCollection extends BaseSelfDataCollection{
	
	@SuppressWarnings("unchecked")
	public List<SelfData> getOrderedSelfData(){
		List<SelfData> list = (List<SelfData>) this.getSelfData();
		Collections.sort(list);
		return list;
	}
		
	
}
