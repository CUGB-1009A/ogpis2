package com.ogpis.forecast.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.dao.ForecastRecordDao;
import com.ogpis.forecast.entity.ForecastRecord;
import com.ogpis.forecast.entity.ForecastType;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Repository
public class ForecastRecordDaoImpl extends HibernateBaseDao<ForecastRecord, String> implements ForecastRecordDao{

	@Override
	protected Class<ForecastRecord> getEntityClass() {
		return ForecastRecord.class;
	}

	@Override
	public Pagination getRecordByUserId(String userId,boolean finished, int pageNo, Integer pageSize) {
		Finder f = Finder.create("select bean from ForecastRecord bean where bean.deleted=false and bean.isFinished="+finished+" and bean.user.id='"+userId+"'");
		return find(f,pageNo,pageSize);
	}

	@Override
	public ForecastRecord findById(String id) {
		ForecastRecord entity = get(id);
		return entity;
	}

	@Override
	public void delete(ForecastRecord forecastRecord) {
		getSession().delete(forecastRecord);
		
	}

	@Override
	public void save(ForecastRecord forecastRecord) {
		getSession().merge(forecastRecord);
		
	}

	@Override
	public List<ForecastRecord> findByName(String name) {
		String hql = "From ForecastRecord where forecastName='"+name+"'";
		@SuppressWarnings("unchecked")
		List<ForecastRecord> forecastRecord = this.find(hql, null);
		return forecastRecord;
	}

	@Override
	public JSONArray getHistoryData(String sql) {
		return JSONArray.fromObject(getSession().createSQLQuery(sql).list());
	}

}
