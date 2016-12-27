package com.ogpis.forecast.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.forecast.dao.SelfDataDao;
import com.ogpis.forecast.entity.SelfData;

@Repository
public class SelfDataDaoImpl extends HibernateBaseDao<SelfData, String> implements SelfDataDao{



@Override
protected Class<SelfData> getEntityClass() {
	return SelfData.class;
}

@Override
public void save(List<SelfData> selfDataList) {
	for(SelfData temp:selfDataList)
		getSession().merge(temp);
}

@Override
public void delete(List<SelfData> selfDataList) {
	for(SelfData temp:selfDataList){
		temp.setDataCollection(null);
		getSession().merge(temp);
		getSession().delete(super.get(temp.getId()));
	}	
}

}
