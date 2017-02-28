package com.ogpis.forecast.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.forecast.dao.PeriodDefinitionDao;
import com.ogpis.forecast.entity.ModelInfo;
import com.ogpis.forecast.entity.PeriodDefinition;

import net.sf.json.JSONArray;

@Repository
public class PeriodDefinitionDaoImpl extends HibernateBaseDao<PeriodDefinition, String> implements PeriodDefinitionDao{



	@Override
	public List<PeriodDefinition> findAll() {
		String hql = "From PeriodDefinition where deleted=false";
		@SuppressWarnings("unchecked")
		List<PeriodDefinition> periodDefinitionList = this.find(hql,null);
		String sql = "select * from qgdncl where YearName >1955";
		JSONArray jsonArray = JSONArray.fromObject(getSession().createSQLQuery(sql).list());
		System.out.println(jsonArray.toString());
		return periodDefinitionList;
	}

	@Override
	protected Class<PeriodDefinition> getEntityClass() {
		return PeriodDefinition.class;
	}

}
