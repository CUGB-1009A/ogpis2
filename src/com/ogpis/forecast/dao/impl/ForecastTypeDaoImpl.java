package com.ogpis.forecast.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.forecast.dao.ForecastTypeDao;
import com.ogpis.forecast.entity.ForecastType;
import com.ogpis.forecast.entity.ModelInfo;

@Repository
public class ForecastTypeDaoImpl extends HibernateBaseDao<ForecastType, String> implements ForecastTypeDao{

	@Override
	protected Class<ForecastType> getEntityClass() {
		return ForecastType.class;
	}

	@Override
	public List<ForecastType> findAll() {
		String hql = "From ForecastType where deleted=false";
		@SuppressWarnings("unchecked")
		List<ForecastType> forecastTypeList = this.find(hql, null);
		return forecastTypeList;
	}

	@Override
	public ForecastType findById(String forecastTypeId) {
		return super.get(forecastTypeId);
	}

}
