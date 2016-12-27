package com.ogpis.forecast.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.forecast.dao.PeriodDefinitionDao;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.entity.PeriodDefinition;

@Repository
public class PeriodDefinitionDaoImpl extends HibernateBaseDao<PeriodDefinition, String> implements PeriodDefinitionDao{



	@Override
	public List<PeriodDefinition> findAll() {
		String hql = "From PeriodDefinition where deleted=false";
		@SuppressWarnings("unchecked")
		List<PeriodDefinition> periodDefinitionList = this.find(hql,null);
		return periodDefinitionList;
	}

	@Override
	protected Class<PeriodDefinition> getEntityClass() {
		return PeriodDefinition.class;
	}

}
